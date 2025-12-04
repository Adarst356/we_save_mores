import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:marquee/marquee.dart';

import '../../../../../theme/app_colors.dart';
import '../../../../../utils/spacing.dart';
import '../../../../../widget/app_text.dart';
import 'news_controller.dart';

class LatestNewsWidget extends StatelessWidget {
  LatestNewsWidget({super.key});
  final NewsController controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.newsState.value.when(
        loading: () => _buildContainer(
          child: const Center(
            child: SizedBox(
              height: 22,
              width: 22,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
        ),
        error: (msg) => _buildContainer(
          child: Center(
            child: AppText(
              "Failed to load news",
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ),

        success: (data) => _buildContainer(
          child: controller.latestNews.value.isEmpty
              ? Center(
            child: AppText(
              "No news available",
              fontSize: 12,
              color: appColors.latestNewsText,
            ),
          )
              : Marquee(
            text: controller.latestNews.value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: appColors.latestNewsText,
            ),
            blankSpace: 50,
            velocity: 40,
            pauseAfterRound: const Duration(seconds: 1),
            startPadding: 10,
          ),
        ),

        none: () => _buildContainer(
          child: Center(
            child: AppText(
              "No news found",
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ),
      );
    });
  }

  /// Shared Container for News
  Widget _buildContainer({required Widget child}) {
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
          Expanded(child: child),
        ],
      ),
    );
  }

  /// 📌 Static Left-Side Label
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
