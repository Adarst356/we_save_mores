import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:we_save_more/modules/dashboard/profile/data/profile_repo.dart';
import 'package:we_save_more/modules/dashboard/profile/data/profile_response.dart';
import '../../../../api/ui_state.dart';
import '../data/balance_repo.dart';
import '../data/balance_response.dart';

class ProfileController extends GetxController {
  ProfileRepo repo = ProfileRepo();

  RxBool isLoading = false.obs;
  final profileState = Rx<UiState<ProfileResponse>>(UiState.none());
  Rx<ProfileResponse?> profileData = Rx<ProfileResponse?>(null);

  /// Get initials from name for avatar
  String getInitials(String? name) {
    if (name == null || name.isEmpty) return 'U';

    List<String> nameParts = name.trim().split(' ');
    if (nameParts.length == 1) {
      return nameParts[0][0].toUpperCase();
    } else {
      return (nameParts[0][0] + nameParts[nameParts.length - 1][0]).toUpperCase();
    }
  }

  /// API CALL
  void getProfile() {
    isLoading.value = true;

    Map<String, dynamic> body = {
      /// Add your required body parameters here
    };

    repo.getProfileData(
      body: body,
      callback: (state) {
        profileState.value = state;

        state.when(
          success: (data) {
            print("✅ Profile Success");
            print("📊 Status Code: ${data.statuscode}");
            print("📋 Message: ${data.msg}");
            print("👤 Name: ${data.name}");
            print("📧 Email: ${data.emailID}");
            print("📱 Mobile: ${data.mobileNo}");

            profileData.value = data;
            isLoading.value = false;
          },
          error: (msg) {
            print("❌ Profile API Error: $msg");
            isLoading.value = false;

            Fluttertoast.showToast(
              msg: msg,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          },
          loading: () {
            print("⏳ Loading Profile...");
            isLoading.value = true;
          },
          none: () {
            print("🔵 None state");
            isLoading.value = false;
          },
        );
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    print("🚀 ProfileController Initialized");
    getProfile();
  }

  @override
  void onClose() {
    print("🛑 ProfileController Closed");
    super.onClose();
  }
}
