import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_save_more/utils/app_strings.dart';
import 'package:we_save_more/widget/app_text.dart';
import 'onboarding_controller.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final backgroundColor = theme.colorScheme.background;
    final textColor = theme.colorScheme.onSurface;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller.pageController,
              onPageChanged: controller.onPageChanged,
              itemCount: controller.images.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Image.asset(
                    controller.images[index],
                    fit: BoxFit.cover,

                  ),
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: backgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, -1),
                  blurRadius: 6,
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  controller.currentPage.value == controller.images.length - 1
                      ? const SizedBox(width: 50)
                      : TextButton(
                          onPressed: controller.skip,
                          child: AppText(
                            AppStrings.skip,
                            color: textColor.withOpacity(0.6),
                            fontSize: 16,
                          ),
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      controller.images.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 8,
                        width: controller.currentPage.value == index ? 20 : 8,
                        decoration: BoxDecoration(
                          color: controller.currentPage.value == index
                              ? primaryColor
                              : Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),

                  ElevatedButton(
                    onPressed: controller.nextPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: AppText(
                      controller.currentPage.value ==
                              controller.images.length - 1
                          ? "Get Started"
                          : "Next",
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
