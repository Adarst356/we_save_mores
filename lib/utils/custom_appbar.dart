import 'package:flutter/material.dart';
import 'package:we_save_more/widget/app_text.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showLeft;
  final VoidCallback? onLeftTap;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final double iconSize;

  const CustomAppbar({
    super.key,
    required this.title,
    this.showLeft = false,
    this.onLeftTap,
    this.leftIcon,
    this.rightIcon,
    this.iconSize = 35.0, // ✅ बड़ा size
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      shadowColor: Colors.black45,
      child: AppBar(
        backgroundColor: const Color(0xFF3E1F66),
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 75,
        titleSpacing: 0,
        leading: showLeft
            ? GestureDetector(
          onTap: onLeftTap ?? () {
            Navigator.pop(context);
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            width: 56, // ✅ Width बढ़ाई
            padding: const EdgeInsets.only(left: 16),
            child: Center(
              child: leftIcon ?? Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: iconSize, // ✅ Icon size
              ),
            ),
          ),
        )
            : null,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: AppText(
                  title,
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
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