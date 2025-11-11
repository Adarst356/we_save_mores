import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:we_save_more/utils/spacing.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showLeading;
  final bool showProfileLayout;

  final String? userName;
  final String? role;
  final String? mobileNumber;
  final String? profileImage;

  final VoidCallback? onMenuTap;
  final VoidCallback? onBackTap;
  final VoidCallback? onWhatsappTap;

  ///  Custom WhatsApp icon from user
  final Widget? customWhatsappIcon;

  ///  Custom right-side icons
  final List<Widget>? actions;

  const CustomAppbar({
    super.key,
    this.title,
    this.showLeading = true,
    this.showProfileLayout = false,
    this.userName,
    this.role,
    this.mobileNumber,
    this.profileImage,
    this.onMenuTap,
    this.onBackTap,
    this.onWhatsappTap,
    this.customWhatsappIcon,
    this.actions,
  });

  final Color primaryColor = const Color(0xFF3E1F66);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      toolbarHeight: showProfileLayout ? 75 : 60,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: showProfileLayout
            ? _buildProfileLayout()
            : _buildSimpleAppbar(),
      ),
    );
  }

  /// ========== SIMPLE APPBAR ==========
  Widget _buildSimpleAppbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (showLeading)
          GestureDetector(
            onTap: onBackTap ?? onMenuTap,
            child: const Icon(Icons.arrow_back_ios_new, size: 22),
          ),
        Expanded(
          child: Center(
            child: Text(
              title ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        if (actions != null)
          Row(mainAxisSize: MainAxisSize.min, children: actions!)
        else
          const SizedBox(width: 10),
      ],
    );
  }

  /// ========== PROFILE APPBAR ==========
  Widget _buildProfileLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// Menu Icon
        GestureDetector(
          onTap: onMenuTap,
          child: Padding(
            padding: const EdgeInsets.only(left: 4, right: 8),
            child: SvgPicture.asset(
              "assets/svg/menu-fries-svgrepo-com.svg",
              width: 28,
              height: 26,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 15),

        /// Avatar
        CircleAvatar(
          radius: 20,
          backgroundColor: Color(0xff203752),
          backgroundImage:
          profileImage != null ? NetworkImage(profileImage!) : null,
          child: profileImage == null
              ? Text(
            _getInitials(userName ?? ""),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          )
              : null,
        ),
        const SizedBox(width: 10),

        /// User details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(
                      userName ?? "",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 3),
                  Flexible(
                    child: Text(
                      "- ${role ?? ""}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12.5,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 1),
              Text(
                mobileNumber ?? "",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),


        /// Actions (WhatsApp + Refresh + Notification)
        /// Actions (WhatsApp + Refresh + Notification)
        Row(
          children: [
            if (customWhatsappIcon != null)
              GestureDetector(
                onTap: onWhatsappTap,
                child: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: customWhatsappIcon!,
                ),
              ),

            if (actions != null)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: actions!.map((widget) {
                  // ✅ Detect if it's a notification icon and wrap with badge
                  if (widget is IconButton &&
                      widget.icon is Icon &&
                      (widget.icon as Icon).icon == Icons.notifications) {
                    return Stack(
                      clipBehavior: Clip.none,
                      children: [
                        widget,
                        Positioned(
                          right: 8,
                          top: 8,
                          child: Container(
                            width: 15,
                            height: 15,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return widget;
                }).toList(),
              ),
          ],
        ),

      ],
    );
  }

  ///  Helper: Generate initials from user name (e.g., "Vikash Kumar" → "VK")
  String _getInitials(String name) {
    if (name.trim().isEmpty) return "U";
    List<String> parts = name.trim().split(" ");
    if (parts.length == 1) {
      return parts.first.substring(0, 1).toUpperCase();
    } else {
      return (parts.first.substring(0, 1) + parts.last.substring(0, 1))
          .toUpperCase();
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(75);
}
