import 'package:flutter/material.dart';
import 'package:we_save_more/widget/app_text.dart';

class CustomAppbarFlutter extends StatelessWidget
    implements PreferredSizeWidget {
  final String? userName;
  final String? role;
  final String? mobileNumber;
  final String? profileImage;

  final Widget? leftWidget;
  final Widget? rightWidget;

  const CustomAppbarFlutter({
    super.key,
    this.userName,
    this.role,
    this.mobileNumber,
    this.profileImage,
    this.leftWidget,
    this.rightWidget,
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
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// ===== Left Widget (like menu icon etc.) =====
            if (leftWidget != null) leftWidget!,

            if (leftWidget != null) const SizedBox(width: 15),

            /// ===== Avatar =====
            CircleAvatar(
              radius: 20,
              backgroundColor: const Color(0xff203752),
              backgroundImage: profileImage != null
                  ? NetworkImage(profileImage!)
                  : null,
              child: profileImage == null
                  ? Text(
                      _getInitials(userName ?? ""),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    )
                  : null,
            ),

            const SizedBox(width: 10),

            /// ===== User Info =====
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: AppText(
                          userName ?? "",
                          overflow: TextOverflow.ellipsis,
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,

                        ),
                      ),
                      const SizedBox(width: 4),
                      Flexible(
                        child: AppText(
                          "- ${role ?? ""}",
                          overflow: TextOverflow.ellipsis,
                            color: Colors.white70,
                            fontSize: 12.5,
                        ),
                      ),
                    ],
                  ),
                  AppText(
                    mobileNumber ?? "",
                 color: Colors.white70, fontSize: 12
                  ),
                ],
              ),
            ),

            /// ===== Right Widget (like actions/icons) =====
            if (rightWidget != null) rightWidget!,
          ],
        ),
      ),
    );
  }

  String _getInitials(String name) {
    if (name.trim().isEmpty) return "U";
    final parts = name.trim().split(" ");
    return parts.length == 1
        ? parts.first.substring(0, 1).toUpperCase()
        : (parts.first.substring(0, 1) + parts.last.substring(0, 1))
              .toUpperCase();
  }

  @override
  Size get preferredSize => const Size.fromHeight(75);
}
