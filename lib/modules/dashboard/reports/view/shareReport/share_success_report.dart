import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_save_more/modules/dashboard/reports/view/rechargeReport/report_controller.dart';

class RechargeSuccessScreen extends StatelessWidget {
  RechargeSuccessScreen({super.key});
  final ReportController controller = Get.put(ReportController());
  final args = Get.arguments as Map<String, dynamic>;

  // GlobalKey for capturing the screen
  final GlobalKey _screenKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ✅ Yeh part capture hoga (Shop Details tak)
            RepaintBoundary(
              key: _screenKey,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    const SizedBox(height: 30),

                    /// Close button
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: const Icon(Icons.close, color: Colors.red),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Column(
                      children: [
                        Icon(
                          args["status"] == "SUCCESS"
                              ? Icons.check_circle
                              : args["status"] == "FAILED"
                              ? Icons.error
                              : Icons.access_time_filled,
                          color: args["status"] == "SUCCESS"
                              ? Colors.green
                              : args["status"] == "FAILED"
                              ? Colors.red
                              : Colors.orange,
                          size: 70,
                        ),
                        SizedBox(width: 6),
                        Text(
                          args["status"] ?? "—",
                          style: TextStyle(
                            color: args["status"] == "SUCCESS"
                                ? Colors.green
                                : args["status"] == "FAILED"
                                ? Colors.red
                                : Colors.orange,
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 5),

                    Text(
                      "Ref: ${args["transactionId"] ?? "S251206105631837BFC02"}",
                      style: TextStyle(fontSize: 14),
                    ),

                    const SizedBox(height: 20),

                    /// Logo
                    Image.asset(
                      "assets/images/app_full_logo_white.png",
                      height: 120,
                    ),

                    const SizedBox(height: 10),

                    /// Transaction Details Title
                    const Text(
                      "Transaction Details",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 20),

                    /// Operator Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          args["operatorImage"] ?? "assets/icons/share.png",
                          height: 40,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          args["operator"] ?? "Reliance Jio",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// Transaction info table
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        children: [
                          buildRow("Mobile Number", args["mobile"] ?? ""),
                          buildRow("Amount", "₹ ${args["amount"] ?? ""}"),
                          buildRow("Transaction ID", args["transactionId"] ?? ""),
                          buildRow("Provider Ref ID", args["providerRefId"] ?? ""),
                          buildRow("Transaction Date Time", args["date"] ?? ""),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// Green message box
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.green),
                      ),
                      child: const Text(
                        "CONGRATULATIONS! You have won a scratch card.\nClick Here to Claim Your Prize.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.w600),
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// Shop Details
                    const Text(
                      "Shop Details",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),

                    const Text(
                      "| Contact No : 9798374412 | Email :\nvikashk6660@gmail.com |",
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),

            // ❌ Yeh part capture NAHI hoga (Share buttons)
            /// Share with friends
            InkWell(
              onTap: () {
                controller.shareOnWhatsApp(_screenKey);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                color: Colors.purple,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/share.png",
                      height: 20,
                      width: 20,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "Share with friends",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// Share with WhatsApp
            InkWell(
              onTap: () {
                controller.shareOnWhatsApp(_screenKey);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/whatsapp.png",
                      height: 20,
                      width: 20,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "Share with WhatsApp",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Reusable table row widget
  Widget buildRow(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          Container(
            width: 1,
            height: 20,
            color: Colors.grey,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}