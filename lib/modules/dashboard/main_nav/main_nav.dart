import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:we_save_more/modules/dashboard/profile/profile_screen.dart';
import 'package:we_save_more/modules/dashboard/refers/refers_screen.dart';
import 'package:we_save_more/modules/dashboard/reports/report_screen.dart';
import 'package:we_save_more/modules/dashboard/support/support_screen.dart';

import '../home/home_screen.dart';
import 'main_nav_controller.dart';

class MainNav extends StatelessWidget {
  final MainNavigationController controller = Get.put(MainNavigationController());

  final List<Widget> _pages = [
    HomeScreen(),
    SupportScreen(),
    RefersScreen(),
   ReportScreen(),
    ProfileScreen()
  ];

  MainNav({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isTablet = width >= 640;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;


    final navBackground = theme.bottomNavigationBarTheme.backgroundColor ??
        theme.scaffoldBackgroundColor;
    final selectedColor = theme.bottomNavigationBarTheme.selectedItemColor ??
        colorScheme.primary;
    final unselectedColor = theme.bottomNavigationBarTheme.unselectedItemColor ??
        Colors.grey;

    return WillPopScope(
      onWillPop: () {
        if (controller.selectedIndex.value == 0) {
          return Future.value(true);
        } else {
          controller.changeIndex(0);
          return Future.value(false);
        }
      },
      child: Obx(
            () => Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          body: isTablet
              ? Row(
            children: [
              NavigationRail(
                backgroundColor: navBackground,
                selectedIndex: controller.selectedIndex.value,
                onDestinationSelected: controller.changeIndex,
                labelType: NavigationRailLabelType.all,
                selectedIconTheme:
                IconThemeData(color: selectedColor, size: 28),
                unselectedIconTheme:
                IconThemeData(color: unselectedColor, size: 26),
                selectedLabelTextStyle: TextStyle(
                  color: selectedColor,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelTextStyle: TextStyle(
                  color: unselectedColor,
                ),
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.home_outlined),
                    selectedIcon: Icon(Icons.home),
                    label: Text("Home"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.search),
                    selectedIcon: Icon(Icons.search),
                    label: Text("Discover"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.shopping_bag),
                    selectedIcon: Icon(Icons.shopping_bag),
                    label: Text("My Order"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.person_outline),
                    selectedIcon: Icon(Icons.person),
                    label: Text("Profile"),
                  ),
                 ],
              ),
              Expanded(child: _pages[controller.selectedIndex.value]),
            ],
          )
              : _pages[controller.selectedIndex.value],


          bottomNavigationBar: isTablet
              ? null
              : BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            type: BottomNavigationBarType.fixed,
            backgroundColor: navBackground,
            selectedItemColor: selectedColor,
            unselectedItemColor: unselectedColor,
            onTap: controller.changeIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Discover",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag),
                label: "My Order",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}





