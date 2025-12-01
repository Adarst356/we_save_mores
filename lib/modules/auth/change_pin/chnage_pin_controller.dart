import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../utils/app_toast.dart';
import '../change_password/data/change_pin_pass_repo.dart';

class ChangePinController extends GetxController {
  /// Text Controllers
  final oldPassController = TextEditingController();
  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();

  /// PIN visibility
  var oldPassVisible = true.obs;
  var newPassVisible = true.obs;
  var confirmPassVisible = true.obs;

  /// Error text
  var oldPassError = RxnString();
  var newPassError = RxnString();
  var confirmPassError = RxnString();

  /// Loader
  var isLoading = false.obs;

  final repo = ChangePinPassRepo();

  /// ================= VALIDATION =================

  bool _is4DigitPin(String value) => RegExp(r'^[0-9]{4}$').hasMatch(value);

  void validateOldPass(String value) {
    if (value.isEmpty) {
      oldPassError.value = "Please enter old pin";
    } else {
      oldPassError.value = null;
    }
  }
  void validateNewPass(String value) {
    if (value.isEmpty) {
      newPassError.value = "Please enter new pin";
    } else if (!_is4DigitPin(value)) {
      newPassError.value = "Pin must be 4 digits";
    } else {
      newPassError.value = null;
    }
  }

  void validateConfirmPass(String value) {
    if (value.isEmpty) {
      confirmPassError.value = "Please confirm pin";
    } else if (value != newPassController.text.trim()) {
      confirmPassError.value = "Pin does not match";
    } else {
      confirmPassError.value = null;
    }
  }

  bool validateForm() {
    validateOldPass(oldPassController.text.trim());
    validateNewPass(newPassController.text.trim());
    validateConfirmPass(confirmPassController.text.trim());

    return oldPassError.value == null &&
        newPassError.value == null &&
        confirmPassError.value == null;
  }

  /// ================= API CALL =================

  void onSubmit() async {
    // Clear previous errors
    oldPassError.value = null;
    newPassError.value = null;
    confirmPassError.value = null;

    // Validate form
    if (!validateForm()) return;

    // Check if old and new pin are same
    if (oldPassController.text.trim() == newPassController.text.trim()) {
      CommonToast.showToastError("New pin cannot be same as old pin");
      return;
    }

    // API Body - Backend expects exactly these keys
    final body = {
      "oldP": oldPassController.text.trim(),
      "NewP": newPassController.text.trim(),
      "ConfirmP": confirmPassController.text.trim(),
      "isPin": true, // Important: true for PIN, false for Password
    };

    repo.getChangePinOrPass(
      body,
      callback: (state) {
        state.when(
          loading: () {
            isLoading.value = true;
            Get.dialog(
              Center(
                child: Lottie.asset(
                  'assets/svg/Loading circles.json',
                  width: 100,
                  height: 100,
                ),
              ),
              barrierDismissible: false,
            );
          },
          success: (data) {
            isLoading.value = false;
            if (Get.isDialogOpen == true) Get.back();

            if (data.statuscode == 1) {
              // Success
              CommonToast.showToastSuccess(
                  data.msg ?? "Pin changed successfully"
              );

              // Clear all fields
              oldPassController.clear();
              newPassController.clear();
              confirmPassController.clear();

              // Clear errors
              oldPassError.value = null;
              newPassError.value = null;
              confirmPassError.value = null;

              // Navigate back
              Get.back();
            } else {
              // API returned statuscode != 1
              CommonToast.showToastError(
                  data.msg ?? "Failed to change pin"
              );
            }
          },
          error: (msg) {
            isLoading.value = false;
            if (Get.isDialogOpen == true) Get.back();
            CommonToast.showToastError(msg);
          },
          none: () {
            isLoading.value = false;
          },
        );
      },
    );
  }

  @override
  void onClose() {
    oldPassController.dispose();
    newPassController.dispose();
    confirmPassController.dispose();
    super.onClose();
  }
}