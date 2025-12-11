import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../../api/ui_state.dart';
import '../data/balance_repo.dart';
import '../data/balance_response.dart';

class BalanceController extends GetxController {
  static BalanceController get to => Get.find();

  final BalanceRepo repo = BalanceRepo();

  RxDouble balance = 0.0.obs;
  RxBool isLoading = false.obs;

  final balanceState = Rx<UiState<BalanceResponse>>(UiState.none());

  void getBalance() {
    isLoading.value = true;

    Map<String, dynamic> body = {};

    repo.getBalanceData(
      body: body,
      callback: (state) {
        balanceState.value = state;

        state.when(
          success: (data) {
            balance.value = data.data?.balance?.toDouble() ?? 0.0;
            isLoading.value = false;
          },
          error: (msg) {
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
            print("⏳ Loading Balance...");
            isLoading.value = true;
          },
          none: () {
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
