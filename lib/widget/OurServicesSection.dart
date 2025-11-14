import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OurServicesSection extends StatelessWidget {
  final List<Map<String, String>> services = [
    {"icon": "assets/icons/prepaid.png", "title": "Prepaid"},
    {"icon": "assets/icons/dth.png", "title": "DTH"},
    {"icon": "assets/icons/landline.png", "title": "Landline"},
    {"icon": "assets/icons/electricity.png", "title": "Electricity"},
    {"icon": "assets/icons/piped_gas.png", "title": "Piped Gas"},
    {"icon": "assets/icons/broadband.png", "title": "Broadband"},
    {"icon": "assets/icons/water.png", "title": "Water"},
    {"icon": "assets/icons/loan.png", "title": "Loan Repayment"},
    {"icon": "assets/icons/lpg.png", "title": "LPG Gas Cylinder"},
    {"icon": "assets/icons/insurance.png", "title": "Insurance Premium"},
    {"icon": "assets/icons/fastag.png", "title": "FASTag"},
    {"icon": "assets/icons/google_voucher.png", "title": "Google Play Voucher"},
  ];

  OurServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // 🔹 Responsive calculations
    int crossAxisCount = screenWidth < 360 ? 3 : 4;     // small phone = 3 columns
    double iconSize = screenWidth < 400 ? 35 : 40;      // icon responsive
    double fontSize = screenWidth < 400 ? 10 : 12;      // text responsive
    double ytHeight = screenWidth < 400 ? 50 : 80;      // YouTube responsive

    return Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(0, 3),
          )
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// ---------------- TITLE + YOUTUBE ----------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Our Services",
                style: TextStyle(
                  fontSize: screenWidth < 400 ? 18 : 22,
                  fontWeight: FontWeight.w700,
                ),
              ),

              SvgPicture.asset(
                "assets/svg/youtube.svg",
                height: ytHeight,
              ),
            ],
          ),

          SizedBox(height: 20),

          /// ---------------- RESPONSIVE GRID ----------------
          GridView.builder(
            itemCount: services.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 18,
              crossAxisSpacing: 10,
              childAspectRatio: screenWidth < 400 ? 0.78 : 0.85,
            ),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.asset(
                    services[index]["icon"]!,
                    height: iconSize,
                    width: iconSize,
                  ),
                  SizedBox(height: 8),
                  Text(
                    services[index]["title"]!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
