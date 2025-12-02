import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:we_save_more/modules/dashboard/home_dashboard/data/paymentmode_response.dart';
import 'package:we_save_more/modules/dashboard/home_dashboard/data/pg_details_response.dart';
import 'package:we_save_more/modules/dashboard/home_dashboard/data/paymentmode_repo.dart';
import 'package:we_save_more/modules/dashboard/home_dashboard/data/pg_details_repo.dart';
import '../../profile/view/balance_controller.dart';

class AddMoneyController extends GetxController {
  final TextEditingController amountController = TextEditingController();
  final RxString selectedPaymentMethod = 'UPI Collect'.obs;
  final RxBool isProcessing = false.obs;

  // Repositories
  final PaymentModeRepo paymentModeRepo = PaymentModeRepo();
  final PgDetailsRepo pgDetailsRepo = PgDetailsRepo();

  // Get BalanceController instance
  final BalanceController balanceController = Get.find<BalanceController>();

  // Payment mode data
  final RxList<Operators> paymentModes = <Operators>[].obs;
  final RxBool isLoadingPaymentModes = false.obs;
  final Rx<PaymentModeResponse?> paymentModeData = Rx<PaymentModeResponse?>(null);

  // Selected operator
  Rx<Operators?> selectedOperator = Rx<Operators?>(null);

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
            print("✅ Payment Modes Success");
            paymentModeData.value = data;

            if (data.data?.operators != null && data.data!.operators!.isNotEmpty) {
              paymentModes.value = data.data!.operators!;
              // Set first operator as selected
              selectedOperator.value = paymentModes.first;
              selectedPaymentMethod.value = paymentModes.first.name ?? 'UPI Collect';
            }

            isLoadingPaymentModes.value = false;
          },
          error: (msg) {
            print("❌ Payment Modes Error: $msg");
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
  void addMoney() {
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
    initiatePayment(amount, operator);
  }

  /// Initiate payment through gateway
  void initiatePayment(double amount, Operators operator) {
    isProcessing.value = true;

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
            print("📋 TID: ${data.pGModelForWeb?.tid}");
            print("🔗 URL: ${data.pGModelForWeb?.url}");

            isProcessing.value = false;

            if (data.statuscode == 1 && data.pGModelForWeb != null) {
              // Navigate to payment gateway
              _openPaymentGateway(data.pGModelForWeb!);
            } else {
              _showToast(data.msg ?? 'Payment initiation failed', isError: true);
            }
          },
          error: (msg) {
            print("❌ PG Details Error: $msg");
            isProcessing.value = false;
            _showToast(msg, isError: true);
          },
          loading: () {
            isProcessing.value = true;
          },
          none: () {
            isProcessing.value = false;
          },
        );
      },
    );
  }

  /// Open payment gateway
  void _openPaymentGateway(PGModelForWeb pgModel) {
    // TODO: Implement WebView or external browser navigation
    // For now, just showing success message

    print("💳 Opening Payment Gateway");
    print("URL: ${pgModel.url}");
    print("TID: ${pgModel.tid}");

    if (pgModel.keyVals != null) {
      print("encRequest: ${pgModel.keyVals!.encRequest}");
      print("access_code: ${pgModel.keyVals!.accessCode}");
    }

    // You can navigate to WebView screen here
    // Get.to(() => PaymentWebView(
    //   url: pgModel.url!,
    //   encRequest: pgModel.keyVals?.encRequest,
    //   accessCode: pgModel.keyVals?.accessCode,
    //   tid: pgModel.tid,
    // ));

    _showToast('Payment gateway opened - TID: ${pgModel.tid}');
    amountController.clear();

    // Refresh balance after some time (in real app, do this after payment success callback)
    Future.delayed(const Duration(seconds: 3), () {
      balanceController.getBalance();
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