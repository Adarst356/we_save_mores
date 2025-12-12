import 'package:get/get.dart';

import '../../../../../api/ui_state.dart';
import '../../data/billpayment_repo.dart';
import '../../data/billpayment_response.dart';

class ServiceProviderController extends GetxController{
  final BillPaymentRepo repo = BillPaymentRepo();

  late int serviceId;
  late String serviceName;

  final numberListState = Rx<UiState<GetNumberList>>(UiState.none());

  RxList<Operators> finalProviderList = <Operators>[].obs;

  int stateId = 0;
  String state = "Delhi";

  @override
  void onInit() {
    final args = Get.arguments;
    serviceId = args["serviceId"];
    serviceName = args["serviceName"].toString();

    print("Received serviceId: $serviceId");
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
        Operators(header: "$state $serviceName Provider", isHeader: true),
      );
      result.addAll(local);

      if (other.isNotEmpty) {
        result.add(
          Operators(header: "Other State $serviceName Provider", isHeader: true),
        );
        result.addAll(other);
      }
    } else {
      if (other.isNotEmpty) {
        result.add(
          Operators(header: "$serviceName Provider", isHeader: true),
        );
        result.addAll(other);
      }
    }

    finalProviderList.value = result;
  }
}