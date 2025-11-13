import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:we_save_more/modules/auth/login/data/login_response.dart';

import '../../../../api/ui_state.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/app_toast.dart';
import '../data/login_repo.dart';

class LoginController extends GetxController {
  /// Form Key
  final loginFormKey  = GlobalKey<FormState>();
  ///GetStorage
  final box = GetStorage();

  /// Repo (API layer)
  final repo = LoginRepo();

  /// Controllers
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();

  /// UI state
  final loginState = Rx<UiState<LoginResponse>>(UiState.none());

  /// Observable UI values
  RxBool obscureText = true.obs;
  var mobileError = RxnString();
  var passwordError = RxnString();

  // ================= VALIDATION =================

  /// Mobile Validation
  void validateMobile(String value) {
    if (value.isEmpty) {
      mobileError.value = "Please enter your mobile number";
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      mobileError.value = "Only digits allowed";
    } else if (value.length != 10) {
      mobileError.value = "Mobile number must be 10 digits";
    } else {
      mobileError.value = null;
    }
  }

  /// Password Validation
  void validatePassword(String value) {
    if (value.isEmpty) {
      passwordError.value = "Please enter password";
    } else if (value.length < 6) {
      passwordError.value = "Password min at least 6 characters";
    } else {
      passwordError.value = null;
    }
  }

  /// Form Validation (before calling API)
  bool validateForm() {
    validateMobile(mobileController.text);
    validatePassword(passwordController.text);
    return mobileError.value == null && passwordError.value == null;
  }

  /// ================= API CALL =================

  void loginUser() {
    if (!validateForm()) return;

    repo.getLoginUser(
      {
        "loginTypeID": 1,
        "password": passwordController.text.trim(),
        "userID": mobileController.text.trim(),
      },
      callback: (state) {
        loginState.value = state;

        state.when(
          success: (data) {
            if (Get.isDialogOpen == true) Get.back();

            if (data.statuscode == 1) {
              CommonToast.showToastSuccess(data.msg ?? "Login successful!");
              /// Save user data locally
               box.write('isLoggedIn', true);
              box.write('mobile', mobileController.text.trim());
              box.write('password', passwordController.text.trim());
              Get.offAllNamed(AppRoutes.bottomNav);
            } else {
              CommonToast.showToastError(data.msg ?? "Invalid credentials");
            }
          },
          error: (msg) {
            if (Get.isDialogOpen == true) Get.back(); /// close loader
            CommonToast.showToastError(msg);
          },
          loading: () {
            Get.dialog(
              Center(
                child: Lottie.asset(
                  'assets/svg/Loading circles.json',
                  width: 120,
                  height: 120,
                  fit: BoxFit.contain,
                ),
              ),
              barrierDismissible: false,
            );
          },
          none: () {},
        );
      },
    );
  }
}
