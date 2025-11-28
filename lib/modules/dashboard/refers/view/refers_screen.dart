import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:we_save_more/modules/dashboard/refers/view/refers_controller.dart';
import 'package:we_save_more/utils/spacing.dart';
import 'package:we_save_more/widget/app_text.dart';
import '../../../../utils/share_helper.dart';

class RefersScreen extends GetView<ReferralController> {
  const RefersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: SvgPicture.asset(
                    "assets/svg/close_button.svg",
                    height: 35,
                  ),
                ),
              ),

              Spacing.h24,

              /// IMAGE CAROUSEL WITH LOADER
              Obx(() {
                /// Show loader while images are being fetched
                if (controller.referralImages.isEmpty) {
                  return SizedBox(
                    height: 260,
                    width: double.infinity,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          Spacing.h16,
                          AppText(
                            "Loading images...",
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 260,
                      width: double.infinity,
                      child: PageView.builder(
                        itemCount: controller.referralImages.length,
                        controller: controller.pageController,
                        onPageChanged: (index) {
                          controller.currentIndex.value = index.toDouble();
                        },
                        itemBuilder: (context, index) {
                          final imageUrl = controller.referralImages[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: imageUrl.startsWith('http')
                                  ? Image.network(
                                imageUrl,
                                fit: BoxFit.fill,
                                width: double.infinity,
                                height: double.infinity,
                                loadingBuilder: (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CircularProgressIndicator(
                                          value: loadingProgress.expectedTotalBytes != null
                                              ? loadingProgress.cumulativeBytesLoaded /
                                              loadingProgress.expectedTotalBytes!
                                              : null,
                                        ),
                                        Spacing.h12,
                                        AppText(
                                          "Loading image...",
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.broken_image,
                                          size: 64,
                                          color: Colors.grey,
                                        ),
                                        Spacing.h12,
                                        AppText(
                                          "Failed to load image",
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )
                                  : Image.asset(
                                imageUrl,
                                fit: BoxFit.fill,
                                width: double.infinity,
                                height: double.infinity,
                                errorBuilder: (context, error, stackTrace) {
                                  return Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.broken_image,
                                          size: 64,
                                          color: Colors.grey,
                                        ),
                                        Spacing.h12,
                                        AppText(
                                          "Image not found",
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    Spacing.h40,

                    // Show dots indicator only when images are loaded
                    if (controller.referralImages.isNotEmpty)
                      DotsIndicator(
                        dotsCount: controller.referralImages.length,
                        position: controller.currentIndex.value,
                        decorator: DotsDecorator(
                          activeColor: Colors.blue,
                          color: Colors.grey,
                          size: const Size.square(8),
                          activeSize: const Size(8.0, 8),
                          activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                  ],
                );
              }),

              Spacing.h40,

              Center(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: AppText(
                    "Be a SuperHero and  Earn Lifetime Commission",
                    fontSize: 14,
                    color: Color(0xffab987e),
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Obx(
                      () => AppText(
                    controller.referralContent.value.isNotEmpty
                        ? controller.referralContent.value
                        : "Invite your friends and start business with WeSaveMore to get attractive commission on every transaction they Do.\n\nYou will get Reward on every transaction of your referrals Do.",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      ShareHelper.shareWhatsapp(controller.shareMessage.value);
                    },
                    icon: Image.asset(
                      "assets/icons/whatsapp.png",
                      height: 35,
                      width: 35,
                    ),
                  ),
                  Spacing.w4,
                  IconButton(
                    onPressed: () {
                      ShareHelper.shareFacebook(controller.shareMessage.value);
                    },
                    icon: Image.asset(
                      "assets/icons/facebook.png",
                      height: 35,
                      width: 35,
                    ),
                  ),
                  Spacing.w4,
                  IconButton(
                    onPressed: () {
                      ShareHelper.shareTwitter(controller.shareMessage.value);
                    },
                    icon: Image.asset(
                      "assets/icons/twitter.png",
                      height: 35,
                      width: 35,
                    ),
                  ),
                  Spacing.w4,
                  IconButton(
                    onPressed: () {
                      ShareHelper.shareEmail(controller.shareMessage.value);
                    },
                    icon: Image.asset(
                      "assets/icons/email.png",
                      height: 35,
                      width: 35,
                    ),
                  ),
                  Spacing.w4,
                  IconButton(
                    onPressed: () {
                      ShareHelper.shareGeneral(controller.shareMessage.value);
                    },
                    icon: Image.asset(
                      "assets/icons/share.png",
                      height: 35,
                      width: 35,
                    ),
                  ),
                ],
              ),
              Spacing.h40,
            ],
          ),
        ),
      ),
    );
  }
}