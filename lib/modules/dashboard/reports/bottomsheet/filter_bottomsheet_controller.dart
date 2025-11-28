import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterBottomSheetController extends GetxController {
  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController toDateController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController accountController = TextEditingController();
  final TextEditingController transactionController = TextEditingController();

  final RxString selectedTop = 'All'.obs;
  final RxString selectedStatus = 'All'.obs;

  final List<String> topOptions = ['All', '10', '20', '50', '100'];
  final List<String> statusOptions = ['All', 'Success', 'Pending', 'Failed', 'Refund'];

  /// Convert status to API format
  String getStatusValue() {
    switch (selectedStatus.value) {
      case 'Success':
        return '2';
      case 'Pending':
        return '1';
      case 'Failed':
        return '3';
      case 'Refund':
        return '4';
      default:
        return '0'; // All
    }
  }

  /// Convert Top to API format
  String getTopValue() {
    return selectedTop.value == 'All' ? '50' : selectedTop.value;
  }

  /// Get filter data for API
  Map<String, String> getFilterData() {
    return {
      "fromDate": fromDateController.text.isEmpty ? "01-Jan-2024" : fromDateController.text,
      "toDate": toDateController.text.isEmpty ? "31-Dec-2025" : toDateController.text,
      "mobile": mobileController.text,
      "account": accountController.text,
      "transaction": transactionController.text,
      "top": getTopValue(),
      "status": getStatusValue(),
    };
  }

  /// Clear all filters
  void clearFilters() {
    fromDateController.clear();
    toDateController.clear();
    mobileController.clear();
    accountController.clear();
    transactionController.clear();
    selectedTop.value = 'All';
    selectedStatus.value = 'All';
  }

  @override
  void onClose() {
    fromDateController.dispose();
    toDateController.dispose();
    mobileController.dispose();
    accountController.dispose();
    transactionController.dispose();
    super.onClose();
  }
}