import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_save_more/theme/app_colors.dart';
import 'package:we_save_more/utils/spacing.dart';
import 'package:we_save_more/widget/app_text.dart';
import '../../../../utils/custom_appbar.dart';
import '../../profile/view/balance_controller.dart';
import 'add_money_controller.dart';

class AddMoneyScreen extends StatelessWidget {
  AddMoneyScreen({super.key});

  final AddMoneyController controller = Get.put(AddMoneyController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: CustomAppbar(
        title: "Add Money",
        showLeft: true,
        leftIcon: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back, color: theme.colorScheme.onPrimary),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacing.h20,

                /// Prepaid Wallet Card - Using BalanceController
                Obx(
                  () => Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              controller
                                      .balanceController
                                      .balanceData
                                      .value
                                      ?.data
                                      ?.prepaidWalletName ??
                                  'Prepaid Wallet',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: appColors.primaryColor,
                            ),
                            Spacing.h8,
                            AppText(
                              '₹ ${controller.balanceController.balance.value.toStringAsFixed(1)}',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.orange[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.account_balance_wallet,
                            color: Colors.orange[800],
                            size: 32,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacing.h20,

                /// Add Money To Wallet Section
                AppText(
                  'Add Money To Wallet :',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: appColors.primaryColor,
                ),
                Spacing.h12,

                /// Amount Input Field
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: TextField(
                    controller: controller.amountController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(fontSize: 18),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Amount',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.currency_rupee,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                Spacing.h20,

                /// Payment Methods List
                Obx(() {
                  if (controller.isLoadingPaymentModes.value) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  if (controller.paymentModes.isEmpty) {
                    return Center(
                      child: AppText(
                        'No payment methods available',
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    );
                  }

                  return Expanded(
                    child: ListView.builder(
                      itemCount: controller.paymentModes.length,
                      itemBuilder: (context, index) {
                        final mode = controller.paymentModes[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: GestureDetector(
                            onTap: () => controller.selectPaymentMethod(mode),
                            child: Obx(
                              () => Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color:
                                        controller
                                                .selectedOperator
                                                .value
                                                ?.oid ==
                                            mode.oid
                                        ? appColors.primaryColor
                                        : Colors.grey[300]!,
                                         width:
                                        controller
                                                .selectedOperator
                                                .value
                                                ?.oid ==
                                            mode.oid
                                        ? 2
                                        : 1,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey[300]!,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: AppText(
                                        mode.spKey?.replaceAll(
                                              RegExp(r'\d+'),
                                              '',
                                            ) ??
                                            'UPI',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    Spacing.w12,
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppText(
                                            mode.name ?? 'Payment Method',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black87,
                                          ),
                                          Spacing.h4,
                                          RichText(
                                            text: TextSpan(
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: 'Charges : ',
                                                  style: TextStyle(
                                                    color: Colors.grey[600],
                                                  ),
                                                ),
                                                TextSpan(
                                                  text:
                                                      '${mode.charge?.toDouble() ?? 0} ₹',
                                                  style: const TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Spacing.h2,
                                          RichText(
                                            text: TextSpan(
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: 'Min : ',
                                                  style: TextStyle(
                                                    color: Colors.grey[600],
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: '₹ ${mode.min ?? 0}',
                                                  style: const TextStyle(
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: ' - Max : ',
                                                  style: TextStyle(
                                                    color: Colors.grey[600],
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: '₹ ${mode.max ?? 0}',
                                                  style: const TextStyle(
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
                Spacer(),

                /// Add Money Button
                Obx(
                  () => SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: controller.isProcessing.value
                          ? null
                          : () => controller.addMoney(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: appColors.primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        disabledBackgroundColor: Colors.grey,
                      ),
                      child: controller.isProcessing.value
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const AppText(
                              'Add Money',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                    ),
                  ),
                ),
                Spacing.h20,
              ],
            ),
          ),

          /// Loading Overlay for Balance
          Obx(() {
            if (controller.balanceController.isLoading.value) {
              return Container(
                color: Colors.black26,
                child: const Center(child: CircularProgressIndicator()),
              );
            }
            return const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}
