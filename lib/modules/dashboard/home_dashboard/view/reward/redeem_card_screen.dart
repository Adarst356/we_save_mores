import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_save_more/theme/app_colors.dart';
import 'package:we_save_more/utils/spacing.dart';
import 'package:we_save_more/widget/app_text.dart';
import '../../../../../utils/custom_appbar.dart';

class RedeemCardScreen extends StatelessWidget {
  const RedeemCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: appColors.primaryColor,
      appBar: CustomAppbar(
        title: "Scratch Card",
        showLeft: true,
        leftIcon: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.90,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: appColors.primaryMoreLight,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    "You Have Won!",
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                  Spacing.h4,
                  AppText(
                    "₹ 1.50",
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  Spacing.h12,
                  Image.asset(
                    "assets/images/winner.png",
                    height: 70,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
