import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../api/ui_state.dart';
import '../../data/user_day_book_repo.dart';   // <-- your repo
import '../../data/user_day_book_response.dart';

class WalletHistoryController extends GetxController {
  final repo = UserDayBookRepo();

  /// UI State (loading / error / success)
  final walletState = Rx<UiState<UserDayBookResponse>>(UiState.none());

  RxBool isLoading = true.obs; // Start with true to show loader initially
  Rx<TextEditingController> searchTextController = TextEditingController().obs;
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

}
