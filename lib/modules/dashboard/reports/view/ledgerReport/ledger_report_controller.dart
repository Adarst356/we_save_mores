import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../api/ui_state.dart';
import '../../data/ledger_report_repo.dart';
import '../../data/ledger_report_response.dart';

class WalletHistoryController extends GetxController {
  final repo = LedgerReportRepo();

  /// UI State Holder
  Rx<UiState<LedgerReportResponse>> walletHistoryState = UiState<LedgerReportResponse>.none().obs;

  /// Filters
  RxString fromDate = "".obs;
  RxString toDate = "".obs;
  RxString selectedTop = "10".obs;

  /// Search
  Rx<TextEditingController> searchTextController = TextEditingController().obs;

  RxString searchQuery = "".obs;

  /// Dropdown options
  final List<String> topOptions = ["10", "50", "100", "200", "500"];

  @override
  void onInit() {
    super.onInit();

    DateTime today = DateTime.now();
    fromDate.value = _formatDate(today);
    toDate.value = _formatDate(today);

    fetchWalletHistory();
  }

  /// Format Date → 09 Dec 2025
  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, "0");
    final month = DateFormat("MMM").format(date);
    return "$day $month ${date.year}";
  }

  /// API Call
  Future<void> fetchWalletHistory() async {
    walletHistoryState.value = UiState.loading();

    final body = {
      "WalletTypeID": 1,
      "accountNo": "9798374412",
      "fromDate": fromDate.value,
      "toDate": toDate.value,
      "topRows": selectedTop.value,
      "isExport": "false",
      "loginTypeID": 0,
      "oid": "0",
      "status": "0",
    };

    await repo.getLedgerReportData(
      body: body,
      callback: (state) {
        walletHistoryState.value = state;
      },
    );
  }

  /// Apply Filters
  void applyFilters() {
    fetchWalletHistory();
  }
}
