import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../../api/ui_state.dart';
import '../data/balance_repo.dart' show BalanceRepo;
import '../data/balance_response.dart';

class BalanceController extends GetxController {
  /// Repository instance
  final BalanceRepo repo = BalanceRepo();
  RxDouble balance = 0.0.obs;

  /// Reactive variables
  RxBool isLoading = false.obs;
  Rx<BalanceResponse?> balanceData = Rx<BalanceResponse?>(null);
  final balanceState = Rx<UiState<BalanceResponse>>(UiState.none());

  /// Fetch balance from API
  void getBalance() {
    isLoading.value = true;

    Map<String, dynamic> body = {

    };

    repo.getBalanceData(
      body: body,
      callback: (state) {
        balanceState.value = state;

        state.when(
          success: (data) {
            // Success
            print("✅ Balance Success");
            print("📊 Status Code: ${data.statuscode}");
            print("📋 Message: ${data.msg}");
            print("💰 Balance: ${data.data?.balance}");

            balanceData.value = data;
            balance.value = data.data?.balance?.toDouble() ?? 0.0;
            isLoading.value = false;
          },
          error: (msg) {

            print("❌ Balance API Error: $msg");
            isLoading.value = false;

            Fluttertoast.showToast(
              msg: "Error: $msg",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: const Color(0xFF333333),
              textColor: const Color(0xFFFFFFFF),
              fontSize: 16.0,
            );
          },
          loading: () {
            // Loading state
            print("⏳ Loading Balance...");
            isLoading.value = true;
          },
          none: () {
            // None state
            print("🔵 No data available");
            isLoading.value = false;
          },
        );
      },
    );
  }
  @override
  void onInit() {
    getBalance();
    super.onInit();
  }
}
