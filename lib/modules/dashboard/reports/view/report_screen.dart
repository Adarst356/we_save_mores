import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_save_more/theme/app_colors.dart';
import 'package:we_save_more/utils/spacing.dart';
import 'package:we_save_more/widget/app_text.dart';
import '../../../../utils/custom_appbar.dart';
import 'report_controller.dart';

class ReportScreen extends GetView<ReportController> {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: CustomAppbar(
        title: "Transaction Report",
        showLeft: false,
        leftIcon: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, color: theme.colorScheme.onPrimary),
        ),
        rightIcon: Icon(Icons.filter_list, color: theme.colorScheme.onPrimary),
      ),
      body: Column(
        children: [
          // ---------------- SEARCH BOX ----------------
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
                  Expanded(
                    child: TextField(
                      controller: controller.searchTextController.value,
                      textInputAction: TextInputAction.done,
                      textCapitalization: TextCapitalization.none,

                      onChanged: (value) {
                        controller.searchQuery.value = value.trim();
                      },

                      onSubmitted: (value) {
                        controller.searchQuery.value = value.trim();
                        controller.searchTextController.value.text = value.trim();
                      },

                      decoration: const InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),


                  // Clear button - only show when there's text
                  Obx(() {
                    if (controller.searchQuery.value.isNotEmpty) {
                      return GestureDetector(
                        onTap: () {
                          controller.searchTextController.value.clear(); // TextField clear
                          controller.searchQuery.value = ''; // Filter reset
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(Icons.clear, size: 20, color: Colors.grey),
                        ),
                      );
                    }
                    return SizedBox.shrink();
                  }),

                ],
              ),
            ),
          ),

          /// --------------- API + LIST -----------------
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              /// DATA EMPTY → Loader show until data arrives
              if (controller.rechargeList.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     Image.asset("assets/images/network_error.png"),
                      Spacing.h16,
                      AppText(
                        "No transactions found",
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                );
              }

              /// Use filtered list instead of original list
              final displayList = controller.filteredRechargeList;

              /// Show "no results" if search returned empty
              if (displayList.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search_off, size: 64, color: Colors.grey),
                      SizedBox(height: 16),
                      AppText(
                        "No results found for '${controller.searchQuery.value}'",
                        fontSize: 16,
                        color: Colors.grey,
                        align: TextAlign.center,
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                itemCount: displayList.length,
                itemBuilder: (context, index) {
                  final item = displayList[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: Container(
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
                          /// ------------------- DATE + STATUS -------------------
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.calendar_month, color: Colors.grey),
                                  SizedBox(width: 8),
                                  AppText(
                                    item.modifyDate ?? "--",
                                    fontSize: 10,
                                    color: Colors.black87,
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                decoration: BoxDecoration(
                                  color: item.type == "SUCCESS"
                                      ? Color(0xffE8F7EF)
                                      : item.type == "FAILED"
                                      ? Color(0xffFEEAEA)
                                      : Color(0xffFFF7E6),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      item.type == "SUCCESS"
                                          ? Icons.check_circle
                                          : item.type == "FAILED"
                                          ? Icons.error
                                          : Icons.access_time_filled,
                                      color: item.type == "SUCCESS"
                                          ? Colors.green
                                          : item.type == "FAILED"
                                          ? Colors.red
                                          : Colors.orange,
                                      size: 18,
                                    ),
                                    SizedBox(width: 6),
                                    AppText(
                                      item.type ?? "—",
                                      color: item.type == "SUCCESS"
                                          ? Colors.green
                                          : item.type == "FAILED"
                                          ? Colors.red
                                          : Colors.orange,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Spacing.h16,

                          /// ------------------- OPERATOR + NUMBER + AMOUNT -------------------
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/app_logo.png",
                                width: 60,
                                height: 60,
                              ),
                              Spacing.w12,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      item.operator ?? "Unknown Operator",
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    Spacing.h4,
                                    AppText(
                                      item.customerNo ?? item.account ?? "--",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ],
                                ),
                              ),
                              AppText(
                                "₹ ${item.amount?.toStringAsFixed(2) ?? "0"}",
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                          Spacing.h12,

                          /// ------------------- TRANSACTION DETAILS -------------------
                          AppText(
                            "Transaction ID : ${item.transactionID ?? "--"}",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          AppText(
                            "Provider Ref Id : ${item.liveID ?? "--"}",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          Spacing.h16,

                          /// ------------------- DISPUTE + SHARE -------------------
                          if (item.type == "SUCCESS")
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                /// Dispute
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.yellow, width: 2),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.report_problem, size: 18, color: Colors.orange),
                                      Spacing.w6,
                                      AppText(
                                        "Dispute",
                                        fontWeight: FontWeight.w700,
                                        color: appColors.primaryColor,
                                      ),
                                    ],
                                  ),
                                ),
                                Spacing.w12,

                                /// Share
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
                                        color: appColors.primaryColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          )
        ],
      ),
    );
  }
}