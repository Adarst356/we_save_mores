import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebView extends StatefulWidget {
  final String url;
  final String encRequest;
  final String accessCode;
  final int tid;

  const PaymentWebView({
    super.key,
    required this.url,
    required this.encRequest,
    required this.accessCode,
    required this.tid,
  });

  @override
  State<PaymentWebView> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  late WebViewController _controller;
  final RxBool isLoading = true.obs;
  bool _hasShownResult = false; // Prevent multiple dialogs

  @override
  void initState() {
    super.initState();
    _initializeWebView();
  }

  void _initializeWebView() {
    // Build the complete URL with parameters
    // CCAvenue requires: url?encRequest=xxx&access_code=yyy
    final String completeUrl =
        '${widget.url}?encRequest=${widget.encRequest}&access_code=${widget.accessCode}';

    print("🌐 Loading Payment URL: $completeUrl");
    print("🆔 Transaction ID: ${widget.tid}");

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            print("📄 Page Started: $url");
            isLoading.value = true;
          },
          onPageFinished: (String url) {
            print("✅ Page Finished: $url");
            isLoading.value = false;

            // Check for success/failure in URL
            _checkPaymentStatus(url);
          },
          onWebResourceError: (WebResourceError error) {
            print("❌ WebView Error: ${error.description}");
            isLoading.value = false;
          },
          onNavigationRequest: (NavigationRequest request) {
            print("🔄 Navigation Request: ${request.url}");

            // Check if it's a callback URL
            _checkPaymentStatus(request.url);

            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(completeUrl));
  }

  void _checkPaymentStatus(String url) {
    // Prevent multiple result dialogs
    if (_hasShownResult) return;

    print("🔍 Checking Payment Status from URL: $url");

    // Common success patterns in payment gateway callbacks
    final successPatterns = [
      'success=true',
      'status=success',
      'payment_status=success',
      'order_status=Success',
      'response=Success',
    ];

    // Common failure patterns
    final failurePatterns = [
      'success=false',
      'status=fail',
      'status=failed',
      'cancel',
      'cancelled',
      'failure',
      'order_status=Failure',
      'response=Failure',
      'aborted',
    ];

    // Check for success
    if (successPatterns.any((pattern) => url.toLowerCase().contains(pattern.toLowerCase()))) {
      print("✅ Payment appears successful");
      _hasShownResult = true;
      _showPaymentResultDialog(
        isSuccess: true,
        message: 'Payment completed successfully!\nTransaction ID: ${widget.tid}',
      );
    }
    // Check for failure
    else if (failurePatterns.any((pattern) => url.toLowerCase().contains(pattern.toLowerCase()))) {
      print("❌ Payment appears failed/cancelled");
      _hasShownResult = true;
      _showPaymentResultDialog(
        isSuccess: false,
        message: 'Payment was cancelled or failed.\nTransaction ID: ${widget.tid}',
      );
    }

    // You can also add your specific callback URL pattern here
    // Example: if (url.contains('wesavemore.in/payment-callback'))
  }

  void _showPaymentResultDialog({
    required bool isSuccess,
    required String message,
  }) {
    Get.dialog(
      WillPopScope(
        onWillPop: () async => false, // Prevent dismissing by tapping outside
        child: AlertDialog(
          title: Row(
            children: [
              Icon(
                isSuccess ? Icons.check_circle : Icons.error,
                color: isSuccess ? Colors.green : Colors.red,
                size: 32,
              ),
              const SizedBox(width: 12),
              Text(isSuccess ? 'Success' : 'Failed'),
            ],
          ),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Get.back(); // Close dialog
                Get.back(result: isSuccess); // Close WebView with result
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }

  Future<bool> _onWillPop() async {
    final shouldPop = await Get.dialog<bool>(
      AlertDialog(
        title: const Text('Cancel Payment?'),
        content: const Text('Are you sure you want to cancel this payment?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Get.back(result: true),
            child: const Text('Yes, Cancel'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
    return shouldPop ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Processing Payment"),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () async {
              final shouldClose = await _onWillPop();
              if (shouldClose) {
                Get.back(result: false); // Return false = cancelled
              }
            },
          ),
        ),
        body: Stack(
          children: [
            WebViewWidget(controller: _controller),

            // Loading indicator
            Obx(() => isLoading.value
                ? Container(
              color: Colors.white,
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text(
                      'Loading payment gateway...',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            )
                : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}