import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:we_save_more/modules/auth/login/data/login_response.dart';

import '../../../../api/ui_state.dart';
import '../data/login_repo.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final  repo = LoginRepo();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final loginState = Rx<UiState<LoginResponse>>(UiState.none());


  RxBool obscureText = true.obs;
  var mobileError = RxnString();
  var passwordError = RxnString();

  /// Real-time Mobile Validation
  void validateMobile(String value) {
    if (value.isEmpty) {
      mobileError.value = "Field is empty";
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      mobileError.value = "Only digits allowed";
    } else if (value.length != 10) {
      mobileError.value = "Mobile number must be exactly 10 digits";
    } else {
      mobileError.value = null;
    }
  }

  /// Real-time Password Validation
  void validatePassword(String value) {
    if (value.isEmpty) {
      passwordError.value = "Field is empty";
    } else if (value.length < 8) {
      passwordError.value = "Password must be at least 6 characters";
    } else {
      passwordError.value = null;
    }
  }

  /// Form Validation
  void validateForm() {
    validateMobile(mobileController.text);
    validatePassword(passwordController.text);

    if (mobileError.value == null && passwordError.value == null) {
      Get.snackbar("Success", "Login successful!");
    }
  }

  @override
  void onClose() {
    mobileController.dispose();
    passwordController.dispose();
    super.onClose();
  }


  void loginUser() {
    validateMobile(mobileController.text);
    validatePassword(passwordController.text);

    if (mobileError.value != null || passwordError.value != null) return;

    repo.getLogin(
      {
        "loginTypeID": 1,
        "password": passwordController.text.trim(),
        "userID": mobileController.text.trim(),
      },
      callback: (state) {
        loginState.value = state;

        state.when(
          success: (data) {
            if (Get.isDialogOpen == true) Get.back(); // close loader
            if (data.statuscode == 1) {
              Get.snackbar("Success", data.msg ?? "Login successful");
              // You can navigate to Dashboard here
              // Get.offAllNamed(AppRoutes.dashboard);
            } else {
              Get.snackbar("Error", data.msg ?? "Invalid credentials");
            }
          },
          error: (msg) {
            if (Get.isDialogOpen == true) Get.back(); // close loader
            Get.snackbar("Error", msg);
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
