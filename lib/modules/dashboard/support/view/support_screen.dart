import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:we_save_more/utils/custom_appbar.dart';
import 'package:we_save_more/utils/spacing.dart';
import 'package:we_save_more/widget/app_text.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Informations",
        leftIcon: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Spacing.h24,

            /// ---------------------
            /// CONTACT US BUTTON
            /// ---------------------
            Center(
              child: Container(
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: AppText(
                    "Contact Us",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            Spacing.h24,

            /// ==========================
            /// CUSTOMER CARE CARD
            /// ==========================
            buildSupportCard(
              title: "Customer Care",
              icon: "assets/svg/customer-care.svg",
              call1: "9665858213",
              call2: "9665858213",
              whatsapp: "9665858213",
              email: "support@wesavemore.in",
            ),

            Spacing.h20,

            /// ==========================
            /// PAYMENT INQUIRY CARD
            /// ==========================
            buildSupportCard(
              title: "Payment Inquiry",
              icon: "assets/svg/payment.svg",
              call1: "9876543210",
              call2: "9988776655",
              whatsapp: "9876543210",
              email: "payment@wesavemore.in",
            ),
          ],
        ),
      ),
    );
  }

  /// ------------------------------------------------------------------
  /// SUPPORT CARD UI (same file – not separate)
  /// ------------------------------------------------------------------
  Widget buildSupportCard({
    required String title,
    required String icon,
    required String call1,
    required String call2,
    required String whatsapp,
    required String email,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.yellow),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 3),
          )
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// TITLE + LEFT ICON
          Row(
            children: [
              SvgPicture.asset(icon, height: 45, width: 45),
              Spacing.w10,
              AppText(
                title,
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),

          Spacing.h12,

          /// CALL ROW 1
          buildInfoRow(
            leftIcon: "assets/svg/call.svg",
            label: "Call Us",
            value: call1,
            rightIcon: "assets/svg/mobile.svg",
          ),

          Spacing.h10,

          /// CALL ROW 2
          buildInfoRow(
            leftIcon: "",
            label: "",
            value: call2,
            rightIcon: "assets/svg/telephone.svg",
            showLabel: false,
          ),

          Spacing.h10,

          /// WHATSAPP ROW
          buildInfoRow(
            leftIcon: "assets/svg/whatsapp-svgrepo-com.svg",
            label: "Whatsapp",
            value: whatsapp,
            rightIcon: "assets/svg/whatsapp-svgrepo-com.svg  ",
          ),

          Spacing.h10,

          /// EMAIL ROW
          buildInfoRow(
            leftIcon: "assets/svg/email.svg",
            label: "Email",
            value: email,
            rightIcon: "assets/svg/mailbox.svg",
          ),
        ],
      ),
    );
  }

  /// ------------------------------------------------------------------
  /// SINGLE ROW (Icons + Text)
  /// ------------------------------------------------------------------
  Widget buildInfoRow({
    required String leftIcon,
    required String label,
    required String value,
    required String rightIcon,
    bool showLabel = true,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(leftIcon, height: 20, width: 20),
        Spacing.w10,

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showLabel)
              AppText(label, fontWeight: FontWeight.w600),

            if (showLabel) Spacing.h4,

            AppText(
              value,
              color: Colors.blue,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),

        const Spacer(),

        SvgPicture.asset(rightIcon, height: 22, width: 22),
      ],
    );
  }
}
