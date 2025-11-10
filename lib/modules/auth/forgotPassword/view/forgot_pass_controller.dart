import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../api/ui_state.dart';
import '../data/forget_pass_repo.dart';
import '../data/forget_response.dart';

class ForgotPassController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final repo = ForgetPassRepo();

  final mobileController = TextEditingController();
  final otpController = TextEditingController();
  final passwordController = TextEditingController();

  final forgotState = Rx<UiState<ForgetPassResponse>>(UiState.none());

  var mobileError = RxnString();
  var otpError = RxnString();
  var passwordError = RxnString();

  RxBool obscureText = true.obs;

  /// ✅ Mobile Validation
  void validateMobile(String value) {
    if (value.isEmpty) {
      mobileError.value = "Please enter your mobile number";
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      mobileError.value = "Only digits allowed";
    } else if (value.length != 10) {
      mobileError.value = "Mobile number must be exactly 10 digits";
    } else {
      mobileError.value = null;
    }
  }

  /// ✅ OTP Validation
  void validateOtp(String value) {
    if (value.isEmpty) {
      otpError.value = "Please enter OTP";
    } else if (value.length != 6) {
      otpError.value = "OTP must be 6 digits";
    } else {
      otpError.value = null;
    }
  }

  /// ✅ Password Validation
  void validatePassword(String value) {
    if (value.isEmpty) {
      passwordError.value = "Please enter new password";
    } else if (value.length < 6) {
      passwordError.value = "Password must be at least 6 characters";
    } else {
      passwordError.value = null;
    }
  }

  /// 📩 Step 1: Send OTP Request
  void sendOtp() {
    validateMobile(mobileController.text);

    if (mobileError.value != null) {
      Get.snackbar("Error", mobileError.value!);
      return;
    }

    final body = {
      "Mobile": mobileController.text.trim(),
      "Param": {
        "NewPassword": "",
        "OTP": "",
      },
      "appid": "6072874e1f4b7000991915fa914318ed",
      "domain": "admin.wesavemore.in",
      "imei": "2e7d56a2cc6d7460",
      "loginTypeID": 1,
      "version": "5.0",
    };

    repo.getForgetPassword(
      body,
      callback: (state) {
        forgotState.value = state;

        state.when(
          loading: () {
            Get.dialog(
              Center(
                child: Lottie.asset(
                  'assets/svg/Loading circles.json',
                  width: 120,
                  height: 120,
                ),
              ),
              barrierDismissible: false,
            );
          },
          success: (data) {
            if (Get.isDialogOpen == true) Get.back();

            if (data.statuscode == 2) {
              Get.snackbar(
                "OTP Sent",
                data.msg ?? "OTP has been sent successfully.",
                backgroundColor: Colors.green.shade100,
              );
            } else {
              Get.snackbar(
                "Error",
                data.msg ?? "Failed to send OTP.",
                backgroundColor: Colors.red.shade100,
              );
            }
          },
          error: (msg) {
            if (Get.isDialogOpen == true) Get.back();
            Get.snackbar("Error", msg, backgroundColor: Colors.red.shade100);
          },
          none: () {},
        );
      },
    );
  }

  /// 📤 Step 2: Submit OTP + Password
  void submitOtp() {
    validateOtp(otpController.text);
    validatePassword(passwordController.text);

    if (otpError.value != null || passwordError.value != null) return;

    final body = {
      "Mobile": mobileController.text.trim(),
      "Param": {
        "NewPassword": passwordController.text.trim(),
        "OTP": otpController.text.trim(),
      },
      "appid": "6072874e1f4b7000991915fa914318ed",
      "domain": "admin.wesavemore.in",
      "imei": "2e7d56a2cc6d7460",
      "loginTypeID": 1,
      "version": "5.0",
    };

    repo.getForgetPassword(
      body,
      callback: (state) {
        forgotState.value = state;

        state.when(
          loading: () {
            Get.dialog(
              Center(
                child: Lottie.asset(
                  'assets/svg/Loading circles.json',
                  width: 120,
                  height: 120,
                ),
              ),
              barrierDismissible: false,
            );
          },
          success: (data) {
            if (Get.isDialogOpen == true) Get.back();

            if (data.statuscode == 1) {
              Get.back(); // close otp dialog
              Get.snackbar(
                "Success",
                data.msg ?? "Password updated successfully!",
                backgroundColor: Colors.green.shade100,
              );
            } else {
              Get.snackbar(
                "Error",
                data.msg ?? "Invalid OTP or Password.",
                backgroundColor: Colors.red.shade100,
              );
            }
          },
          error: (msg) {
            if (Get.isDialogOpen == true) Get.back();
            Get.snackbar("Error", msg, backgroundColor: Colors.red.shade100);
          },
          none: () {},
        );
      },
    );
  }

  void resendOtp() => sendOtp();

  void cancelDialog() => Get.back();

  @override
  void onClose() {
    mobileController.dispose();
    otpController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
