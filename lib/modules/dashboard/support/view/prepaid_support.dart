import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_save_more/modules/dashboard/support/view/support_controller.dart';
import 'package:we_save_more/modules/dashboard/support/view/support_tollfree_controller.dart';
import 'package:we_save_more/theme/app_colors.dart';
import 'package:we_save_more/widget/app_text.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/custom_appbar.dart' show CustomAppbar;

class SupportTollFreeNumbers extends StatelessWidget {
  SupportTollFreeNumbers({super.key});

  final SupportTollFreeController controller = Get.put(
    SupportTollFreeController(),
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Filtered list based on opType
    final filteredList = controller.getSupportListItems(controller.opType);

    return Scaffold(
      appBar: CustomAppbar(
        title: controller.opType==1?"Prepaid Support":"DTH Support",
        showLeft: true,
        leftIcon: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back, color: theme.colorScheme.onPrimary),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: filteredList.length,
        itemBuilder: (context, index) {
          final operator = filteredList[index];
          return thinInfoTile(
            name: operator.name,
            numbers: operator.tollFree,
              iconUrl: "$baseIconUrl${operator.image}"
          );
        },
      ),
    );
  }

  Widget thinInfoTile({
    required String name,
    required String numbers,
    required String iconUrl,
  }) {
    final numberList = numbers
        .split(RegExp(r'[,\\n]'))
        .map((e) => e.trim())
        .toList();

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
                  iconUrl ?? "",
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    name,
                    color: appColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  const SizedBox(height: 6),
                  ...numberList.map(
                    (number) => Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: AppText(
                        number,
                        color: appColors.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
