import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:we_save_more/modules/dashboard/refers/view/refers_controller.dart';
import 'package:we_save_more/utils/spacing.dart';
import 'package:we_save_more/widget/app_text.dart';

import '../../../../routes/app_routes.dart';

class RefersScreen extends StatelessWidget {
  RefersScreen({super.key});

  final ReferralController controller = Get.put(ReferralController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: (){Get.back();},
                icon: SvgPicture.asset(
                  "assets/svg/close_button.svg",
                  height: 35,
                ),
              ),

              Spacing.h24,
              Obx(
                    () => Column(
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
                            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: imageUrl.startsWith('http')
                                  ? Image.network(
                                imageUrl,
                                fit: BoxFit.fill,
                                width: double.infinity,
                                height: double.infinity,
                              )
                                  : Image.asset(
                                imageUrl,
                                fit: BoxFit.fill,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    Spacing.h40,

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
                ),
              ),

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
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/icons/whatsapp.png",
                      height: 35,
                      width: 35,
                    ),
                  ),
                  Spacing.w4,

                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/icons/facebook.png",
                      height: 35,
                      width: 35,
                    ),
                  ),
                  Spacing.w4,
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/icons/twitter.png",
                      height: 35,
                      width: 35,
                    ),
                  ),
                  Spacing.w4,
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/icons/email.png",
                      height: 35,
                      width: 35,
                    ),
                  ),
                  Spacing.w4,
                  IconButton(
                    onPressed: () {},
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
