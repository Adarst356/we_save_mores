import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final mobileController = TextEditingController();
  final passwordController = TextEditingController();

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
    } else if (value.length < 6) {
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
}
