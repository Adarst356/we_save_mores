import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:we_save_more/utils/spacing.dart';
import 'package:we_save_more/widget/app_text.dart';
import 'package:we_save_more/widget/custom_password_field.dart';

import 'chnage_pin_controller.dart';

class ChangePinScreen extends StatelessWidget {
  final controller = Get.put(ChangePinController());

  ChangePinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Close button
                IconButton(
                  onPressed: () => Get.back(),
                  icon: SvgPicture.asset(
                    "assets/svg/close_button.svg",
                    height: 35,
                  ),
                ),
                Spacing.h20,

                /// Logo
                Center(
                  child: Image.asset(
                    'assets/images/app_full_logo.png',
                    height: 100,
                  ),
                ),
                Spacing.h20,

                /// Title
                const Center(
                  child: AppText(
                    'Change Pin Password',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4A148C),
                  ),
                ),
                Spacing.h30,

                /// OLD PIN
                Obx(() => CustomPasswordField(
                  controller: controller.oldPassController,
                  hintText: 'Enter Old Pin',
                  labelText: 'Enter Old Pin :',
                  obscureText: controller.oldPassVisible,
                  onChanged: controller.validateOldPass,
                  errorText: controller.oldPassError.value,
                  showLabel: true,
                )),
                Spacing.h20,

                /// NEW PIN
                Obx(() => CustomPasswordField(
                  controller: controller.newPassController,
                  hintText: 'Enter New Pin',
                  labelText: 'Enter New Pin :',
                  obscureText: controller.newPassVisible,
                  onChanged: controller.validateNewPass,
                  errorText: controller.newPassError.value,
                  showLabel: true,
                )),
                Spacing.h20,

                /// CONFIRM PIN
                Obx(() => CustomPasswordField(
                  controller: controller.confirmPassController,
                  hintText: 'Enter Confirm Pin',
                  labelText: 'Enter Confirm Pin :',
                  obscureText: controller.confirmPassVisible,
                  onChanged: controller.validateConfirmPass,
                  errorText: controller.confirmPassError.value,
                  showLabel: true,
                )),

                Spacing.h30,

                /// SUBMIT BUTTON
                Obx(() => SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed:
                    controller.isLoading.value ? null : controller.onSubmit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4A148C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const AppText(
                      'CHANGE PASSWORD',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )),
                Spacing.h30,

                /// PASSWORD RULES
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.red[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                        'In order to protect your account, make sure your password:',
                        fontSize: 13,
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                      Spacing.h8,
                      _buildRule('Is exactly 4 digits'),
                      _buildRule('Should not match old pin'),
                      _buildRule('Pin must contain only 0–9'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRule(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppText('• ', color: Colors.red, fontSize: 13),
        Expanded(
          child: AppText(text, color: Colors.red, fontSize: 12),
        ),
      ],
    );
  }
}
