import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/custom_appbar.dart';
import 'package:we_save_more/widget/app_text.dart';
import 'package:we_save_more/utils/spacing.dart';

class WalletHistoryScreen extends StatelessWidget {
  WalletHistoryScreen({super.key});

  final searchTextController = TextEditingController();
  final searchQuery = "".obs;

  // Dummy data for UI demonstration
  final List<Map<String, String>> walletHistoryList = [
    {
      "transactionId": "TXN12345",
      "amount": "500",
      "transactionType": "Credit",
      "transactionDate": "2025-12-09"
    },
    {
      "transactionId": "TXN12346",
      "amount": "200",
      "transactionType": "Debit",
      "transactionDate": "2025-12-08"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0),
      appBar: CustomAppbar(
        title: "Wallet History",
        showLeft: true,
        leftIcon: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back, color: theme.colorScheme.onPrimary),
        ),
        rightIcon: GestureDetector(
          onTap: () {
            /// Filter BottomSheet - optional later
          },
          child: Icon(Icons.filter_list, color: theme.colorScheme.onPrimary),
        ),
      ),

      body: Column(
        children: [
          /// Search Bar
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
                      controller: searchTextController,
                      textInputAction: TextInputAction.done,
                      onChanged: (value) => searchQuery.value = value.trim(),
                      decoration: const InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  ),
                  /// Clear Search
                  Obx(() {
                    if (searchQuery.value.isNotEmpty) {
                      return GestureDetector(
                        onTap: () {
                          searchTextController.clear();
                          searchQuery.value = "";
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(Icons.clear, size: 20, color: Colors.grey),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  }),
                ],
              ),
            ),
          ),

          /// Data List
          Expanded(
            child: Obx(() {
              final filteredList = walletHistoryList.where((item) {
                final search = searchQuery.value.toLowerCase();
                if (search.isEmpty) return true;

                return (item["transactionId"] ?? "")
                    .toLowerCase()
                    .contains(search) ||
                    (item["transactionType"] ?? "").toLowerCase().contains(search);
              }).toList();

              if (filteredList.isEmpty) return _emptyUI();

              return ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: filteredList.length,
                itemBuilder: (_, i) {
                  final item = filteredList[i];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            "Txn: ${item["transactionId"] ?? '--'}",
                            fontWeight: FontWeight.bold,
                          ),
                          Spacing.h8,
                          AppText("Amount: ₹ ${item["amount"] ?? '0'}"),
                          AppText("Type: ${item["transactionType"] ?? '--'}"),
                          AppText("Date: ${item["transactionDate"] ?? '--'}"),
                        ],
                      ),
                    ),
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
