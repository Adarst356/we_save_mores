import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:we_save_more/modules/dashboard/reports/data/report_repo.dart';
import 'package:we_save_more/modules/dashboard/reports/data/report_response.dart';
import '../../../../api/ui_state.dart';

class ReportController extends GetxController {
  final ReportRepo repo = ReportRepo();

  RxBool isLoading = true.obs; // Start with true to show loader initially
  Rx<TextEditingController> searchTextController = TextEditingController().obs;

  ///  SEARCH QUERY
  RxString searchQuery = ''.obs;

  ///  FILTER DATA
  Rx<Map<String, String>> currentFilters = Rx<Map<String, String>>({
    "fromDate": "01-Jan-2024",
    "toDate": "31-Dec-2025",
    "mobile": "",
    "account": "",
    "transaction": "",
    "top": "50",
    "status": "0",
  });

  final reportState = Rx<UiState<TransactionResponse>>(UiState.none());
  Rx<TransactionResponse?> reportData = Rx<TransactionResponse?>(null);

  /// Store original API response for filtering
  Rx<TransactionResponse?> originalReportData = Rx<TransactionResponse?>(null);

  /// DIRECT LIST FROM API
  List<RechargeReport> get rechargeList {
    return reportData.value?.rechargeReport ?? [];
  }

  bool get hasData => rechargeList.isNotEmpty;

  ///  FILTERED LIST BASED ON SEARCH
  List<RechargeReport> get filteredRechargeList {
    if (searchQuery.value.isEmpty) return rechargeList;

    return rechargeList.where((item) {
      final q = searchQuery.value.toLowerCase();

      return (item.operator?.toLowerCase().contains(q) ?? false) ||
          (item.customerNo?.toLowerCase().contains(q) ?? false) ||
          (item.account?.toLowerCase().contains(q) ?? false) ||
          (item.transactionID?.toLowerCase().contains(q) ?? false);
    }).toList();
  }

  ///  APPLY FILTERS FROM BOTTOM SHEET
  void applyFilters(Map<String, String> filters) {
    print("🎯 Applying Filters: $filters");
    currentFilters.value = filters;
    getReport();
  }

  ///  REFRESH DATA (keeps current filters)
  Future<void> refreshReport() async {
    print("🔄 Refreshing Report with current filters...");
    print("📋 Current Filters: ${currentFilters.value}");
    await getReport();
  }

  ///  RESET FILTERS AND REFRESH
  void resetAndRefresh() {
    print("🔄 Resetting filters and refreshing...");
    currentFilters.value = {
      "fromDate": "01-Jan-2024",
      "toDate": "31-Dec-2025",
      "mobile": "",
      "account": "",
      "transaction": "",
      "top": "50",
      "status": "0",
    };
    getReport();
  }

