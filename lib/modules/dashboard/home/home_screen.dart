import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:marquee/marquee.dart';
import 'package:we_save_more/utils/spacing.dart';
import 'package:we_save_more/widget/app_text.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/custom_appbar.dart';
import '../../../widget/OurServicesSection.dart';
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
                Icon(Icons.refresh, color: Colors.white, size: 26),
                Spacing.w10,
                Icon(Icons.notifications, color: Colors.white, size: 28),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 110,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      spreadRadius: 1,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(width: 15),
                    SvgPicture.asset(
                      "assets/svg/wallet-svgrepo-com.svg",
                      height: 50,
                      width: 50,
                    ),
                    Spacing.w20,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          "PREPAID WALLET",
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        AppText(
                          "₹ 3.40",
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _latestNews(
                "PLEASE SWITCH TO RESKPAY APP  कृपया RESKPAY ऐप पर शिफ्ट हो जाएं",
              ),
            ),

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        colors: [
                          appColors.serviceGradientStart,
                          appColors.serviceGradientEnd,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            serviceCircularItem("Add Money", Icons.add),
                            serviceCircularItem("Send Money", Icons.send),
                            serviceCircularItem("Report", Icons.receipt_long),
                            serviceCircularItem(
                              "Wallet History",
                              Icons.account_balance_wallet,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Transform.translate(
                  offset: Offset(0, -68),
                  child: Container(
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                "Our Services",
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                              SvgPicture.asset(
                                "assets/svg/youtube.svg",
                                height: 80,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 10),

                        /// ---------------- GRID VIEW ----------------
                        GridView(
                          shrinkWrap: true,
                          padding: EdgeInsets.all(0),
                          physics: NeverScrollableScrollPhysics(),

                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 90,
                                childAspectRatio: 0.75,
                              ),
                          children: [
                            serviceItem("Recharge", Icons.phone_android),
                            serviceItem("Bill Pay", Icons.receipt_long),
                            serviceItem("UPI Pay", Icons.qr_code),
                            serviceItem("Wallet", Icons.account_balance_wallet,),

                            serviceItem("Send Money", Icons.send),
                            serviceItem("Add Money", Icons.add_circle),
                            serviceItem("History", Icons.history),
                            serviceItem("Support", Icons.support_agent),

                            serviceItem("Offer", Icons.local_offer),
                            serviceItem("Scan", Icons.qr_code_scanner),
                            serviceItem("Report", Icons.report),
                            serviceItem("More", Icons.more_horiz),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Spacing.h180,
          ],
        ),
      ),
    );
  }
}

Widget _latestNews(String text) {
  return Container(
    height: 50,
    decoration: BoxDecoration(
      color: appColors.latestNewsBg,
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 3)),
      ],
    ),
    child: Row(
      children: [
        /// Left Yellow Box
        Container(
          width: 70,
          height: 50,
          decoration: BoxDecoration(
            color: appColors.latestNewsLabelBg,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
          alignment: Alignment.center,
          child: const AppText(
            "Latest\nNews",
            align: TextAlign.center,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),

        Spacing.h12,

        /// Marquee text
        Expanded(
          child: Marquee(
            text: text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: appColors.latestNewsText,
            ),
            velocity: 40,
            blankSpace: 50,
            startPadding: 10,
            pauseAfterRound: Duration(seconds: 1),
          ),
        ),
      ],
    ),
  );
}

Widget serviceCircularItem(String title, IconData icon) {
  return Padding(
    padding: const EdgeInsets.only(top: 16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Icon(icon, size: 28, color: Colors.black87),
        ),

        SizedBox(height: 6),
        SizedBox(
          width: 70,
          child: Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              height: 1.2,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget serviceItem(String title, IconData icon) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, size: 26, color: Colors.blue),
      ),
      SizedBox(height: 5),
      Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      ),
    ],
  );
}
