import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:we_save_more/routes/app_routes.dart';

import '../../../../api/ui_state.dart';
import '../data/logout_repo.dart';
import '../data/logout_response.dart';

class SideDrawerController extends GetxController {
  final LogoutRepo repo = LogoutRepo();

  RxBool isLoading = false.obs;

  final logoutState = Rx<UiState<LogOutResponse>>(UiState.none());

  Rx<LogOutResponse?> logoutData = Rx<LogOutResponse?>(null);

  /// MAIN LOGOUT FUNCTION
  void logoutUser() {
    isLoading.value = true;

    repo.getLogoutUser(
      body: {},    // 🔥 Correct: EMPTY BODY
      callback: (state) {
        logoutState.value = state;

        state.when(
          success: (data) {
            logoutData.value = data;
            _handleLogoutSuccess();
          },
          error: (msg) {
            Get.snackbar(
              "Logout Failed",
              msg.toString(),
              backgroundColor: Colors.redAccent,
              colorText: Colors.white,
            );
          },
          loading: () {},
          none: () {},
        );

        isLoading.value = false;
      },
    );
  }

  void showLogoutDialog() {
    Get.defaultDialog(
      title: "Logout",
      titleStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      middleText: "Are you sure you want to logout?",
      middleTextStyle: const TextStyle(fontSize: 15),

      // Buttons
      textConfirm: "Yes",
      textCancel: "No",

      confirmTextColor: Colors.white,
      cancelTextColor: Colors.red,
      buttonColor: Colors.green,

      radius: 10,

      onConfirm: () {
        Get.back(); // dialog बंद
        logoutUser(); // API call
      },
      onCancel: () {},
    );
  }


  /// AFTER LOGOUT SUCCESS
  void _handleLogoutSuccess() {
    Get.snackbar(
      "Success",
      "Logged out successfully",
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
    GetStorage().erase();

    /// remove all previous routes
    Get.offAllNamed(AppRoutes.login);
  }
}