  /// API CALL WITH FILTERS
  Future<void> getReport() async {
    isLoading.value = true;

    Map<String, dynamic> body = {
      "apiid": 0,
      "fromDate": currentFilters.value["fromDate"] ?? "01-Jan-2024",
      "toDate": currentFilters.value["toDate"] ?? "31-Dec-2025",
      "isExport": false,
      "isRecent": true,
      "oid": 0,
      "opTypeID": "0",
      "status": int.tryParse(currentFilters.value["status"] ?? "0") ?? 0,
      "topRows": currentFilters.value["top"] ?? "50",
    };

    print("📤 API Request Body: $body");

    repo.getReport(
      body: body,
      callback: (state) {
        reportState.value = state;

        state.when(
          success: (data) {
            print("✅ Report Success");
            print("📊 Status Code: ${data.statuscode}");
            print("📋 Message: ${data.msg}");
            print("📦 Total Records from API: ${data.rechargeReport?.length ?? 0}");

            if (data.rechargeReport != null && data.rechargeReport!.isNotEmpty) {
              print("🔍 First Record:");
              print("   Operator: ${data.rechargeReport![0].operator}");
              print("   Amount: ${data.rechargeReport![0].amount}");
              print("   Type: ${data.rechargeReport![0].type}");
              print("   Date: ${data.rechargeReport![0].entryDate}");
              print("   Customer: ${data.rechargeReport![0].customerNo}");
              print("   Account: ${data.rechargeReport![0].account}");
              print("   TxnID: ${data.rechargeReport![0].transactionID}");
            } else {
              print("⚠️ No records in API response");
            }

            // Store original response
            originalReportData.value = data;
            print("💾 Original data stored: ${originalReportData.value?.rechargeReport?.length ?? 0} records");

            // Apply client-side filters
            _applyClientSideFilters();
            print("✅ After filtering: ${reportData.value?.rechargeReport?.length ?? 0} records");

            isLoading.value = false;

            // Show toast only if filters were applied and no data found
            if (rechargeList.isEmpty && _hasActiveFilters()) {
              Fluttertoast.showToast(
                msg: "No transactions found with the selected filters",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.orange,
                textColor: Colors.white,
                fontSize: 16.0,
              );
            }
          },
          error: (msg) {
            print("❌ Report API Error: $msg");
            isLoading.value = false;

            Fluttertoast.showToast(
              msg: msg,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          },
          loading: () {
            print("⏳ Loading Report...");
            isLoading.value = true;
          },
          none: () {
            print("🔵 None state");
            isLoading.value = false;
          },
        );
      },
    );
  }

  /// Check if any filters are active (except defaults)
  bool _hasActiveFilters() {
    return (currentFilters.value["mobile"]?.isNotEmpty ?? false) ||
        (currentFilters.value["account"]?.isNotEmpty ?? false) ||
        (currentFilters.value["transaction"]?.isNotEmpty ?? false) ||
        (currentFilters.value["status"] != "0") ||
        (currentFilters.value["top"] != "50") ||
        (currentFilters.value["fromDate"] != "01-Jan-2024") ||
        (currentFilters.value["toDate"] != "31-Dec-2025");
  }

  ///  CLIENT-SIDE FILTERING (for mobile, account, transaction)
  void _applyClientSideFilters() {
    if (originalReportData.value == null) {
      print("⚠️ No original data to filter");
      return;
    }

    print("🔍 Starting client-side filtering...");
    print("📊 Original records: ${originalReportData.value!.rechargeReport?.length ?? 0}");

    List<RechargeReport> filteredList = List.from(originalReportData.value!.rechargeReport ?? []);

    /// Filter by Mobile Number
    if (currentFilters.value["mobile"]?.isNotEmpty ?? false) {
      final mobile = currentFilters.value["mobile"]!;
      filteredList = filteredList.where((item) {
        return item.customerNo?.contains(mobile) ?? false;
      }).toList();
      print(" Filtered by mobile '$mobile': ${filteredList.length} records");
    }

    /// Filter by Account Number
    if (currentFilters.value["account"]?.isNotEmpty ?? false) {
      final account = currentFilters.value["account"]!;
      filteredList = filteredList.where((item) {
        return item.account?.contains(account) ?? false;
      }).toList();
      print(" Filtered by account '$account': ${filteredList.length} records");
    }

    // Filter by Transaction ID
    if (currentFilters.value["transaction"]?.isNotEmpty ?? false) {
      final txnId = currentFilters.value["transaction"]!;
      filteredList = filteredList.where((item) {
        return item.transactionID?.contains(txnId) ?? false;
      }).toList();
      print(" Filtered by transaction '$txnId': ${filteredList.length} records");
    }

    /// Create a new response with filtered data
    final filteredResponse = TransactionResponse();
    filteredResponse.statuscode = originalReportData.value!.statuscode;
    filteredResponse.msg = originalReportData.value!.msg;
    filteredResponse.rechargeReport = filteredList;

    /// Copy other important fields
    filteredResponse.isVersionValid = originalReportData.value!.isVersionValid;
    filteredResponse.isAppValid = originalReportData.value!.isAppValid;

    reportData.value = filteredResponse;

    print("Final filtered records: ${filteredList.length}");
  }

  @override
  void onInit() {
    super.onInit();
    print(" ReportController Initialized");
    getReport();
  }

  @override
  void onReady() {
    super.onReady();
    print(" ReportController Ready");
  }

  @override
  void onClose() {
    print(" ReportController Closed");
    searchTextController.value.dispose();
    super.onClose();
  }
}