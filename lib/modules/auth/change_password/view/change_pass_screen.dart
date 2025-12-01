import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:we_save_more/utils/spacing.dart';
import 'package:we_save_more/widget/app_text.dart';
import 'package:we_save_more/widget/custom_password_field.dart';
import 'change_pass_controller.dart';

class ChangePassScreen extends StatelessWidget {
  final controller = Get.put(ChangePassController());

  ChangePassScreen({super.key});

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
                IconButton(
                  onPressed: () => Get.back(),
                  icon: SvgPicture.asset(
                    "assets/svg/close_button.svg",
                    height: 35,
                  ),
                ),

                Spacing.h20,

                Center(
                  child: Image.asset(
                    'assets/images/app_full_logo.png',
                    height: 100,
                  ),
                ),

                Spacing.h20,

                const Center(
                  child: AppText(
                    'Change Password',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4A148C),
                  ),
                ),

                Spacing.h30,

                /// Old Password
                Obx(() => CustomPasswordField(
                  controller: controller.oldPassController,
                  hintText: 'Enter Old Password',
                  labelText: 'Enter Old Password :',
                  obscureText: controller.oldPassVisible,
                  showLabel: true,
                  errorText: controller.oldPassError.value,
                  onChanged: (value) {
                    controller.validateOldPass(value);
                  },
                )),

                Spacing.h20,

                /// New Password
                Obx(() => CustomPasswordField(
                  controller: controller.newPassController,
                  hintText: 'Enter New Password',
                  labelText: 'Enter New Password :',
                  obscureText: controller.newPassVisible,
                  showLabel: true,
                  errorText: controller.newPassError.value,
                  onChanged: (value) {
                    controller.validateNewPass(value);
                    // Re-validate confirm password if already entered
                    if (controller.confirmPassController.text.isNotEmpty) {
                      controller.validateConfirmPass(
                        controller.confirmPassController.text,
                      );
                    }
                  },
                )),

                Spacing.h20,

                /// Confirm Password
                Obx(() => CustomPasswordField(
                  controller: controller.confirmPassController,
                  hintText: 'Confirm Password',
                  labelText: 'Enter Confirm Password :',
                  obscureText: controller.confirmPassVisible,
                  showLabel: true,
                  errorText: controller.confirmPassError.value,
                  onChanged: (value) {
                    controller.validateConfirmPass(value);
                  },
                )),

                Spacing.h30,

                /// Submit Button
                Obx(() => SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : () => controller.onSubmit(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4A148C),
                      disabledBackgroundColor: Colors.grey[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: controller.isLoading.value
                        ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                        : const AppText(
                      'CHANGE PASSWORD',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                )),

                Spacing.h30,

                _buildInstructions(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInstructions() {
    return Container(
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
          _bullet("Is longer than 7 characters"),
          _bullet("Must contain at least 1 number"),
          _bullet("Password is case sensitive"),
          _bullet("Should be different for multiple IDs"),
          _bullet("Should not contain spaces"),
        ],
      ),
    );
  }

  Widget _bullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(color: Colors.red)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}