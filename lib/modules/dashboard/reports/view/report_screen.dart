import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:we_save_more/theme/app_colors.dart';
import 'package:we_save_more/utils/spacing.dart';
import 'package:we_save_more/widget/app_text.dart';
import '../../../../utils/custom_appbar.dart';
import 'report_controller.dart';

class ReportScreen extends StatelessWidget {
  ReportScreen({super.key});

  final ReportController controller = Get.put(ReportController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: CustomAppbar(
        title: "Informations",
        leftIcon: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, color: theme.colorScheme.onPrimary),
        ),
        rightIcon: Icon(Icons.filter_list, color: theme.colorScheme.onPrimary),
      ),

      body: Column(
        children: [
          ///SEARCH BOX
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  Spacing.w10,
                  Icon(Icons.search, size: 22, color: Colors.grey),

                  Spacing.h8,

                  /// Search TextField
                  Expanded(
                    child: TextField(
                      controller: controller.searchController,
                      onChanged: controller.onSearchChanged,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),

                  /// Clear Button
                  Obx(
                    () => controller.searchText.value.isNotEmpty
                        ? IconButton(
                            icon: Icon(Icons.clear, size: 18),
                            onPressed: controller.clearSearch,
                          )
                        : const SizedBox(),
                  ),
                ],
              ),
            ),
          ),
          rechargeReportCard()
        ],
      ),
    );
  }
}
Widget rechargeReportCard() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 4,
          offset: Offset(0, 2),
        )
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// -------- TOP ROW (DATE + STATUS) --------
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.calendar_month, color: Colors.grey),

            Row(
              children: [
                SvgPicture.asset("assets/svg/success.svg", height: 20),
                Spacing.w6,
                AppText(
                  "SUCCESS",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff058239),
                ),
              ],
            ),
          ],
        ),

        Spacing.h16,

        /// -------- LOGO + OPERATOR NAME + NUMBER --------
        Row(
          children: [
            Image.asset(
              "assets/images/app_logo.png",
              width: 60,
              height: 60,
            ),
            Spacing.w12,
            Expanded(
              child: Row(
                children: [
                  /// LEFT SIDE – NAME + NUMBER
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        "Airtel",
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      Spacing.h4,
                      AppText(
                        "8953467777",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),

                  Spacer(), /// <-- VERY IMPORTANT

                  /// RIGHT SIDE – AMOUNT
                  AppText(
                    "₹ 349",
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.blue,
                  ),
                ],
              ),
            )


          ],
        ),

        Spacing.h12,

        /// -------- TRANSACTION DETAILS --------
        AppText(
          "Transaction Id   :  3527383973972628303983",
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        AppText(
          "Provider Ref Id  :  36g5g6727t7JWJ",
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),

        Spacing.h16,

        /// -------- BUTTONS (DISPUTE & SHARE) --------
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            /// DISPUTE BUTTON
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.yellow, width: 2),
              ),
              child: Row(
                children: [
                  SvgPicture.asset("assets/svg/dispute.svg", height: 18),
                  Spacing.w6,
                  AppText(
                    "Dispute",
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ],
              ),
            ),

            Spacing.w12,

            /// SHARE BUTTON
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.yellow, width: 2),
              ),
              child: Row(
                children: [
                  Icon(Icons.share, size: 18, color: Colors.purple),
                  Spacing.w6,
                  AppText(
                    "Share",
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ],
              ),
            )
          ],
        )
      ],
    ),
  );
}