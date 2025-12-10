import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../api/ui_state.dart';
import '../data/refers_repo.dart';
import '../data/refers_response.dart';

class ReferralController extends GetxController {
  ReferralRepo repo = ReferralRepo();
  static ReferralController to = Get.find();
  /// Single share message variable (Correct)
  RxString shareMessage = "Install WeSaveMore App & Earn Rewards!".obs;

  final PageController pageController = PageController();
  RxDouble currentIndex = 0.0.obs;

  RxBool isLoading = true.obs;


  final referralState = Rx<UiState<ReferralResponse>>(UiState.none());
  RxString referralContent = "".obs;
  RxList<RefferalImage> referralApiImages = <RefferalImage>[].obs;

  List<String> fallbackImages = [
    "assets/images/refer_and_earn.png",
    "assets/images/wallet_transfer.jpg",
  ];

  // RxString shareMessage = "".obs;

  List<String> get referralImages {
    if (referralApiImages.isNotEmpty) {
      return referralApiImages
          .map((e) => e.url?.toString() ?? e.siteResourceUrl?.toString() ?? "")
          .where((e) => e.isNotEmpty)
          .toList();
    }
    return fallbackImages;
  }

  void getReferral() {
    isLoading.value = true;

    repo.getReferral(
      body: {
        "IsB2C": false,
        "loginTypeID": 0,
        "opType": 0,
        // "session": "5c24357951f20ccc52ab9b68ada8807a",
        "uid": 0,
        // "userID": "47520",
        // "version": "5.0"
      },
      callback: (state) {
        referralState.value = state;

        state.when(
          success: (data) {
            referralContent.value = data.refferalContent ?? "";
            referralApiImages.value = data.refferalImage ?? [];
            shareMessage.value =
            "Hey! Join WeSaveMore using my referral link:\nhttps://wesavemore.in/invite?id=47520";
          },
          error: (msg) {
            print("Referral API Error: $msg");
          },
          loading: () {},
          none: () {},
        );

        isLoading.value = false; /// Stop loading
      },
    );
  }

  @override
  void onInit() {
    getReferral();
    super.onInit();
  }
}

