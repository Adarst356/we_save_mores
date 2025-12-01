import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:we_save_more/utils/app_toast.dart';
import 'package:we_save_more/modules/auth/change_password/data/change_pin_pass_reposonse.dart';
import '../data/change_pin_pass_repo.dart';
import '../../../../api/ui_state.dart';

class ChangePassController extends GetxController {
  /// Text Controllers
  final oldPassController = TextEditingController();
  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();

  /// Password visibility
  var oldPassVisible = true.obs;
  var newPassVisible = true.obs;
  var confirmPassVisible = true.obs;

  /// Errors
  var oldPassError = RxnString();
  var newPassError = RxnString();
  var confirmPassError = RxnString();

  /// Repo
  final repo = ChangePinPassRepo();

  /// UI State
  final changePassState = Rx<UiState<ChangePassPinResponse>>(UiState.none());

  /// Loading
  var isLoading = false.obs;

  // ================= VALIDATION =================

  void validateOldPass(String value) {
    oldPassError.value = value.isEmpty ? "Please enter old password" : null;
  }

  void validateNewPass(String value) {
    if (value.isEmpty) {
      newPassError.value = "Please enter new password";
    } else if (value.length < 8) {
      newPassError.value = "Password must be 8+ characters";
    } else if (!RegExp(r'[0-9]').hasMatch(value)) {
      newPassError.value = "Password must contain at least 1 number";
    } else if (value.contains(" ")) {
      newPassError.value = "Password cannot contain spaces";
    } else {
      newPassError.value = null;
    }
  }

  void validateConfirmPass(String value) {
    if (value.isEmpty) {
      confirmPassError.value = "Please confirm password";
    } else if (value != newPassController.text.trim()) {
      confirmPassError.value = "Passwords do not match";
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

  /// ================= API SUBMIT =================

  void onSubmit() async {
    /// Clear previous errors
    oldPassError.value = null;
    newPassError.value = null;
    confirmPassError.value = null;

    /// Validate form
    if (!validateForm()) return;

    ///Check if old and new password are same
    if (oldPassController.text.trim() == newPassController.text.trim()) {
      CommonToast.showToastError("New password cannot be same as old password");
      return;
    }

    /// API Body
    Map<String, dynamic> body = {
      "oldP": oldPassController.text.trim(),
      "NewP": newPassController.text.trim(),
      "ConfirmP": confirmPassController.text.trim(),
      "isPin": false,
    };

    repo.getChangePinOrPass(
      body,
      callback: (state) {
        changePassState.value = state;

        state.when(
          loading: () {
            isLoading.value = true;
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
            isLoading.value = false;
            if (Get.isDialogOpen == true) Get.back();

            if (data.statuscode == 1) {
              CommonToast.showToastSuccess(
                data.msg ?? "Password changed successfully",
              );

              /// Clear fields
              oldPassController.clear();
              newPassController.clear();
              confirmPassController.clear();

              /// Navigate back
              Get.back();
            } else {
              CommonToast.showToastError(
                data.msg ?? "Failed to change password",
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