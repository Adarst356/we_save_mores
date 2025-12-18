import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_save_more/theme/app_colors.dart';
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
      body: Obx(() {
        return controller.rOfferState.value.when(
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (msg) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                Text(
                  msg,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: controller.getROfferData,
                  child: const Text("Retry"),
                ),
              ],
            ),
          ),
          success: (_) {
            if (controller.offerList.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.inbox_outlined, size: 64, color: Colors.grey),
                    SizedBox(height: 16),
                    Text("No offers available"),
                  ],
                ),
              );
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: controller.offerList.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final offer = controller.offerList[index];
                      return _offerItem(offer);
                    },
                  ),
                ),
                _buildDisclaimer(),
              ],
            );
          },
          none: () => const SizedBox.shrink(),
        );
      }),
    );
  }

  Widget _offerItem(Map<String, dynamic> offer) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// PRICE BOX
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: appColors.primaryColor, width: 1),
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
            ),
            child: Text(
              "₹ ${offer['amount']?.toString() ?? ''}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),

          const SizedBox(width: 12),

          /// DESCRIPTION
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Description :",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  offer['description']?.toString() ?? '',
                  style: TextStyle(
                    fontSize: 12,
                    height: 1.3,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDisclaimer() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey.shade700,
            height: 1.3,
          ),
          children: const [
            TextSpan(
              text: 'Disclaimer: ',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'We support most types of recharges, but please check with your operator before you proceed.',
            ),
          ],
        ),
      ),
    );
  }
}