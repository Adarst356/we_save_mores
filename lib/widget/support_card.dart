import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/spacing.dart';
import 'app_text.dart';

class SupportInfoCard extends StatelessWidget {
  final String title;
  final String icon;
  final String callNumber1;
  final String callNumber2;
  final String whatsappNumber;
  final String email;

  const SupportInfoCard({
    super.key,
    required this.title,
    required this.icon,
    required this.callNumber1,
    required this.callNumber2,
    required this.whatsappNumber,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.yellow, width: 1.2),
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

          /// TITLE ROW
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

          /// CALL 1
          _infoRow(
            leftIcon: "assets/svg/postpaid.svg",
            label: "Call Us",
            value: callNumber1,
            rightIcon: "assets/svg/mobile.svg",
          ),

          Spacing.h10,

          /// CALL 2
          _infoRow(
            leftIcon: "assets/svg/postpaid.svg",
            label: "",
            value: callNumber2,
            rightIcon: "assets/svg/landline.svg",
            showLabel: false,
          ),

          Spacing.h10,

          /// WHATSAPP
          _infoRow(
            leftIcon: "assets/svg/whatsapp.svg",
            label: "Whatsapp",
            value: whatsappNumber,
            rightIcon: "assets/svg/whatsapp-round.svg",
          ),

          Spacing.h10,

          /// EMAIL
          _infoRow(
            leftIcon: "assets/svg/email.svg",
            label: "Email",
            value: email,
            rightIcon: "assets/svg/mailbox.svg",
          ),
        ],
      ),
    );
  }

  Widget _infoRow({
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
