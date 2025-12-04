import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_save_more/utils/spacing.dart';
import 'package:we_save_more/widget/app_text.dart';

class OtpDialog extends StatelessWidget {
  final TextEditingController otpController;
  final TextEditingController passwordController;
  final VoidCallback onResend;
  final VoidCallback onSubmit;
  final VoidCallback onCancel;

  const OtpDialog({
    super.key,
    required this.otpController,
    required this.passwordController,
    required this.onResend,
    required this.onSubmit,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

      backgroundColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,

      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 380),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Top Icon
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isDark
                        ? Colors.deepPurple.shade800
                        : const Color(0xFFEDE7F6),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.lock, color: Colors.amber, size: 36),
                ),

            Spacing.h10,

                /// Title
                AppText(
                  "Enter OTP to verify",
                  fontSize: 18,
                  color: isDark ? Colors.amberAccent : Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
                Spacing.h8,
                /// Message
                AppText(
                  "Otp has been sent on your Mobile Number",
                  align: TextAlign.center,
                  fontSize: 15,
                  color: isDark ? Colors.white70 : Colors.black87,
                ),

                ///  OTP Field
                TextField(
                  controller: otpController,
                  decoration: InputDecoration(
                    labelText: "Enter OTP",
                    border: const UnderlineInputBorder(),
                    labelStyle: TextStyle(
                      color: isDark ? Colors.white70 : Colors.black87,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: isDark ? Colors.white : Colors.black),
                ),
                Spacing.h10,

                ///  New Password Field
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "New Password",
                    border: const UnderlineInputBorder(),
                    suffixIcon: const Icon(
                      Icons.visibility,
                      color: Colors.amber,
                    ),
                    labelStyle: TextStyle(
                      color: isDark ? Colors.white70 : Colors.black87,
                    ),
                  ),
                  style: TextStyle(color: isDark ? Colors.white : Colors.black),
                ),

                Spacing.h24,

                /// Buttons (One Line)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: ElevatedButton(
                        onPressed: onResend,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple.shade200,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const AppText("RESEND"),
                      ),
                    ),
                    Spacing.h10,
                    Flexible(
                      fit: FlexFit.tight,
                      child: ElevatedButton(
                        onPressed: onSubmit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: AppText("SUBMIT"),
                      ),
                    ),
                    Spacing.w10,
                    Flexible(
                      fit: FlexFit.tight,
                      child: ElevatedButton(
                        onPressed: onCancel,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber.shade200,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: AppText("CANCEL"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
