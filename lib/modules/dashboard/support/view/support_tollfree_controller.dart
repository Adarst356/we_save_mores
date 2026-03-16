import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart' show GetStorage;

import '../../../../api/ui_state.dart';
import '../../home/data/billpayment_response.dart';
import '../data/SupportListItem.dart';

class SupportTollFreeController extends GetxController{
  final GetStorage box = GetStorage();
  late int opType;
  final numberListState = Rx<UiState<GetNumberList>>(UiState.none());
  List<Operators> operators = [];
  RxList<Operators> operatorsList = <Operators>[].obs;


  @override
  void onInit() {
    final args = Get.arguments;
    opType = args["serviceId"];
    loadOperators();
    super.onInit();
  }

  void loadOperators() {
    final json = box.read("number_list_response");
    if (json != null) {
      final response = GetNumberList.fromJson(json);
      operators = response.data?.operators ?? [];
      operatorsList.assignAll(operators);
    }
  }

  List<SupportListItem> getSupportListItems(int opType) {
    List<SupportListItem> supportListItems = [];
    for (var op in operatorsList) {
      if (op.opType == opType && (op.tollFree?.isNotEmpty ?? false)) {
        supportListItems.add(
          SupportListItem(
            name: op.name ?? "",
            image: op.image ?? "",
            tollFree: op.tollFree!.replaceAll(",", "\n"),
            extra: "",
          ),
        );
      }
    }
    return supportListItems;
  }
}