import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:we_save_more/routes/app_routes.dart';
import 'package:we_save_more/utils/app_strings.dart';
import 'package:we_save_more/utils/spacing.dart';
import 'package:we_save_more/widget/app_text.dart';
import 'package:we_save_more/widget/custom_textfield.dart';

import '../../../../widget/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppText(
                    AppStrings.loginTitle,
                    fontSize: 48,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Image.asset(
                  "assets/images/bg_circle_top.png",
                  height: 250,
                  width: 210,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
            ClipRRect(
              child: Image.asset(
                "assets/images/app_full_logo.png",
                height: 150,
              ),
            ),
            Spacing.h16,
            AppText(
              AppStrings.homeTitle,
              color: Theme.of(context).primaryColor,
              fontSize: 22,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w800,
            ),
            AppText(
              AppStrings.homeSubtitle,
              fontFamily: "Poppins",
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),

            /// card container
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    CustomTextField(
                      labelText: AppStrings.mobileAuth,
                      prefixIcon: Icons.phone,
                    ),
                    Spacing.h16,
                    CustomTextField(
                      labelText: AppStrings.passAuth,
                      prefixIcon: Icons.lock,
                      suffixIcon: Icons.visibility,
                      obscureText: true,
                      onSuffixTap: () {},
                    ),
                    Spacing.h16,
                    AppText(
                      AppStrings.policyInstruction,
                      color: Colors.black54,
                      fontSize: 12,
                      align: TextAlign.center,
                    ),
                    Spacing.h8,
                    GestureDetector(
                      onTap: () {},
                      child: AppText(
                        AppStrings.privacyPolicy,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacing.h20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: AppText(
                      AppStrings.forgotPass,
                      fontSize: 20,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                CustomButton(
                  text: AppStrings.login,
                  icon: Icons.lock,
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/bg_circle_bottom.png",
                  height: 250,
                  width: 210,
                  color: Theme.of(context).primaryColor,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: AppText(
                        AppStrings.userNotExist,
                        color: Colors.grey,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.signUp);
                      },
                      child: AppText(
                        AppStrings.signUp,
                        fontSize: 28,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
