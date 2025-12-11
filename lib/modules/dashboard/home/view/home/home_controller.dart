import 'package:get/get.dart';
import '../../../../../api/ui_state.dart';
import '../../data/getop_type_repo.dart';
import '../../data/getop_type_response.dart';

class HomeController extends GetxController {
  final GetOpTypeRepo repo = GetOpTypeRepo();

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
