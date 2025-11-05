import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_save_more/routes/app_routes.dart';

class OnboardingController extends GetxController {
  var pageController = PageController();
  var currentPage = 0.obs;

  final List<String> images = [
    "assets/images/tutorial_1.jpg",
    "assets/images/tutorial_2.jpg",
    "assets/images/tutorial_3.jpg",
  ];

  void nextPage() {
    if (currentPage.value < images.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 2),
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
