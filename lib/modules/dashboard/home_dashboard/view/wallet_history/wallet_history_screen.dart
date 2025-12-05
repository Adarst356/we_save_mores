import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_save_more/utils/spacing.dart';
import 'package:we_save_more/widget/app_text.dart';
import '../../../../../utils/custom_appbar.dart';
import 'wallet_history_controller.dart';

class WalletHistoryScreen extends StatelessWidget {
  WalletHistoryScreen({super.key});

  final controller = Get.put(WalletHistoryController());
  final searchController = TextEditingController();

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
                        controller.searchTextController.value.text = value
                            .trim();
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
                          controller.searchTextController.value.clear();
                          controller.searchQuery.value = '';
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.clear,
                            size: 20,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    }
                    return SizedBox.shrink();
                  }),
                ],
              ),
            ),
          ),

          Expanded(
            child: Obx(() {
              return controller.walletState.value.when(
                loading: () => const Center(child: CircularProgressIndicator()),

                error: (msg) => Center(
                  child: AppText(msg, color: Colors.red, fontSize: 16),
                ),

                none: () => const SizedBox(),

                success: (data) {
                  final list = data.userDaybookReport ?? [];

                  if (list.isEmpty) return _emptyUI();

                  return ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      final item = list[index];

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

  Widget _emptyUI() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.info_outline, size: 70, color: Colors.grey),
          SizedBox(height: 10),
          AppText("No records found", fontSize: 16, color: Colors.grey),
        ],
      ),
    );
  }
}
