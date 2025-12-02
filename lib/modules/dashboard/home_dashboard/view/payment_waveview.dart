import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebView extends StatelessWidget {
  final String url;
  final String? encRequest;
  final String? accessCode;

  const PaymentWebView({
    super.key,
    required this.url,
    this.encRequest,
    this.accessCode,
  });

  @override
  Widget build(BuildContext context) {
    String finalUrl = "$url&encRequest=$encRequest&access_code=$accessCode";

    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(finalUrl));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Processing Payment"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
