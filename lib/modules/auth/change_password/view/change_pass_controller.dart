import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ChangePassController extends GetxController {
  /// Text Controllers
  final oldPassController = TextEditingController();
  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();

  /// Password visibility
  var oldPassVisible = false.obs;
  var newPassVisible = false.obs;
  var confirmPassVisible = false.obs;

  /// Submit function
  void onSubmit() {
    if (newPassController.text != confirmPassController.text) {
      Get.snackbar("Error", "New & Confirm Password do not match");
      return;
    }

    // api call or logic here

    Get.snackbar("Success", "Password Changed Successfully");
  }
}
