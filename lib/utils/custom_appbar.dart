import 'package:flutter/material.dart';
import 'package:we_save_more/widget/app_text.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leftIcon;
  final Widget? rightIcon;

  const CustomAppbar({
    super.key,
    required this.title,
    this.leftIcon,
    this.rightIcon,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF3E1F66),
      elevation: 0,
      automaticallyImplyLeading: false,
      toolbarHeight: 75,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            /// LEFT ICON
            if (leftIcon != null) leftIcon!,

            if (leftIcon != null) const SizedBox(width: 30),

            /// TITLE (Left aligned)
            AppText(
              title,
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            Spacer(),
            /// RIGHT ICON
            if (rightIcon != null) rightIcon!,
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(75);
}
