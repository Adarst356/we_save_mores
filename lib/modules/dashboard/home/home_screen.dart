import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/custom_appbar.dart';
import '../../../widget/side_drawer.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const SideDrawer(),
      appBar: CustomAppbar(
        showProfileLayout: true,
        userName: "Vikash Kumar",
        role: "Customer",
        mobileNumber: "9876543210",
        onMenuTap: () {
          _scaffoldKey.currentState?.openDrawer();
        },
        onWhatsappTap: () {},
        customWhatsappIcon: SvgPicture.asset(
          'assets/svg/whatsapp-svgrepo-com.svg',
          width: 30,
          height: 30,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white,size: 30,),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white,size: 30,),
            onPressed: () {},
          ),
        ],
      ),
      body: const Center(child: Text("Home Screen")),
    );
  }
}
