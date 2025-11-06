import 'package:flutter/material.dart';
import 'package:we_save_more/utils/spacing.dart';
import 'package:we_save_more/widget/app_text.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 14),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Image.asset(
                      "assets/images/close_btn.png",
                      height: 36,
                      width: 36,
                    ),
                    Column(
                      children: [
                        Image.asset(
                          "assets/images/app_full_logo.png",
                          height: 100,
                        ),
                       Spacing.h8,
                        const AppText(
                          "Sign Up",
                            fontSize: 35,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                      ],
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    "assets/images/bg_circle_bottom.png",
                    height: 200,
                    width: 180,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              AppText("Welcome",fontSize: 20,fontFamily: "Poppins",),
              AppText("Create Account")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
