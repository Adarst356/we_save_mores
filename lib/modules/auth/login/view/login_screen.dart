import 'package:flutter/material.dart';
import 'package:we_save_more/utils/app_strings.dart';
import 'package:we_save_more/utils/spacing.dart';
import 'package:we_save_more/widget/app_text.dart';

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
              "Welcome",
              color: Theme.of(context).primaryColor,
              fontSize: 22,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w800,
            ),
            AppText(
              "Login to Continue",
              fontFamily: "Poppins",
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            Spacing.h16,

            /// card container
            Container(
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
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Theme.of(context).primaryColor,
                      ),
                      labelText: "Mobile Number or User Id",
                      labelStyle: TextStyle(color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepPurple.shade400,
                        ),
                      ),
                    ),
                  ),
                  Spacing.h12,
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Theme.of(context).primaryColor,
                      ),
                      suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.abc_outlined))
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
