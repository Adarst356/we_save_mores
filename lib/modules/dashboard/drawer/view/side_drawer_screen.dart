import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:we_save_more/modules/dashboard/drawer/view/side_drawer_controller.dart';
import 'package:we_save_more/utils/spacing.dart';

class SideDrawer extends StatelessWidget {
   SideDrawer({super.key});
  final SideDrawerController controller = Get.put(SideDrawerController());
   final Color primaryColor = const Color(0xFF3E1F66);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.78,
      child: Container(
        color: primaryColor,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // ===== Top Profile Section =====
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white24,
                        child: Text(
                          "VK",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Vikash Kumar - Customer",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "9798374412",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              "vikashk66606@gmail.com",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.showLogoutDialog();  // 🔥 पहले dialog खुलेगा
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

                // ===== Light Buttons Section =====
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  color: Colors.white,
                  child: Column(
                    children: [
                      _menuButton("Transaction Report", Icons.receipt_long,
                          Colors.purple),
                      _menuButton("Wallet History",
                          Icons.account_balance_wallet, Colors.pink),
                      _menuButton(
                          "Add Money", Icons.add_circle, Colors.orange),
                      _menuButton(
                          "Send To Mobile No", Icons.send, Colors.green),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // ===== Dark Buttons Section (Grid) =====
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 1.3,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    _darkButton("Change Password", Icons.key),
                    _darkButton("Change Pin Password", Icons.lock),
                    _darkButton("Customer Support", Icons.headset_mic),
                    _darkButton("Refer & Earn", Icons.share),
                  ],
                ),

                // ===== Bottom Logo Section =====
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
                      const Text(
                        "Powered by RSK online service pvt Ltd",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
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
  }

  // ===== Light Menu Button =====
  Widget _menuButton(String title, IconData icon, Color bgColor) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFf5efe4),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
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
        onTap: () {},
      ),
    );
  }

  // ===== Dark Grid Buttons =====
  Widget _darkButton(String title, IconData icon) {
    return Padding(
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
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
