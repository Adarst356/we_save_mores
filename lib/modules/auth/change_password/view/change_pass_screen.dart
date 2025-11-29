import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:we_save_more/utils/spacing.dart';
import 'package:we_save_more/widget/app_text.dart';
import 'package:we_save_more/widget/custom_password_field.dart'; // Import the widget
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
                  onPressed: () {
                    Get.back();
                  },
                  icon: SvgPicture.asset(
                    "assets/svg/close_button.svg",
                    height: 35,
                  ),
                ),
                Spacing.h20,

                /// Logo
                Center(
                  child: Center(
                    child: Image.asset(
                      'assets/images/app_full_logo.png',
                      height: 100,
                    ),
                  ),
                ),

                Spacing.h20,

                /// Title
                const Center(
                  child: AppText(
                    'Change Password',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4A148C),
                  ),
                ),

                Spacing.h30,

                /// Old Password Field
                CustomPasswordField(
                  controller: controller.oldPassController,
                  hintText: 'Enter Old Password',
                  labelText: 'Enter Old Password :',
                  obscureText: controller.oldPassVisible,
                  showLabel: true,
                ),

                Spacing.h20,

                /// New Password Field
                CustomPasswordField(
                  controller: controller.newPassController,
                  hintText: 'Enter New Password',
                  labelText: 'Enter New Password :',
                  obscureText: controller.newPassVisible,
                  showLabel: true,
                ),

                Spacing.h20,

                /// Confirm Password Field
                CustomPasswordField(
                  controller: controller.confirmPassController,
                  hintText: 'Confirm Password',
                  labelText: 'Enter Confirm Password :',
                  obscureText: controller.confirmPassVisible,
                  showLabel: true,
                ),

                Spacing.h30,

                /// Change Password Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => controller.onSubmit(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4A148C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: const AppText(
                      'CHANGE PASSWORD',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),

                Spacing.h30,

                /// Instructions
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
                      _buildBulletPoint('Is longer than 7 characters'),
                      _buildBulletPoint('Does not match or significantly contain your username, e.g. do not use \'username123\''),
                      _buildBulletPoint('Password is case sensitive'),
                      _buildBulletPoint('Must contain at least 1 number'),
                      _buildBulletPoint('Should be different for multiple Ids'),
                      _buildBulletPoint('Does not have spaces, symbol and written in a-z/a-z 0-9 not user \'username123\''),
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

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppText(
            '• ',
            fontSize: 13,
            color: Colors.red,
            height: 1.5,
          ),
          Expanded(
            child: AppText(
              text,
              fontSize: 12,
              color: Colors.red,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}