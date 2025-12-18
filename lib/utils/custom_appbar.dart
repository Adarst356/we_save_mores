import 'package:flutter/material.dart';
import 'package:we_save_more/widget/app_text.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showLeft;
  final Widget? leftIcon;
  final Widget? rightIcon;

  const CustomAppbar({
    super.key,
    required this.title,
    this.showLeft = false,
    this.leftIcon,
    this.rightIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,                         // Strong shadow
      shadowColor: Colors.black45,
      child: AppBar(
        backgroundColor: const Color(0xFF3E1F66),
        elevation: 0,                       // AppBar ka elevation remove
        automaticallyImplyLeading: false,
        toolbarHeight: 75,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              if (showLeft && leftIcon != null) leftIcon!,
              if (showLeft && leftIcon != null) const SizedBox(width: 14),
              AppText(
                title,
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              const Spacer(),
              if (rightIcon != null) rightIcon!,
            ],
          ),
        ),
      ),
    );

  }

  @override
  Size get preferredSize => const Size.fromHeight(75);
}