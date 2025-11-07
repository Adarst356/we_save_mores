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
                          height: 200,
                          width: 180,
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
                          CustomTextField(
                            labelText: AppStrings.name,
                            prefixIcon: Icons.person,
                            controller: controller.nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your name";
                              }
                              return null;
                            },
                          ),
                          Spacing.h16,

                          /// Mobile Number
                          CustomTextField(
                            labelText: AppStrings.mobileNum,
                            prefixIcon: Icons.mobile_friendly,
                            controller: controller.mobileController,
                            keyboardType: TextInputType.number,
                            maxLength: 10,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your mobile number";
                              } else if (!RegExp(r'^[0-9]{10}$')
                                  .hasMatch(value)) {
                                return "Enter valid 10-digit mobile number";
                              }
                              return null;
                            },
                          ),
                          Spacing.h16,

                          /// Email
                          CustomTextField(
                            labelText: AppStrings.email,
                            prefixIcon: Icons.email,
                            controller: controller.emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your email";
                              } else if (!RegExp(
                                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
                                  .hasMatch(value)) {
                                return "Enter a valid email";
                              }
                              return null;
                            },
                          ),
                          Spacing.h16,

                          /// Password
                          Obx(() => CustomTextField(
                            labelText: AppStrings.pass,
                            prefixIcon: Icons.password,
                            suffixIcon: controller.obscureText.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            obscureText: controller.obscureText.value,
                            onSuffixTap: () {
                              controller.obscureText.toggle();
                            },
                            controller: controller.passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your password";
                              } else if (value.length < 6) {
                                return "Password must be at least 6 characters";
                              }
                              return null;
                            },
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
                          controller.validateForm();
                        },
                      ),
                    ],
                  ),

                  Spacing.h40,

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
                      Spacing.h16,
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
                            height: 200,
                            width: 180,
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
