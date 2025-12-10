import 'package:get/get.dart';
import 'package:we_save_more/modules/dashboard/home_dashboard/data/getop_type_repo.dart';
import 'package:we_save_more/modules/dashboard/home_dashboard/data/getop_type_response.dart';

import '../../../../../api/ui_state.dart';
import '../../../profile/view/balance_controller.dart';
import '../../data/banner_response.dart';

class HomeController extends GetxController {
  final GetOpTypeRepo repo = GetOpTypeRepo();

  static HomeController get to => Get.find();
  final GetOpTypeState = Rx<UiState<GetOpTypesResponse>>(UiState.none());
  // final List<Map<String, String>> serviceList = [
  //   {"title": "Prepaid", "icon": "assets/svg/prepaid.svg"},
  //   {"title": "DTH", "icon": "assets/svg/antenna.svg"},
  //   {"title": "Landline", "icon": "assets/svg/telephone.svg"},
  //   {"title": "Electricity", "icon": "assets/svg/bulb-svgrepo-com.svg"},
  //   {"title": "Piped Gas", "icon": "assets/svg/pipe_gas.png"},
  //   {"title": "Broadband", "icon": "assets/svg/broadband.svg"},
  //   {"title": "Water", "icon": "assets/svg/water-drop-svgrepo-com.svg"},
  //   {"title": "Loan Repayment", "icon": "assets/svg/loan_repym.svg"},
  //   {"title": "LPG Cylinder", "icon": "assets/svg/gas-cylinder.png"},
  //   {"title": "Insurance", "icon": "assets/svg/family-insurance.png"},
  //   {"title": "FASTag", "icon": "assets/svg/parking.svg"},
  //   {"title": "Play Voucher", "icon": "assets/svg/google-play-svgrepo-com.svg"},
  // ];


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
