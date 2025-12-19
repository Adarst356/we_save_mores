import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_save_more/routes/app_routes.dart';

import 'package:flutter/services.dart';

class OnboardingController extends GetxController {
  var pageController = PageController();
  var currentPage = 0.obs;

  final List<String> images = [
    "assets/images/tutorial_1.jpg",
    "assets/images/tutorial_2.jpg",
    "assets/images/tutorial_3.jpg",
  ];

  @override
  void onInit() {
    super.onInit();

    /// Portrait mode lock
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  void onClose() {
    ///  Unlock (optional – baaki app ke liye)
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.onClose();
  }

  void nextPage() {
    if (currentPage.value < images.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.toNamed(AppRoutes.login);
    }
  }

  void skip() {
    Get.toNamed(AppRoutes.login);
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }
}

