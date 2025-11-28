import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_save_more/modules/dashboard/drawer/view/side_drawer_controller.dart';
import 'package:we_save_more/utils/spacing.dart';
import 'package:we_save_more/widget/app_text.dart';
import '../../main_nav/main_nav_controller.dart';
import '../../profile/view/profile_controller.dart';

class SideDrawer extends StatelessWidget {
  SideDrawer({super.key});

  final SideDrawerController controller = Get.put(SideDrawerController());
  final ProfileController profileController = Get.find();

  final Color primaryColor = const Color(0xFF3E1F66);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final profile = profileController.profileData.value;
      final initials = profileController.getInitials(profile?.name);

      return Drawer(
        width: MediaQuery.of(context).size.width * 0.78,
        child: Container(
          color: primaryColor,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /// ===== TOP PROFILE SECTION =====
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /// ------- DYNAMIC PROFILE PHOTO -------
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.white24,
                          backgroundImage: (profile?.profilePic != null &&
                              profile!.profilePic.toString().isNotEmpty)
                              ? NetworkImage(profile.profilePic.toString())
                              : null,
                          child: (profile?.profilePic == null ||
                              profile!.profilePic.toString().isEmpty)
                              ? AppText(
                            initials,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          )
                              : null,
                        ),

                        Spacing.w12,

                        /// ------- DYNAMIC NAME + MOBILE + EMAIL -------
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                profile?.name ?? "User Name",
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                              Spacing.h4,
                              AppText(
                                profile?.mobileNo ?? "N/A",
                                color: Colors.white70,
                                fontSize: 13,
                              ),
                              AppText(
                                profile?.emailID ?? "N/A",
                                color: Colors.white70,
                                fontSize: 13,
                              ),
                            ],
                          ),
                        ),

                        /// ------- LOGOUT BUTTON -------
                        GestureDetector(
                          onTap: () {
                            controller.showLogoutDialog();
                          },
                          child: const Icon(
                            Icons.power_settings_new,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// =====================================================
                  /// LIGHT BUTTON SECTION
                  /// =====================================================
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    color: Colors.white,
                    child: Column(
                      children: [
                        _menuButton(
                          "Transaction Report",
                          Icons.receipt_long,
                          Colors.purple,
                              () {
                            // Close drawer first
                                Get.back();

                            // Switch to Reports tab (index 3)
                            final mainNavController = Get.find<MainNavigationController>();
                            mainNavController.changeIndex(3);
                          },
                        ),
                        _menuButton(
                          "Wallet History",
                          Icons.account_balance_wallet,
                          Colors.pink,
                              () {
                                Get.back();
                            // TODO: Add navigation or functionality
                          },
                        ),
                        _menuButton(
                          "Add Money",
                          Icons.add_circle,
                          Colors.orange,
                              () {
                                Get.back();
                            // TODO: Add navigation or functionality
                          },
                        ),
                        _menuButton(
                          "Send To Mobile No",
                          Icons.send,
                          Colors.green,
                              () {
                                Get.back();
                            // TODO: Add navigation or functionality
                          },
                        ),
                      ],
                    ),
                  ),

                  Spacing.h10,

                  /// =====================================================
                  // DARK GRID BUTTONS
                  /// =====================================================
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 1.3,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      _darkButton("Change Password", Icons.key, () {
                        Navigator.pop(context);
                        // TODO: Add navigation
                      }),
                      _darkButton("Change Pin Password", Icons.lock, () {
                        Navigator.pop(context);
                        // TODO: Add navigation
                      }),
                      _darkButton("Customer Support", Icons.headset_mic, () {
                        Navigator.pop(context);
                        final mainNavController = Get.find<MainNavigationController>();
                        mainNavController.changeIndex(1); // Support tab
                      }),
                      _darkButton("Refer & Earn", Icons.share, () {
                        Navigator.pop(context);
                        final mainNavController = Get.find<MainNavigationController>();
                        mainNavController.changeIndex(2); // Refer tab
                      }),
                    ],
                  ),

                  /// =====================================================
                  /// BOTTOM LOGO AREA
                  /// =====================================================
                  Container(
                    color: primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/app_full_logo.png',
                          height: 70,
                        ),
                        const SizedBox(height: 8),
                        const AppText(
                          "Powered by RSK online service pvt Ltd",
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),

                  Spacing.h24,
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  /// ===== LIGHT MENU BUTTON =====
  Widget _menuButton(String title, IconData icon, Color bgColor, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFf5efe4),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 18,
          backgroundColor: bgColor,
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 16,
          color: Colors.black54,
        ),
        onTap: onTap,
      ),
    );
  }

  /// ===== DARK GRID BUTTON =====
  Widget _darkButton(String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF2D1450),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.amber[200], size: 30),
              Spacing.h8,
              AppText(
                title,
                align: TextAlign.center,
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}