import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/custom_appbar.dart';
import 'GetRn_offer_controller.dart';

class ROfferScreen extends StatelessWidget {
  ROfferScreen({super.key});

  final ROfferController controller = Get.put(ROfferController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: CustomAppbar(
        title: "R OFFER",
        showLeft: true,
        leftIcon: GestureDetector(
          onTap: Get.back,
          child: Icon(Icons.arrow_back, color: theme.colorScheme.onPrimary),
        ),
      ),
      body: Obx(
            () => ListView.separated(
          padding: const EdgeInsets.all(14),
          itemCount: controller.offerList.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final Map<String, dynamic> offer =
            controller.offerList[index];
            return _offerItem(offer);
          },
        ),
      ),
    );
  }

  Widget _offerItem(Map<String, dynamic> offer) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// PRICE CHIP
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF6A1B9A),
                  Color(0xFF8E24AA),
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "₹ ${offer['amount']?.toString() ?? ''}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(width: 14),

          /// DESCRIPTION
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6A1B9A),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  offer['description']?.toString() ?? '',
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.4,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
