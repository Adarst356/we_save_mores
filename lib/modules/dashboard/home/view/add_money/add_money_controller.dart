import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../profile/view/balance_controller.dart';
import '../../../webviewPage/payment_waveview.dart';
import '../../data/paymentmode_repo.dart';
import '../../data/paymentmode_response.dart';
import '../../data/pg_details_repo.dart';
import '../../data/pg_details_response.dart';

class AddMoneyController extends GetxController {
  final TextEditingController amountController = TextEditingController();
  final RxString selectedPaymentMethod = 'UPI Collect'.obs;
  final RxBool isProcessing = false.obs;

  /// Repositories
  final PaymentModeRepo paymentModeRepo = PaymentModeRepo();
  final PgDetailsRepo pgDetailsRepo = PgDetailsRepo();

  /// Get BalanceController instance
  final BalanceController balanceController = Get.find<BalanceController>();

  /// Payment mode data
  final RxList<Operators> paymentModes = <Operators>[].obs;
  final RxBool isLoadingPaymentModes = false.obs;
  final Rx<PaymentModeResponse?> paymentModeData = Rx<PaymentModeResponse?>(null);

  // Selected operator
  Rx<Operators?> selectedOperator = Rx<Operators?>(null);

  /// Track last transaction time to prevent duplicate calls
  DateTime? _lastTransactionTime;
  static const _minimumTimeBetweenCalls = Duration(seconds: 1);

  @override
  void onInit() {
    super.onInit();
    getPaymentModes();
  }

  /// Fetch payment modes from API
  void getPaymentModes() {
    isLoadingPaymentModes.value = true;

    Map<String, dynamic> body = {};

    paymentModeRepo.getPaymentMode(
      body: body,
      callback: (state) {
        state.when(
          success: (data) {
            paymentModeData.value = data;
            if (data.data?.operators != null && data.data!.operators!.isNotEmpty) {
              paymentModes.value = data.data!.operators!;
              selectedOperator.value = paymentModes.first;
              selectedPaymentMethod.value = paymentModes.first.name ?? 'UPI Collect';
            }

            isLoadingPaymentModes.value = false;
          },
          error: (msg) {
            isLoadingPaymentModes.value = false;
            _showToast(msg, isError: true);
          },
          loading: () {
            isLoadingPaymentModes.value = true;
          },
          none: () {
            isLoadingPaymentModes.value = false;
          },
        );
      },
    );
  }

  /// Select payment method
  void selectPaymentMethod(Operators operator) {
    selectedOperator.value = operator;
    selectedPaymentMethod.value = operator.name ?? '';
  }

  /// Add money to wallet
  Future<void> addMoney() async {
    // CRITICAL: Prevent duplicate submissions
    if (isProcessing.value) {
      print("⚠️ Already processing, please wait...");
      _showToast('Please wait, processing...', isError: true);
      return;
    }

    // Check time between calls to prevent "Do not Refresh" error
    if (_lastTransactionTime != null) {
      final timeSinceLastCall = DateTime.now().difference(_lastTransactionTime!);
      if (timeSinceLastCall < _minimumTimeBetweenCalls) {
        final waitTime = _minimumTimeBetweenCalls.inSeconds - timeSinceLastCall.inSeconds;
        print("⚠️ Too soon since last call (${timeSinceLastCall.inSeconds}s)");
        _showToast('Please wait $waitTime seconds before trying again', isError: true);
        return;
      }
    }

    if (amountController.text.isEmpty) {
      _showToast('Please enter amount', isError: true);
      return;
    }

    double amount = double.tryParse(amountController.text) ?? 0;

    if (amount <= 0) {
      _showToast('Please enter a valid amount', isError: true);
      return;
    }

    if (selectedOperator.value == null) {
      _showToast('Please select a payment method', isError: true);
      return;
    }

    final operator = selectedOperator.value!;

    // Validate min/max amount
    if (operator.min != null && operator.min! > 0 && amount < operator.min!) {
      _showToast('Minimum amount is ₹${operator.min}', isError: true);
      return;
    }

    if (operator.max != null && operator.max! > 0 && amount > operator.max!) {
      _showToast('Maximum amount is ₹${operator.max}', isError: true);
      return;
    }

    // Call payment gateway API
    await initiatePayment(amount, operator);
  }

  /// Initiate payment through gateway
  Future<void> initiatePayment(double amount, Operators operator) async {
    // Set processing flag IMMEDIATELY to prevent duplicate calls
    isProcessing.value = true;
    _lastTransactionTime = DateTime.now();

    print("🔒 Processing locked at $_lastTransactionTime");

    Map<String, dynamic> body = {
      "a": amount,
      "id": operator.oid,
      "vpa": "",
      "w": 1, // Wallet type (1 = Prepaid)
    };

    print("🚀 Initiating Payment: $body");

    pgDetailsRepo.getPGDetails(
      body: body,
      callback: (state) {
        state.when(
          success: (data) {
            print("✅ PG Details Success");
            print("📋 Response statuscode: ${data.statuscode}");
            print("📋 TID: ${data.pGModelForWeb?.tid}");
            print("🔗 URL: ${data.pGModelForWeb?.url}");

            isProcessing.value = false;

            if (data.statuscode == 1 && data.pGModelForWeb != null) {
              // Navigate to payment gateway
              _openPaymentGateway(data.pGModelForWeb!, data.pGModelForWeb!.tid ?? 0);
            } else {
              _showToast(data.msg ?? 'Payment initiation failed', isError: true);
            }
          },
          error: (msg) {
            print("❌ PG Details Error: $msg");
            isProcessing.value = false;

            // Handle "Do not Refresh" error specifically
            if (msg.contains("Do not Refresh") || msg.contains("Failed to fetch")) {
              _showToast('Transaction in progress. Wait 3 seconds.', isError: true);
            } else {
              _showToast(msg, isError: true);
            }
          },
          loading: () {
            print("⏳ Loading state...");
            isProcessing.value = true;
          },
          none: () {
            print("⚪ None state");
            isProcessing.value = false;
          },
        );
      },
    );
  }

  /// Open payment gateway
  void _openPaymentGateway(PGModelForWeb pgModel, int tid) {
    print("💳 Opening Payment Gateway");
    print("URL: ${pgModel.url}");
    print("TID: $tid");

    if (pgModel.keyVals == null ||
        pgModel.keyVals!.encRequest == null ||
        pgModel.keyVals!.accessCode == null) {
      _showToast('Payment configuration error', isError: true);
      return;
    }

    print("encRequest: ${pgModel.keyVals!.encRequest}");
    print("access_code: ${pgModel.keyVals!.accessCode}");

    /// Navigate to WebView with proper parameters
    Get.to(
          () => PaymentWebView(
        url: pgModel.url!,
        encRequest: pgModel.keyVals!.encRequest!,
        accessCode: pgModel.keyVals!.accessCode!,
        tid: tid,
      ),
    )?.then((result) {
      // When returning from payment gateway
      print("🔄 Returned from payment gateway with result: $result");

      // Clear the form
      amountController.clear();

      // Refresh balance
      balanceController.getBalance();

      // Show appropriate message based on result
      if (result == true) {
        _showToast('Payment completed successfully!');
      } else if (result == false) {
        _showToast('Payment was cancelled', isError: true);
      }
    });
  }

  /// Show toast message
  void _showToast(String message, {bool isError = false}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: isError ? Colors.red : Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  void onClose() {
    amountController.dispose();
    super.onClose();
  }
}