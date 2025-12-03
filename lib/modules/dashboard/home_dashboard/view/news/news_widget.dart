import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:we_save_more/utils/spacing.dart';
import 'package:we_save_more/widget/app_text.dart';
import '../../../../../theme/app_colors.dart';
import 'news_controller.dart';

class LatestNewsWidget extends StatelessWidget {
  LatestNewsWidget({super.key});
  final NewsController controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      /// Show loading state
      if (controller.isLoading.value) {
        return Container(
          height: 50,
          decoration: BoxDecoration(
            color: appColors.latestNewsBg,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              _buildNewsLabel(),
              Spacing.w12,
              const Expanded(
                child: Center(
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }

      /// Show news with marquee effect
      return Container(
        height: 50,
        decoration: BoxDecoration(
          color: appColors.latestNewsBg,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            _buildNewsLabel(),
            Spacing.w12,
            Expanded(
              child: controller.latestNews.value.isEmpty
                  ? Center(
                child: AppText(
                  "No news available",
                  fontSize: 12,
                  color: appColors.latestNewsText,
                ),
              )
                  : Marquee(
               text:  controller.latestNews.value ?? "Default News",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: appColors.latestNewsText,
                ),
                blankSpace: 50,
                velocity: 40,
                pauseAfterRound: const Duration(seconds: 1),
                startPadding: 10,
                accelerationDuration: const Duration(seconds: 1),
                accelerationCurve: Curves.linear,
                decelerationDuration: const Duration(milliseconds: 500),
                decelerationCurve: Curves.easeOut,
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildNewsLabel() {
    return Container(
      width: 70,
      decoration: BoxDecoration(
        color: appColors.latestNewsLabelBg,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      child: const Center(
        child: AppText(
          "Latest\nNews",
          align: TextAlign.center,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}