import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_save_more/routes/app_routes.dart';
import 'package:we_save_more/theme/app_colors.dart';
import 'package:we_save_more/utils/spacing.dart';
import 'package:we_save_more/widget/app_text.dart';
import '../../../../../utils/constant.dart';
import '../../../../../utils/custom_appbar.dart';
import 'bill_payment_controller.dart';

class BillPaymentScreen extends StatelessWidget {
  BillPaymentScreen({super.key});

  final controller = Get.put(BillPaymentController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: CustomAppbar(
        title: controller.serviceName,
        showLeft: true,
        leftIcon: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back, color: theme.colorScheme.onPrimary),
        ),
      ),
      body: GetBuilder<BillPaymentController>(
        builder: (_) {
          // For Prepaid/DTH: Show full form (with Select Operator option)
          if (controller.isPrepaid || controller.isDTH) {
            return _buildFullForm(context);
          }

          // For other services (Broadband, Landline, etc.):
          // Show simple form (provider already selected)
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
              // Number Input
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    controller.isDTH ? Icons.settings_input_antenna : Icons.phone_android,
                    color: Colors.grey,
                  ),
                  hintText: controller.isDTH ? "Enter DTH Number" : "Enter Prepaid Number",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),

              Spacing.h16,

              // Select Operator (clickable)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: GestureDetector(
                  onTap: () async {
                    final result = await Get.toNamed(
                      AppRoutes.serviceProvider,
                      arguments: {
                        "serviceId": controller.serviceId,
                        "serviceName": controller.serviceName,
                      },
                    );

                    if (result != null) {
                      controller.providerId = result["providerId"];
                      controller.providerName = result["providerName"];
                      controller.providerImage = result["providerImage"];
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
                            child: (controller.providerImage == null || controller.providerImage!.isEmpty)
                                ? Icon(Icons.wifi_tethering, color: Colors.blue, size: 26)
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
                          Icon(Icons.keyboard_arrow_down, size: 26, color: Colors.deepPurple),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Spacing.h16,

              // Amount Input
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.currency_rupee, color: Colors.grey),
                  hintText: "Enter Amount",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),

              Spacing.h20,

              // Recharge Button
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
                    "Recharge",
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              Spacing.h16,

              // View Plan & Best Offer buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
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
                      onPressed: () {},
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

        // Recent Transactions
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            AppText("Recent Transactions", fontSize: 16, fontWeight: FontWeight.bold),
            AppText("View All", fontSize: 15, color: Colors.blue, decoration: TextDecoration.underline),
          ],
        ),

        Spacing.h10,

        ...List.generate(3, (index) => _transactionTile()),
      ],
    );
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
              // Display selected provider (non-editable)
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
                      child: (controller.providerImage == null || controller.providerImage!.isEmpty)
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

              // UserId / Account Number Input
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

              // Amount Input (only for services that need it)
              if (controller.serviceName != "Broadband") ...[
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.currency_rupee, color: Colors.grey),
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

              // Bill Payment / Fetch Bill Button
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
                    controller.serviceName == "Broadband" ? "Fetch Bill" : "Bill Payment",
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

        // Recent Transactions
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            AppText("Recent Transactions", fontSize: 16, fontWeight: FontWeight.bold),
            AppText("View All", fontSize: 15, color: Colors.blue, decoration: TextDecoration.underline),
          ],
        ),

        Spacing.h10,

        ...List.generate(3, (index) => _transactionTile()),
      ],
    );
  }

  // ==========================================
  // TRANSACTION TILE (same for both)
  // ==========================================
  Widget _transactionTile() {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                  SizedBox(width: 5),
                  AppText("06 Dec 2025 10:56 AM"),
                ],
              ),
              Row(
                children: const [
                  Icon(Icons.check_circle, color: Colors.green, size: 20),
                  SizedBox(width: 4),
                  AppText("SUCCESS", color: Colors.green),
                ],
              ),
            ],
          ),
          Spacing.h10,
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.red.shade100,
                backgroundImage: const AssetImage("assets/images/app_logo.png"),
                radius: 20,
              ),
              Spacing.w10,
              Expanded(
                child: Text(
                  "Reliance Jio\n7739340164",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              AppText("₹ 299", color: Colors.blue, fontSize: 16),
            ],
          ),
          Spacing.h10,
          AppText("Transaction Id  : S251206105631837BFC02"),
          AppText("Provider Ref Id : RJ1302234936"),
          Spacing.h10,
          AppText("Dispute Status", fontWeight: FontWeight.bold),
          AppText("Rejected", color: Colors.red),
          Spacing.h10,
          Align(
            alignment: Alignment.centerRight,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.share, size: 18),
              label: const Text("Share"),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.deepPurple),
              ),
            ),
          ),
        ],
      ),
    );
  }
}