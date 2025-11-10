import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_save_more/routes/app_routes.dart';
import 'package:we_save_more/utils/app_strings.dart';
import 'package:we_save_more/utils/spacing.dart';
import 'package:we_save_more/widget/app_text.dart';
import 'package:we_save_more/widget/custom_button.dart';
import 'package:we_save_more/widget/custom_textfield.dart';
import 'signup_controller.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 14),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  /// Top section with close & logo
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.login);
                          },
                          child: Image.asset(
                            "assets/images/close_btn.png",
                            height: 36,
                            width: 36,
                          ),
                        ),
                        const Spacer(),
                        Image.asset(
                          "assets/images/app_full_logo.png",
                          height: 100,
                        ),
                        Spacing.h8,
                      ],
                    ),
                  ),

                  /// Title & circles
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                          "assets/images/bg_circle_bottom.png",
                          height: 180,
                          width: 160,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: AppText(
                          "Sign Up",
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  AppText(
                    AppStrings.homeTitle,
                    fontSize: 22,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).primaryColor,
                  ),
                  AppText(
                    AppStrings.createAcc,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),

                  /// Input fields container
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
                              ? Colors.white24
                              : Colors.black12,
                        ),
                        boxShadow: [
                          if (Theme.of(context).brightness == Brightness.light)
                            const BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                        ],
                      ),

                      child: Column(
                        children: [
                          /// Name
                          Obx(() => CustomTextField(
                            labelText: AppStrings.name,
                            prefixIcon: Icons.person,
                            controller: controller.nameController,
                            errorText: controller.nameError.value,
                            onChanged: (value) =>
                                controller.validateName(value),
                          )),
                          Spacing.h16,

                          /// Mobile
                          Obx(() => CustomTextField(
                            labelText: AppStrings.mobileNum,
                            prefixIcon: Icons.phone_android,
                            controller: controller.mobileController,
                            keyboardType: TextInputType.number,
                            maxLength: 10,
                            errorText: controller.mobileError.value,
                            onChanged: (value) =>
                                controller.validateMobile(value),
                          )),
                          Spacing.h16,

                          /// Email
                          Obx(() => CustomTextField(
                            labelText: AppStrings.email,
                            prefixIcon: Icons.email,
                            controller: controller.emailController,
                            keyboardType: TextInputType.emailAddress,
                            errorText: controller.emailError.value,
                            onChanged: (value) =>
                                controller.validateEmail(value),
                          )),
                          Spacing.h16,

                          /// Password Field (Realtime)
                          Obx(() => CustomTextField(
                            labelText: AppStrings.passAuth,
                            prefixIcon: Icons.lock,
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
                        ],
                      ),
                    ),
                  ),
                  /// Sign Up button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomButton(
                        text: AppStrings.signUp,
                        icon: Icons.lock,
                        topLeft: 0,
                        bottomLeft: 0,
                        onPressed: () {
                          controller.signup(); // handles both validation + loading + API
                        },
                      ),
                    ],
                  ),


                  Spacing.h20,

                  /// Already have account section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: AppText(
                          AppStrings.alreadyAccount,
                          fontFamily: "Poppins",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoutes.login);
                              },
                              child: AppText(
                                AppStrings.login,
                                fontSize: 34,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Poppins",
                                color: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.color,
                              ),
                            ),
                          ),
                          Image.asset(
                            "assets/images/bg_circle_top.png",
                            height: 180,
                            width: 160,
                            color: Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
