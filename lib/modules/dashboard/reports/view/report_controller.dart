import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_save_more/modules/dashboard/reports/data/report_repo.dart';
import 'package:we_save_more/modules/dashboard/reports/data/report_response.dart';
import '../../../../api/ui_state.dart';

class ReportController extends GetxController {
  final ReportRepo repo = ReportRepo();

  /// LOADING STATE
  RxBool isLoading = true.obs;

  /// FULL API STATE
  final reportState = Rx<UiState<TransactionResponse>>(UiState.none());

  /// MAIN DATA
  Rx<TransactionResponse?> reportData = Rx<TransactionResponse?>(null);

  /// SEARCH FIELD
  final TextEditingController searchController = TextEditingController();
  RxString searchText = "".obs;

  /// Short helper getters
  List<RechargeReport> get rechargeList =>
      reportData.value?.rechargeReport ?? [];

  bool get hasData => rechargeList.isNotEmpty;


  /// -------------------- FETCH REPORT API --------------------
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
            reportData.value = data;
          },
          error: (msg) => print("Report API Error: $msg"),
          loading: () {},
          none: () {},
        );

        isLoading.value = false;
      },
    );
  }




  // -------------------- SEARCH FUNCTION --------------------
  void onSearchChanged(String query) {
    getReport(); /// call api on search
  }

  void clearSearch() {
    getReport();
  }


  // -------------------- INIT --------------------
  @override
  void onInit() {

    getReport();  // initial load
    super.onInit();
  }

}
