import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:we_save_more/routes/app_routes.dart';
import 'package:we_save_more/widget/app_text.dart';

import '../../../../utils/app_strings.dart';
import '../../../../utils/spacing.dart';
import '../../../../widget/custom_button.dart';
import '../../../../widget/custom_textfield.dart';

class ForgotPass extends StatelessWidget {
  const ForgotPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
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
                    height: 200,
                    width: 180,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
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
                      labelText: AppStrings.forgotMobile,
                      prefixIcon: Icons.phone,
                    ),
                    Spacing.h16,
                  ],
                ),
              ),
            ),
            Spacing.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){Get.toNamed(AppRoutes.login);},
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
                  onPressed: () {},
                ),
              ],
            ),
            Align(
              alignment:Alignment.bottomLeft,
              child: Image.asset(
                "assets/images/bg_circle_bottom.png",
                height: 200,
                width: 180,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
