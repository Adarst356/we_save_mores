import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_save_more/routes/app_routes.dart';
import 'package:we_save_more/utils/app_strings.dart';
import 'package:we_save_more/utils/spacing.dart';
import 'package:we_save_more/widget/app_text.dart';
import 'package:we_save_more/widget/custom_textfield.dart';
import 'package:we_save_more/widget/custom_button.dart';
import 'login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
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
                    height: 230,
                    width: 180,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),

              ClipRRect(
                child: Image.asset(
                  "assets/images/app_full_logo.png",
                  height: 120,
                ),
              ),

              Spacing.h12,
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

              /// Card container
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? const Color(0xFF1E1E1E)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white.withOpacity(0.2)
                          : Colors.black12,
                      width: 1,
                    ),
                    boxShadow: Theme.of(context).brightness == Brightness.dark
                        ? []
                        : [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),

                  child: Column(
                    children: [
                      /// Mobile Field
                      Obx(() => CustomTextField(
                        labelText: AppStrings.mobileAuth,
                        prefixIcon: Icons.phone,
                        controller: controller.mobileController,
                        maxLength: 10,
                        errorText: controller.mobileError.value,
                        onChanged: controller.validateMobile,
                      )),
                      Spacing.h16,

                      /// Password Field (Realtime)
                      Obx(() => CustomTextField(
                        labelText: AppStrings.passAuth,
                        prefixIcon: Icons.lock,
                        maxLength: 6,
                        suffixIcon: controller.obscureText.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        obscureText: controller.obscureText.value,
                        onSuffixTap: () =>
                            controller.obscureText.toggle(),
                        controller: controller.passwordController,
                        errorText: controller.passwordError.value,
                        onChanged: controller.validatePassword,
                      )),
                      Spacing.h16,

                      AppText(
                        AppStrings.policyInstruction,
                        fontSize: 12,
                        align: TextAlign.center,
                        fontWeight: FontWeight.w100,
                      ),
                      Spacing.h8,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: AppText(
                              AppStrings.privacyPolicy,
                              decoration: TextDecoration.underline,
                              useThemeColor: true,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: AppText(
                              AppStrings.termCondition,
                              decoration: TextDecoration.underline,
                              useThemeColor: true,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Spacing.h16,

              /// Bottom Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.forgotPass);
                      },
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
                    topRight: 0,
                    bottomRight: 0,
                    onPressed: () {
                      controller.validateForm();
                    },
                  ),
                ],
              ),

              /// Sign Up Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/bg_circle_bottom.png",
                    height: 230,
                    width: 180,
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
      ),
    );
  }
}
