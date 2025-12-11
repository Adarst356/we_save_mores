import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_save_more/modules/dashboard/reports/view/userDayBookReport/user_day_book_controller.dart';
import 'package:we_save_more/utils/spacing.dart';
import 'package:we_save_more/widget/app_text.dart';
import 'package:we_save_more/widget/app_dialog.dart';
import '../../../../../utils/custom_appbar.dart';

class UserDayBookScreen extends StatelessWidget {
  UserDayBookScreen({super.key});

  final controller = Get.put(UserDayBookController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0),
      appBar: CustomAppbar(
        title: "User Day Book",
        showLeft: true,
        leftIcon: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back, color: theme.colorScheme.onPrimary),
        ),
        rightIcon: GestureDetector(
          onTap: () {},
          child: Icon(Icons.filter_list, color: theme.colorScheme.onPrimary),
        ),
      ),

      body: Column(
        children: [
          /// ------------ TOP SUMMARY BOX -------------------
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppText(
                        'Total Self Commission',
                        color: Colors.yellow.shade700,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        align: TextAlign.center,
                      ),
                      Spacing.h8,
                      const AppText(
                        '₹ 0',
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),

                Container(width: 1, height: 40, color: Colors.grey.shade300),

                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppText(
                        'Total Team Commission',
                        align: TextAlign.center,
                        color: Colors.yellow.shade700,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                      Spacing.h8,
                      const AppText(
                        '₹ 0',
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          ///------------ LIST / LOADING UI -------------------
          Expanded(
            child: Obx(() {
              return controller.userDayBookState.value.when(

                loading: () => const Center(child: CircularProgressIndicator()),

                error: (msg) => Center(
                  child: AppText(
                    msg,
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),

                none: () => const SizedBox(),

                /// ------------ SUCCESS -------------------
                success: (data) {
                  if (data.userDaybookReport == null ||
                      data.userDaybookReport!.isEmpty) {

                    /// ==== SHOW DIALOG ====
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      AppDialog.show(
                        title: 'Data Not Found',
                        message: 'No day book records available!',
                        imagePath: "assets/icons/close.png",
                        iconColor: Colors.blue,
                        iconBackgroundColor: Colors.blue.withOpacity(0.1),
                        primaryButtonText: 'OK',
                        primaryButtonColor: Colors.blue,
                        onPrimaryPressed: () {
                          Get.back();
                        },
                      );
                    });

                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/network_error.png",
                              height: 120),
                          Spacing.h16,
                          const AppText(
                            'Data not found',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    );
                  }

                  // ============= LIST VIEW =============
                  return ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: data.userDaybookReport!.length,
                    itemBuilder: (context, index) {
                      final item = data.userDaybookReport![index];

                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                "Txn: ${item['transactionID'] ?? '--'}",
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              Spacing.h8,
                              AppText("Amount: ₹ ${item['amount'] ?? '0'}"),
                              AppText("Type: ${item['type'] ?? '--'}"),
                              AppText("Date: ${item['createdDate'] ?? '--'}"),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}