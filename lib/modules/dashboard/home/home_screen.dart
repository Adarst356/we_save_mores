import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:we_save_more/utils/spacing.dart';
import '../../../utils/custom_appbar.dart';
import '../drawer/side_drawer.dart';

class HomeScreen extends StatelessWidget {
  final box = GetStorage();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userName = box.read('userName') ?? 'Vikash Kumar';
    final role = box.read('role') ?? 'Customer';
    final mobile = box.read('mobile') ?? '9876543210';

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const SideDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: Builder(
          builder: (context) => CustomAppbarFlutter(
            userName: userName,
            role: role,
            mobileNumber: mobile,

            leftWidget: GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: SvgPicture.asset(
                "assets/svg/menu-fries-svgrepo-com.svg",
                width: 28,
                height: 28,
                color: Colors.white,
              ),
            ),

            rightWidget: Row(
              children: [
                SvgPicture.asset(
                  "assets/svg/whatsapp-svgrepo-com.svg",
                  width: 26,
                  height: 26,
                ),
                Spacing.w10,
                Icon(
                    Icons.refresh,
                    color: Colors.white,
                    size: 26
                ),
                Spacing.w10,
                 Icon(
                     Icons.notifications,
                     color: Colors.white,
                     size: 28
                 ),
              ],
            ),
          ),
        ),
      ),
      body: const Center(child: Text("Home Screen")),
    );
  }
}
