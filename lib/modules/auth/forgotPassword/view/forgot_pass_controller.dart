import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../api/ui_state.dart';
import '../../../../widget/custom_dialog.dart';
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

  /// Common Toast Function
  void showToast(String msg, {Color? color}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      fontSize: 16.0,
    );
  }

  ///  Validate Mobile Number
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

  ///  Validate OTP
  void validateOtp(String value) {
    if (value.isEmpty) {
      otpError.value = "Please enter OTP";
    } else if (value.length != 6) {
      otpError.value = "OTP must be 6 digits";
    } else {
      otpError.value = null;
    }
  }

  ///  Validate Password
  void validatePassword(String value) {
    if (value.isEmpty) {
      passwordError.value = "Please enter new password";
    } else if (value.length < 6) {
      passwordError.value = "Password must be at least 6 characters";
    } else {
      passwordError.value = null;
    }
  }

  ///  Step 1: Send OTP and show Dialog on success
  Future<void> sendOtpWithDialog() async {
    validateMobile(mobileController.text);

    if (mobileError.value != null) {
      showToast(mobileError.value!, color: Colors.red);
      return;
    }

    final body = {
      "Mobile": mobileController.text.trim(),
      "Param": {
        "NewPassword": "",
        "OTP": "",
      },
      "appid": "",
      "domain": "",
      "imei": "2e7d56a2cc6d7460",
      "loginTypeID": 1,
      "version": "",
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
            if (Get.isDialogOpen == true) Get.back(); // close loader

            if (data.statuscode == 2) {
              showToast(data.msg ?? "OTP sent successfully!", color: Colors.black);

              /// Show OTP dialog
              Get.dialog(
                OtpDialog(
                  otpController: otpController,
                  passwordController: passwordController,
                  onResend: resendOtp,
                  onSubmit: submitOtp,
                  onCancel: cancelDialog,
                ),
                barrierDismissible: false,
              );
            } else {
              showToast(data.msg ?? "Failed to send OTP.", color: Colors.red);
            }
          },
          error: (msg) {
            if (Get.isDialogOpen == true) Get.back();
            showToast(msg, color: Colors.red);
          },
          none: () {},
        );
      },
    );
  }

  ///  Step 2: Submit OTP + New Password
  void submitOtp() {
    validateOtp(otpController.text);
    validatePassword(passwordController.text);

    if (otpError.value != null || passwordError.value != null) {
      showToast("Please fill all fields correctly.", color: Colors.red);
      return;
    }

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
              Get.back(); // close OTP dialog
              showToast(data.msg ?? "Password updated successfully!", color: Colors.green);
            } else {
              showToast(data.msg ?? "Invalid OTP or Password.", color: Colors.red);
            }
          },
          error: (msg) {
            if (Get.isDialogOpen == true) Get.back();
            showToast(msg, color: Colors.red);
          },
          none: () {},
        );
      },
    );
  }

  ///  Resend OTP
  void resendOtp() => sendOtpWithDialog();

  ///  Cancel Dialog
  void cancelDialog() => Get.back();

  @override
  void onClose() {
    mobileController.dispose();
    otpController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
