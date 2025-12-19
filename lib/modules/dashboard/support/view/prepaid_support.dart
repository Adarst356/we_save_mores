import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:we_save_more/theme/app_colors.dart';
import 'package:we_save_more/widget/app_text.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/custom_appbar.dart' show CustomAppbar;

class PrepaidSupport extends StatelessWidget {
  const PrepaidSupport({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    return Scaffold(
      appBar: CustomAppbar(
        title: "Prepaid Support",
        showLeft: true,
        leftIcon: GestureDetector(
            onTap: (){Get.back();},
            child: Icon(Icons.arrow_back, color: theme.colorScheme.onPrimary)),
      ),
      body: Column(
        children: [
          thinInfoTile(
            name: "Airtel",
            number: "121",
            numbers: "198",
            iconUrl: "${baseIconUrl}1.png",
          ),

          thinInfoTile(
            name: "Jio",
            number: "1299",
            iconUrl: "${baseIconUrl}2.png",
          ),

          thinInfoTile(
            name: "VI",
            number: "199",
            numbers: "198",
            iconUrl: "${baseIconUrl}3.png",
          ),

        ],
      ),

    );
  }
  Widget thinInfoTile({
    required String name,
    required String number,
    String? numbers, // optional
    required String iconUrl,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black12),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: Colors.grey.shade200,
              child: ClipOval(
                child: Image.network(
                  iconUrl,
                  width: 36,
                  height: 36,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return Image.asset(
                      "assets/images/app_logo.png",
                      width: 36,
                      height: 36,
                    );
                  },
                ),
              ),
            ),

            const SizedBox(width: 14),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  name,
                  color: appColors.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(height: 4),
                AppText(
                  number,
                  color: appColors.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),

                /// ✅ only show if numbers exists
                if (numbers != null && numbers.isNotEmpty)
                  AppText(
                    numbers,
                    color: appColors.primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }



}
