import 'package:flutter/material.dart';
import 'package:we_save_more/theme/app_colors.dart';
import 'package:we_save_more/utils/custom_appbar.dart';
import 'package:we_save_more/utils/spacing.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title:"User Profile",
        rightIcon: Icon(
        Icons.power_settings_new,
        color: Colors.white,
        size: 28,
      ),
      ),
          body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: appColors.primaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),child: CircleAvatar(

          ),
          )

        ],
    ),
    );
  }
}
