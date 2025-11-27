import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:we_save_more/modules/dashboard/reports/data/report_repo.dart';
import 'package:we_save_more/modules/dashboard/reports/data/report_response.dart';
import '../../../../api/ui_state.dart';

class ReportController extends GetxController {
  final ReportRepo repo = ReportRepo();

  RxBool isLoading = false.obs; // Changed from true to false
  Rx<TextEditingController> searchTextController = TextEditingController().obs;
  /// 🔍 SEARCH QUERY
  RxString searchQuery = ''.obs;


  final reportState = Rx<UiState<TransactionResponse>>(UiState.none());

  Rx<TransactionResponse?> reportData = Rx<TransactionResponse?>(null);

  /// DIRECT LIST FROM API
  List<RechargeReport> get rechargeList {
    return reportData.value?.rechargeReport ?? [];
  }

  bool get hasData => rechargeList.isNotEmpty;

  /// 🔥 FILTERED LIST BASED ON SEARCH
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

  /// API CALL
  void getReport() {
    isLoading.value = true;

    Map<String, dynamic> body = {
      "apiid": 0,
      "fromDate": "01-Jan-2024",
      "toDate": "31-Dec-2025",
      "isExport": false,
      "isRecent": true,
      "oid": 0,
      "opTypeID": "0",
      "status": 0,
      "topRows": "50"
    };

    repo.getReport(
      body: body,
      callback: (state) {
        reportState.value = state;

        state.when(
          success: (data) {
            print("✅ Report Success");
            print("📊 Status Code: ${data.statuscode}");
            print("📋 Message: ${data.msg}");
            print("📦 Total Records: ${data.rechargeReport?.length ?? 0}");

            if (data.rechargeReport != null && data.rechargeReport!.isNotEmpty) {
              print("🔍 First Record:");
              print("   Operator: ${data.rechargeReport![0].operator}");
              print("   Amount: ${data.rechargeReport![0].amount}");
              print("   Type: ${data.rechargeReport![0].type}");
              print("   Date: ${data.rechargeReport![0].entryDate}");
            }

            reportData.value = data;
            isLoading.value = false; // Stop loading after success
          },
          error: (msg) {
            print("❌ Report API Error: $msg");
            isLoading.value = false; // Stop loading after error

            /// Toast instead of Snackbar
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

  @override
  void onInit() {
    super.onInit();
    print("🚀 ReportController Initialized");
    getReport();
  }

  @override
  void onClose() {
    print("🛑 ReportController Closed");
    super.onClose();
  }
}