import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_save_more/modules/dashboard/profile/view/profile_controller.dart';

import '../../../../api/ui_state.dart';
import '../../../../widget/app_dialog.dart';
import '../data/update_profile_repo.dart';
import '../data/update_profile_response.dart';

class UpdateProfileController extends GetxController {
  final UpdateProfileRepo repo = UpdateProfileRepo();

  /// Controllers
  final nameController = TextEditingController();
  final mobileController = TextEditingController(); // API value, read-only
  final emailController = TextEditingController(); // API value, read-only

  final aadharController = TextEditingController();
  final addressController = TextEditingController();
  final alternateMobileController = TextEditingController();
  final commRateController = TextEditingController(text: "0");
  final dobController = TextEditingController();
  final panController = TextEditingController();
  final pincodeController = TextEditingController();

  final updateProfileState = Rx<UiState<UpdateProfileResponse>>(UiState.none());
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadProfileData();
  }

  /// Load existing profile data from API
  void loadProfileData() {
    final profile = Get.find<ProfileController>().profileData.value;
    if (profile != null) {
      nameController.text = profile.name ?? "";
      mobileController.text = profile.mobileNo ?? "";
      emailController.text = profile.emailID ?? "";
      pincodeController.text = profile.pincode ?? "";
      addressController.text = profile.address ?? "";
      dobController.text = profile.dob ?? "";
      aadharController.text = profile.aadhar ?? "";
      panController.text = profile.pan ?? "";
      alternateMobileController.text = profile.alternateMobile ?? "";
    }
  }

  /// Validation before API call
  bool validateFields() {
    // Name validation
    if (nameController.text.trim().isEmpty) {
      AppDialog.show(
        title: 'Invalid Name',
        message: 'Please enter your name',
        icon: Icons.person_outline,
        iconColor: Colors.orange,
        iconBackgroundColor: Colors.orange.withOpacity(0.1),
        primaryButtonText: 'OK',
        primaryButtonColor: const Color(0xFFFFA726),
      );
      return false;
    }
    if (nameController.text.trim().length < 3) {
      AppDialog.show(
        title: 'Invalid Name',
        message: 'Name must be at least 3 characters',
        icon: Icons.person_outline,
        iconColor: Colors.orange,
        iconBackgroundColor: Colors.orange.withOpacity(0.1),
        primaryButtonText: 'OK',
        primaryButtonColor: const Color(0xFFFFA726),
      );
      return false;
    }

    // Alternate Mobile
    if (alternateMobileController.text.trim().isNotEmpty &&
        alternateMobileController.text.trim().length != 10) {
      AppDialog.show(
        title: 'Invalid Alternate Mobile',
        message: 'Alternate mobile must be exactly 10 digits',
        icon: Icons.phone_android,
        iconColor: Colors.orange,
        iconBackgroundColor: Colors.orange.withOpacity(0.1),
        primaryButtonText: 'OK',
        primaryButtonColor: const Color(0xFFFFA726),
      );
      return false;
    }

    // DOB
    if (dobController.text.trim().isEmpty) {
      AppDialog.show(
        title: 'Invalid Date of Birth',
        message: 'Please select your date of birth',
        icon: Icons.calendar_today,
        iconColor: Colors.orange,
        iconBackgroundColor: Colors.orange.withOpacity(0.1),
        primaryButtonText: 'OK',
        primaryButtonColor: const Color(0xFFFFA726),
      );
      return false;
    }

    // Pincode
    if (pincodeController.text.trim().isEmpty ||
        pincodeController.text.trim().length != 6) {
      AppDialog.show(
        title: 'Invalid Pincode',
        message: 'Pincode must be exactly 6 digits',
        icon: Icons.location_on_outlined,
        iconColor: Colors.orange,
        iconBackgroundColor: Colors.orange.withOpacity(0.1),
        primaryButtonText: 'OK',
        primaryButtonColor: const Color(0xFFFFA726),
      );
      return false;
    }

    // Address
    if (addressController.text.trim().isEmpty ||
        addressController.text.trim().length < 10) {
      AppDialog.show(
        title: 'Invalid Address',
        message: 'Please enter a complete address (min 10 characters)',
        icon: Icons.home_outlined,
        iconColor: Colors.orange,
        iconBackgroundColor: Colors.orange.withOpacity(0.1),
        primaryButtonText: 'OK',
        primaryButtonColor: const Color(0xFFFFA726),
      );
      return false;
    }

    // Aadhar
    if (aadharController.text.trim().isEmpty ||
        aadharController.text.trim().length != 12) {
      AppDialog.show(
        title: 'Invalid AADHAR',
        message: 'AADHAR must be exactly 12 digits',
        icon: Icons.credit_card,
        iconColor: Colors.orange,
        iconBackgroundColor: Colors.orange.withOpacity(0.1),
        primaryButtonText: 'OK',
        primaryButtonColor: const Color(0xFFFFA726),
      );
      return false;
    }

    // PAN
    if (panController.text.trim().isEmpty || panController.text.trim().length != 10) {
      AppDialog.show(
        title: 'Invalid PAN',
        message: 'PAN must be exactly 10 characters',
        icon: Icons.badge_outlined,
        iconColor: Colors.orange,
        iconBackgroundColor: Colors.orange.withOpacity(0.1),
        primaryButtonText: 'OK',
        primaryButtonColor: const Color(0xFFFFA726),
      );
      return false;
    }

    final panPattern = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$');
    if (!panPattern.hasMatch(panController.text.trim().toUpperCase())) {
      AppDialog.show(
        title: 'Invalid PAN Format',
        message: 'PAN format should be 5 letters + 4 digits + 1 letter\nExample: ABCDE1234F',
        icon: Icons.badge_outlined,
        iconColor: Colors.orange,
        iconBackgroundColor: Colors.orange.withOpacity(0.1),
        primaryButtonText: 'OK',
        primaryButtonColor: const Color(0xFFFFA726),
      );
      return false;
    }

    return true;
  }

  /// API call to update profile
  void updateUserProfile() {
    isLoading.value = true;

    final body = {
      "editUser": {
        "aadhar": aadharController.text.trim(),
        "address": addressController.text.trim(),
        "alternateMobile": alternateMobileController.text.trim(),
        "commRate": int.tryParse(commRateController.text) ?? 0,
        "dob": dobController.text.trim(),
        "emailID": emailController.text.trim(),
        "isCCFGstApplicable": false,
        "isGSTApplicable": false,
        "isTDSApplicable": false,
        "mobileNo": mobileController.text.trim(),
        "name": nameController.text.trim(),
        "pan": panController.text.trim().toUpperCase(),
        "pincode": pincodeController.text.trim(),
        "userID": 0
      }
    };

    repo.getUpdateProfileData(
      body: body,
      callback: (state) {
        updateProfileState.value = state;
        state.when(
          success: (data) {
            isLoading.value = false;
            Get.snackbar(
              'Success',
              data.msg ?? 'Profile updated successfully',
              backgroundColor: Colors.green,
              colorText: Colors.white,
              snackPosition: SnackPosition.BOTTOM,
              margin: const EdgeInsets.all(16),
              duration: const Duration(seconds: 2),
            );
            Future.delayed(const Duration(seconds: 1), () {
              Get.back();
            });
          },
          error: (msg) {
            isLoading.value = false;
            Get.snackbar(
              'Error',
              msg,
              backgroundColor: Colors.red,
              colorText: Colors.white,
              snackPosition: SnackPosition.TOP,
              margin: const EdgeInsets.all(16),
              duration: const Duration(seconds: 3),
            );
          },
          loading: () => isLoading.value = true,
          none: () => isLoading.value = false,
        );
      },
    );
  }

  @override
  void onClose() {
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    aadharController.dispose();
    addressController.dispose();
    alternateMobileController.dispose();
    commRateController.dispose();
    dobController.dispose();
    panController.dispose();
    pincodeController.dispose();
    super.onClose();
  }
}