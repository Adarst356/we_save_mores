import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_save_more/modules/dashboard/home/home_screen.dart';
import 'package:we_save_more/modules/dashboard/profile/profile_screen.dart';
import 'package:we_save_more/modules/dashboard/refers/view/refers_screen.dart';
import 'package:we_save_more/modules/dashboard/reports/view/report_screen.dart';
import 'package:we_save_more/modules/dashboard/support/view/support_screen.dart';
import '../../../routes/app_routes.dart';
import '../support/view/support_controller.dart';
import 'main_nav_controller.dart';

class MainNav extends StatelessWidget {
  final MainNavigationController controller = Get.put(MainNavigationController());
  // final SupportController supportController = Get.put(SupportController());

  final List<Widget> _pages = [
    HomeScreen(),
    const SupportScreen(),
     RefersScreen(),
    const ReportScreen(),
    const ProfileScreen(),
  ];

  MainNav({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Obx(() => WillPopScope(
      onWillPop: () async {
        if (controller.selectedIndex.value != 0) {
          controller.changeIndex(0);
          return false;
        }
        return true;
      },
      child: Scaffold(
        extendBody: true,
        body: _pages[controller.selectedIndex.value],

        /// Floating "Refer" Button
        floatingActionButton: controller.selectedIndex.value == 2
            ? null /// agar already main nav ka refer tab active ho, ya standalone screen pe nahi
            : Container(
          height: 58,
          width: 58,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.primaryColor,
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0,3))],
          ),
          child: IconButton(
            onPressed: () => Get.toNamed(AppRoutes.referral),
            icon: Icon(Icons.share, color: Colors.white, size: 26),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


        /// Bottom Navigation Bar
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          elevation: 10,
          color: theme.cardColor,
          child: SizedBox(
            height: 65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _navItem(Icons.home, "Home", 0, controller, isDarkMode, theme),
                _navItem(Icons.support_agent, "Support", 1, controller, isDarkMode, theme),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 22),
                    Text(
                      "Refer",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: controller.selectedIndex.value == 2
                            ? (isDarkMode ? Colors.white : theme.primaryColor)
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),

                _navItem(Icons.receipt_long, "Reports", 3, controller, isDarkMode, theme),
                _navItem(Icons.person, "Profile", 4, controller, isDarkMode, theme),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  /// ✅ Navigation Item
  Widget _navItem(
      IconData icon,
      String label,
      int index,
      MainNavigationController controller,
      bool isDarkMode,
      ThemeData theme,
      ) {
    final isSelected = controller.selectedIndex.value == index;

    return GestureDetector(
      onTap: () => controller.changeIndex(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected
                ? (isDarkMode ? Colors.white : theme.primaryColor)
                : Colors.grey,
            size: 26,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected
                  ? (isDarkMode ? Colors.white : theme.primaryColor)
                  : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
