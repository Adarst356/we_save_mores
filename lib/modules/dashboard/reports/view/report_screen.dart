import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_save_more/utils/spacing.dart';
import '../../../../utils/custom_appbar.dart';
import '../data/report_response.dart';
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

                  Obx(
                        () => controller.searchText.value.isNotEmpty
                        ? IconButton(
                      icon: Icon(Icons.clear, size: 18),
                      onPressed: controller.clearSearch,
                    )
                        : SizedBox(),
                  ),
                ],
              ),
            ),
          ),

          // --------------- API + LIST -----------------
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (!controller.hasData) {
                return Center(
                  child: Text("No Records Found"),
                );
              }

              return ListView.builder(
                itemCount: controller.rechargeList.length,
                itemBuilder: (context, index) {
                  final item = controller.rechargeList[index];

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
                          // ------------------- DATE + STATUS -------------------
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.calendar_month, color: Colors.grey),
                                  SizedBox(width: 8),
                                  Text(
                                    item.entryDate ?? "--",
                                    style: TextStyle(fontSize: 14, color: Colors.black87),
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
                                    Text(
                                      item.type ?? "—",
                                      style: TextStyle(
                                        color: item.type == "SUCCESS"
                                            ? Colors.green
                                            : item.type == "FAILED"
                                            ? Colors.red
                                            : Colors.orange,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 16),

                          // ------------------- OPERATOR + NUMBER + AMOUNT -------------------
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/app_logo.png",
                                width: 60,
                                height: 60,
                              ),

                              SizedBox(width: 12),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.operator ?? "Unknown Operator",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      item.customerNo ?? item.account ?? "--",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Text(
                                "₹ ${item.amount?.toStringAsFixed(2) ?? "0"}",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 12),

                          // ------------------- TRANSACTION DETAILS -------------------
                          Text(
                            "Transaction ID : ${item.transactionID ?? "--"}",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Provider Ref Id : ${item.liveID ?? "--"}",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                          ),

                          SizedBox(height: 16),

                          // ------------------- DISPUTE + SHARE -------------------
                          if (item.type == "SUCCESS")
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // Dispute
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.yellow, width: 2),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.report_problem, size: 18, color: Colors.orange),
                                      SizedBox(width: 6),
                                      Text(
                                        "Dispute",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(width: 12),

                                // Share
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.yellow, width: 2),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.share, size: 18, color: Colors.purple),
                                      SizedBox(width: 6),
                                      Text(
                                        "Share",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black87,
                                        ),
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
