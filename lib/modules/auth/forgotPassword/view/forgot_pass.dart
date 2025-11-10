import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/app_strings.dart';
import '../../../../utils/spacing.dart';
import '../../../../widget/app_text.dart';
import '../../../../widget/custom_button.dart';
import '../../../../widget/custom_textfield.dart';
import 'forgot_pass_controller.dart';

class ForgotPass extends GetView<ForgotPassController> {
  ForgotPass({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// Header
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
                    height: 180,
                    width: 160,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),

              /// Logo
              ClipRRect(
                child: Image.asset(
                  "assets/images/app_full_logo.png",
                  height: 150,
                ),
              ),
              Spacing.h16,

              AppText(
                AppStrings.forgotPass1,
                fontSize: 22,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w800,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppText(
                  AppStrings.forgotSubtitle,
                  fontFamily: "Poppins",
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).primaryColor,
                ),
              ),

              /// Card Container
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Obx(
                            () => CustomTextField(
                          labelText: AppStrings.forgotMobile,
                          prefixIcon: Icons.phone,
                          maxLength: 10,
                          controller: controller.mobileController,
                          keyboardType: TextInputType.number,
                          errorText: controller.mobileError.value,
                          onChanged: controller.validateMobile,
                        ),
                      ),
                      Spacing.h16,
                    ],
                  ),
                ),
              ),

              /// Buttons
              Spacing.h16,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.login),
                      child: AppText(
                        "Cancel",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                  CustomButton(
                    text: AppStrings.forgotSubmit,
                    icon: Icons.key,
                    topRight: 0,
                    bottomRight: 0,
                    onPressed: controller.sendOtpWithDialog,
                  ),
                ],
              ),

              /// Bottom Design
              Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                  "assets/images/bg_circle_bottom.png",
                  height: 180,
                  width: 160,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
