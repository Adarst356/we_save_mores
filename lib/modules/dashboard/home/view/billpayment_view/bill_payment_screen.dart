import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:we_save_more/modules/dashboard/home/view/billpayment_view/GetRn_offer_screen.dart';
import 'package:we_save_more/modules/dashboard/home/view/billpayment_view/select_zone_screen.dart';
import 'package:we_save_more/routes/app_routes.dart';
import 'package:we_save_more/theme/app_colors.dart';
import 'package:we_save_more/utils/spacing.dart';
import 'package:we_save_more/widget/app_text.dart';
import '../../../../../utils/constant.dart';
import '../../../../../utils/custom_appbar.dart';
import '../../../reports/data/report_response.dart';
import '../../../reports/view/rechargeReport/report_controller.dart';
import '../../data/billpayment_response.dart';
import 'bill_payment_controller.dart';

class BillPaymentScreen extends StatelessWidget {
  BillPaymentScreen({super.key});

  final controller = Get.put(BillPaymentController());
  final ReportController reportController = Get.find<ReportController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: CustomAppbar(
        title: controller.serviceName,
        showLeft: true,
        leftIcon: InkWell(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back, color: theme.colorScheme.onPrimary),
        ),
      ),
      body: GetBuilder<BillPaymentController>(
        builder: (_) {
          if (controller.isPrepaid || controller.isDTH) {
            return _buildFullForm(context);
          }
          return _buildSimpleForm(context);
        },
      ),
    );
  }

  // ==========================================
  // FULL FORM (Prepaid/DTH)
  // ==========================================
  Widget _buildFullForm(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 4,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Mobile/DTH Number Field with Validation
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: controller.mobileNoController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        controller.isDTH
                            ? Icons.settings_input_antenna
                            : Icons.phone_android,
                        color: Colors.grey,
                      ),
                      hintText: controller.isDTH
                          ? "Enter DTH Number"
                          : "Enter Mobile Number",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: controller.mobileError.value.isEmpty
                              ? Colors.blue
                              : Colors.red,
                          width: 2,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
                    ],
                    onChanged: (value) async {
                      controller.update();

                      /// ✅ Only auto-open operator screen
                      /// if operator is NOT already selected
                      if (value.length == 10 &&
                          controller.isMobileValid &&
                          controller.providerId == null) {

                        final result = await Get.toNamed(
                          AppRoutes.serviceOperator,
                          arguments: {
                            "serviceId": controller.serviceId,
                            "serviceName": controller.serviceName,
                            "mobileNumber": value,
                          },
                        );

                        if (result != null) {
                          controller.providerId = result["providerId"];
                          controller.providerName = result["providerName"];
                          controller.providerImage = result["providerImage"];
                          controller.oid = result["oid"];
                          controller.operatorError.value = '';
                          controller.update();
                        }
                      }
                    },

                  ),

                  // Error Message
                  Obx(() {
                    if (controller.mobileError.value.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return Padding(
                        padding: const EdgeInsets.only(top: 6, left: 4),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.error_outline,
                              size: 14,
                              color: Colors.red,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              controller.mobileError.value,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        )
                    );
                  }),

                  // Digit Count Validation
                  const SizedBox(height: 8),
                  Obx(() {
                    final count = controller.mobileDigitCount.value;
                    final isEmpty = count == 0;

                    if (isEmpty) {
                      return const SizedBox.shrink();
                    }

                    if (controller.isDTH) {
                      final isValid = count == 10;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "$count/10",
                            style: TextStyle(
                              fontSize: 12,
                              color: isValid ? Colors.green : Colors.orange,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                isValid
                                    ? Icons.check_circle
                                    : Icons.info_outline,
                                size: 14,
                                color: isValid ? Colors.green : Colors.orange,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                isValid
                                    ? "Valid"
                                    : "DTH Number Should Be 10 Digit",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: isValid ? Colors.green : Colors.orange,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }

                    final isStartDigitValid =
                        controller.isStartDigitValid.value;
                    final isValid = controller.isMobileValid;

                    if (!isStartDigitValid) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "$count/10",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.error_outline,
                                size: 14,
                                color: Colors.red,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "Mobile Number must start with 6, 7, 8, 9",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "$count/10",
                          style: TextStyle(
                            fontSize: 12,
                            color: isValid ? Colors.green : Colors.orange,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              isValid ? Icons.check_circle : Icons.info_outline,
                              size: 14,
                              color: isValid ? Colors.green : Colors.orange,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              isValid
                                  ? "Valid"
                                  : "Mobile Number Should Be 10 Digit",
                              style: TextStyle(
                                fontSize: 12,
                                color: isValid ? Colors.green : Colors.orange,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
                ],
              ),

              Spacing.h16,

              // Select Operator with Error
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: controller.operatorError.value.isEmpty
                            ? Colors.grey.shade300
                            : Colors.red,
                        width: controller.operatorError.value.isEmpty ? 1 : 2,
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        final result = await Get.toNamed(
                          AppRoutes.serviceOperator,
                          arguments: {
                            "serviceId": controller.serviceId,
                            "serviceName": controller.serviceName,
                          },
                        );

                        if (result != null) {
                          controller.providerId = result["providerId"];
                          controller.providerName = result["providerName"];
                          controller.providerImage = result["providerImage"];
                          controller.oid = result["oid"];
                          controller.operatorError.value = '';
                          controller.update();
                        }
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 60),
                            child: AppText(
                              controller.serviceName,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 22,
                                backgroundColor: Colors.blue.shade50,
                                child: (controller.providerImage == null ||
                                    controller.providerImage!.isEmpty)
                                    ? Icon(
                                  Icons.wifi_tethering,
                                  color: Colors.blue,
                                  size: 26,
                                )
                                    : ClipOval(
                                  child: Image.network(
                                    "$baseIconUrl${controller.providerImage}",
                                    width: 44,
                                    height: 44,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: AppText(
                                  controller.providerName?.isNotEmpty == true
                                      ? controller.providerName!
                                      : "Select Operator",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.grey,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                size: 26,
                                color: Colors.deepPurple,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Operator Error Message
                  Obx(() {
                    if (controller.operatorError.value.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return Padding(
                        padding: const EdgeInsets.only(top: 6, left: 4),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.error_outline,
                              size: 14,
                              color: Colors.red,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              controller.operatorError.value,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        )
                    );
                  }),
                ],
              ),

              Spacing.h16,

              // Amount Input with Error
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: controller.amountController,
                    decoration: InputDecoration(
                      prefixIcon:
                      const Icon(Icons.currency_rupee, color: Colors.grey),
                      hintText: "Enter Amount",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: controller.amountError.value.isEmpty
                              ? Colors.blue
                              : Colors.red,
                          width: 2,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  // Amount Error Message
                  Obx(() {
                    if (controller.amountError.value.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return Padding(
                        padding: const EdgeInsets.only(top: 6, left: 4),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.error_outline,
                              size: 14,
                              color: Colors.red,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              controller.amountError.value,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        )
                    );
                  }),
                ],
              ),

              Obx(() {
                if (controller.selectedPlanDesc.isEmpty) {
                  return const SizedBox.shrink();
                }

                return Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.deepPurple.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Selected Plan",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        controller.selectedPlanDesc.value,
                        style: const TextStyle(fontSize: 13, height: 1.4),
                      ),
                    ],
                  ),
                );
              }),

              Spacing.h20,

              // Recharge Button WITH VALIDATION
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: appColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (controller.validateForm()) {
                      // Proceed with recharge
                      // controller.processRecharge();
                    }
                  },
                  child: AppText(
                    "Recharge",
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Spacing.h16,
              /// View Plan & Best Offer buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () async {
                        controller.amountError.value = '';
                        if (controller.validateForm(checkAmount: false)) {
                          await Get.to(() => SelectZoneScreen());
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: appColors.primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: AppText(
                        "View Plan",
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Spacing.w12,
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        // Clear amount error before validation
                        controller.amountError.value = '';

                        if (controller.validateForm(checkAmount: false)) {
                          Get.toNamed(AppRoutes.rOffers, arguments: {
                            "accountNo":
                            controller.mobileNoController.text.trim(),
                            "oid": controller.oid
                          });
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: appColors.primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: AppText(
                        "Best Offer",
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        Spacing.h20,

        // Recent Transactions Section (Same as ReportScreen)
        _buildRecentTransactionsSection(),
      ],
    );
  }

  // ==========================================
  // RECENT TRANSACTIONS SECTION (Same as ReportScreen)
  // ==========================================
  Widget _buildRecentTransactionsSection() {
    return Obx(() {
      // Show loader while loading
      if (controller.isLoadingRecentTransactions.value) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }

      /// DATA EMPTY after loading
      if (controller.recentTransactions.isEmpty) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              AppText(
                "No recent transactions",
                fontSize: 16,
                color: Colors.grey,
              ),
              Spacing.h12,
              AppText(
                "Pull down to refresh",
                fontSize: 12,
                color: Colors.grey.shade400,
              ),
            ],
          ),
        );
      }

      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                "Recent Transactions",
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to full report screen
                  Get.toNamed(AppRoutes.report);
                },
                child: AppText(
                  "View All",
                  fontSize: 15,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),

          Spacing.h10,

          // Show list with pull to refresh
          RefreshIndicator(
            onRefresh: controller.refreshRecentTransactions,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.recentTransactions.length,
              itemBuilder: (context, index) {
                final item = controller.recentTransactions[index];
                return _transactionTile(item);
              },
            ),
          ),
        ],
      );
    });
  }

  // ==========================================
  // SIMPLE FORM (Broadband, Landline, etc.)
  // ==========================================
  Widget _buildSimpleForm(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 4,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey.shade200,
                      child: (controller.providerImage == null ||
                          controller.providerImage!.isEmpty)
                          ? Icon(Icons.wifi, color: Colors.blue, size: 24)
                          : ClipOval(
                        child: Image.network(
                          "$baseIconUrl${controller.providerImage}",
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: AppText(
                        controller.providerName ?? controller.serviceName,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              Spacing.h16,

              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person, color: Colors.grey),
                  hintText: controller.serviceName == "Broadband"
                      ? "Enter UserId"
                      : "Enter Account Number",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.text,
              ),

              Spacing.h16,

              if (controller.serviceName != "Broadband") ...[
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.currency_rupee,
                      color: Colors.grey,
                    ),
                    hintText: "Enter Amount",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                Spacing.h16,
              ],

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: appColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: AppText(
                    controller.serviceName == "Broadband"
                        ? "Fetch Bill"
                        : "Bill Payment",
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),

        Spacing.h20,

        // Recent Transactions Section (Same as ReportScreen)
        _buildRecentTransactionsSection(),
      ],
    );
  }

  // ==========================================
  // TRANSACTION TILE (Same as ReportScreen)
  // ==========================================
  Widget _transactionTile(RechargeReport item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
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
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey.shade200,
                  child: ClipOval(
                    child: Image.network(
                      "$baseIconUrl${item.oid}.png",
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          "assets/images/app_logo.png",
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
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
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.shareReport, arguments: {
                        "date": item.modifyDate,
                        "status": item.type,
                        "operator": item.operator,
                        "mobile": item.customerNo ?? item.account,
                        "amount": item.amount,
                        "transactionId": item.transactionID,
                        "providerRefId": item.liveID,
                        "operatorImage": "$baseIconUrl${item.oid}.png",
                      });
                    },
                    child: Container(
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
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}