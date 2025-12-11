import 'package:get/get.dart';
import '../../../../../api/ui_state.dart';
import '../../data/billpayment_repo.dart' show BillPaymentRepo;
import '../../data/billpayment_response.dart';


class BillPaymentController extends GetxController {
  final BillPaymentRepo repo = BillPaymentRepo();

  late final int serviceId;

  final numberListState = Rx<UiState<GetNumberList>>(UiState.none());

  RxList<Operators> finalProviderList = <Operators>[].obs;

  int stateId = 0;
  String state = "Delhi";
  String from = "Recharge";

  @override
  void onInit() {
    serviceId = Get.arguments;
    getNumberList();
    super.onInit();
  }

  getNumberList() {
    repo.getNumberListData(
      body: {},
      callback: (state) {
        state.when(
          loading: () => numberListState.value = UiState.loading(),

          success: (data) {
            numberListState.value = UiState.success(data);
            processOperators(data);
          },

          error: (msg) => numberListState.value = UiState.error(msg),

          none: () => numberListState.value = UiState.none(),
        );
      },
    );
  }

  void processOperators(GetNumberList data) {
    final List<Operators> operators = data.data?.operators ?? [];

    final local = <Operators>[];
    final other = <Operators>[];
    final result = <Operators>[];

    for (var op in operators) {
      if (op.opType == serviceId) {
        if (stateId != 0) {
          (op.stateID == stateId) ? local.add(op) : other.add(op);
        } else {
          other.add(op);
        }
      }
    }

    if (local.isNotEmpty) {
      result.add(
        Operators(header: "$state $from Provider", isHeader: true),
      );
      result.addAll(local);

      if (other.isNotEmpty) {
        result.add(
          Operators(header: "Other State $from Provider", isHeader: true),
        );
        result.addAll(other);
      }
    } else {
      if (other.isNotEmpty) {
        result.add(
          Operators(header: "$from Provider", isHeader: true),
        );
        result.addAll(other);
      }
    }

    finalProviderList.value = result;
  }
}
