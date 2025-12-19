import 'package:flutter/material.dart';

import '../utils/spacing.dart';
import 'app_text.dart';

Widget transactionReportCard({
  required String date,
  required String status,
  required String operator,
  required String number,
  required String amount,
  required String txnId,
  required String providerRefId,
  required String operatorImage,
  bool showActions = true,
  VoidCallback? onShare,
}) {
  Color statusColor = status == "SUCCESS"
      ? Colors.green
      : status == "FAILED"
      ? Colors.red
      : Colors.orange;

  IconData statusIcon = status == "SUCCESS"
      ? Icons.check_circle
      : status == "FAILED"
      ? Icons.error
      : Icons.access_time_filled;

  return Container(
    margin: const EdgeInsets.only(bottom: 14),
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// DATE + STATUS
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.calendar_month, color: Colors.grey),
                const SizedBox(width: 8),
                AppText(date, fontSize: 10),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(.12),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  Icon(statusIcon, color: statusColor, size: 18),
                  const SizedBox(width: 6),
                  AppText(
                    status,
                    color: statusColor,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),
          ],
        ),

        Spacing.h16,

        /// OPERATOR + NUMBER + AMOUNT
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey.shade200,
              child: ClipOval(
                child: Image.network(
                  operatorImage,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      Image.asset("assets/images/app_logo.png"),
                ),
              ),
            ),
            Spacing.w12,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(operator,
                      fontSize: 17, fontWeight: FontWeight.bold),
                  Spacing.h4,
                  AppText(number,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87),
                ],
              ),
            ),
            AppText(
              "₹ $amount",
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: Colors.blue,
            ),
          ],
        ),

        Spacing.h12,

        AppText("Transaction ID : $txnId",
            fontSize: 14, fontWeight: FontWeight.w500),
        AppText("Provider Ref Id : $providerRefId",
            fontSize: 14, fontWeight: FontWeight.w500),

        if (showActions) ...[
          Spacing.h16,
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: onShare,
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.yellow, width: 2),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.share, size: 18, color: Colors.purple),
                    SizedBox(width: 6),
                    Text("Share",
                        style: TextStyle(fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ],
    ),
  );
}
