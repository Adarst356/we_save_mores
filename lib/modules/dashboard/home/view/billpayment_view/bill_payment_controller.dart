import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_save_more/modules/dashboard/reports/data/report_response.dart';

import '../../../reports/view/rechargeReport/report_controller.dart';

class BillPaymentController extends GetxController {
  late int serviceId;
  late String serviceName;

  int? providerId;
  String? providerName;
  String? providerImage;
  int? oid;

  // Text controllers
  final TextEditingController mobileNoController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  // Validation observables
  RxInt mobileDigitCount = 0.obs;
  RxBool isStartDigitValid = true.obs;

  // Inline error messages
  RxString mobileError = ''.obs;
  RxString operatorError = ''.obs;
  RxString amountError = ''.obs;

  RxString selectedPlanDesc = ''.obs;

  // For recent transactions (like ReportScreen)
  RxBool isLoadingRecentTransactions = false.obs;
  RxList<RechargeReport> recentTransactions = <RechargeReport>[].obs;

  bool get isPrepaid => serviceName.toLowerCase() == "prepaid";
  bool get isDTH => serviceName.toLowerCase() == "dth";

  @override
  void onInit() {
    super.onInit();

    final args = Get.arguments ?? {};
    serviceId = args["serviceId"] ?? 0;
    serviceName = args["serviceName"] ?? "";
    providerId = args["providerId"];
    providerName = args["providerName"];
    providerImage = args["providerImage"];
    oid = args["oid"];

    mobileNoController.addListener(() {
      final text = mobileNoController.text;
      mobileDigitCount.value = text.length;

      if (text.isEmpty) {
        isStartDigitValid.value = true;
        return;
      }

      final firstDigit = text[0];
      isStartDigitValid.value =
          firstDigit == '6' || firstDigit == '7' || firstDigit == '8' || firstDigit == '9';

      mobileError.value = '';
    });

    amountController.addListener(() {
      amountError.value = '';
    });

    // Fetch recent transactions
    fetchRecentTransactions();
  }

  bool get isMobileValid =>
      mobileDigitCount.value == 10 && isStartDigitValid.value;

  /// 🔥 VALIDATION METHOD
  /// checkAmount: true for Recharge button (checks all fields)
  /// checkAmount: false for View Plan & Best Offer buttons (skips amount check)
  bool validateForm({bool checkAmount = true}) {
    bool isValid = true;

    // Validate Mobile/DTH Number
    if (!isMobileValid) {
      mobileError.value = isDTH
          ? "Enter valid 10 digit DTH number"
          : "Enter valid 10 digit mobile number";
      isValid = false;
    }

    // Validate Operator Selection
    if (providerId == null) {
      operatorError.value = "Please select operator";
      isValid = false;
    } else {
      operatorError.value = '';
    }

    // Validate Amount (only if checkAmount is true)
    if (checkAmount && amountController.text.trim().isEmpty) {
      amountError.value = "Please enter amount";
      isValid = false;
    }

    return isValid;
  }

  /// Fetch recent transactions (same as ReportScreen)
  Future<void> fetchRecentTransactions() async {
    try {
      isLoadingRecentTransactions.value = true;

      /// Use the same API call as ReportScreen but limit to recent and few records
      final ReportController reportController = Get.find<ReportController>();
      await reportController.getReport();

      /// Get only the first 3 transactions for the bill payment screen
      if (reportController.rechargeList.isNotEmpty) {
        recentTransactions.value = reportController.rechargeList.toList();
      }
    } catch (e) {
      print("Error fetching recent transactions: $e");
    } finally {
      isLoadingRecentTransactions.value = false;
    }
  }

  /// Refresh recent transactions
  Future<void> refreshRecentTransactions() async {
    await fetchRecentTransactions();
  }

  @override
  void onClose() {
    mobileNoController.dispose();
    amountController.dispose();
    super.onClose();
  }
}