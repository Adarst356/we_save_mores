import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../../api/ui_state.dart';
import '../../data/getop_type_repo.dart';
import '../../data/getop_type_response.dart';

class HomeController extends GetxController {
  final GetOpTypeRepo repo = GetOpTypeRepo();
  final GetStorage box = GetStorage();
  static HomeController get to => Get.find();
  final GetOpTypeState = Rx<UiState<GetOpTypesResponse>>(UiState.none());


  @override
  void onInit() {
    super.onInit();
    getOpTypes();
  }

  getOpTypes() {
    repo.getOpTypeData(
      body: {},
      callback: (state) {
        state.when(
          loading: () {
            GetOpTypeState.value = UiState.loading();

          },

          success: (data) {
            GetOpTypeState.value = UiState.success(data);
            box.write(
              "get_opType_response",
              data.toJson(),
            );
          },

          error: (msg) {
            GetOpTypeState.value = UiState.error(msg);
          },

          none: () {
            GetOpTypeState.value = UiState.none();
          },
        );
      },
    );
  }
}
