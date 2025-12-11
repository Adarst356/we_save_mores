import 'package:flutter/material.dart';

class RechargeSuccessScreen extends StatelessWidget {
  const RechargeSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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

            /// Success Icon
            const Icon(Icons.check_circle,
                color: Colors.green, size: 70),

            const SizedBox(height: 10),

            /// SUCCESS text
            const Text(
              "SUCCESS",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "Ref:: S251206105631837BFC02",
              style: TextStyle(fontSize: 14),
            ),

            const SizedBox(height: 20),

            /// Logo (placeholder)
            Image.network(
              "https://via.placeholder.com/120",
              height: 120,
            ),

            const SizedBox(height: 10),

            /// Transaction Details Title
            const Text(
              "Transaction Details",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            /// Operator Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Jio_Logo.svg/1200px-Jio_Logo.svg.png",
                  height: 40,
                ),
                const SizedBox(width: 10),
                const Text(
                  "Reliance Jio",
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
                  buildRow("Mobile Number", "7739340164"),
                  buildRow("Amount", "₹ 299.00"),
                  buildRow("Transaction Id", "S251206105631837BFC02"),
                  buildRow("Reference Id", "R.1302293436"),
                  buildRow("Transaction Date Time",
                      "04 Dec 2025 10:56 AM"),
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
                    color: Colors.green,
                    fontWeight: FontWeight.w600),
              ),
            ),

            const SizedBox(height: 30),

            /// Shop Details
            const Text(
              "Shop Details",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            const Text(
              "| Contact No : 9798374412 | Email :\nvikashk6660@gmail.com |",
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            /// Share with friends
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              color: Colors.purple,
              alignment: Alignment.center,
              child: const Text(
                "Share with friends",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),

            /// Share with WhatsApp
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              color: Colors.green,
              alignment: Alignment.center,
              child: const Text(
                "Share with Whatsapp",
                style: TextStyle(color: Colors.white, fontSize: 16),
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
