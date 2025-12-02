import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:we_save_more/modules/dashboard/support/view/support_controller.dart';
import 'package:we_save_more/utils/custom_appbar.dart';
import 'package:we_save_more/utils/spacing.dart';
import 'package:we_save_more/widget/app_text.dart';
import '../../../../theme/app_colors.dart';
import '../data/support_response.dart';

class SupportScreen extends GetView<SupportController> {
     const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    final yellow = appColors.yellow;

    return Scaffold(
      appBar: CustomAppbar(
        title: "Informations",
        showLeft: false  ,
        leftIcon: GestureDetector(
          onTap: (){Get.back();},
            child: Icon(Icons.arrow_back, color: theme.colorScheme.onPrimary)),
      ),

      body: SingleChildScrollView(
        child: Obx(
           () =>  Column(
            children: [
              Spacing.h24,

              /// CONTACT US BUTTON
              Center(
                child: Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                    color: yellow,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: AppText(
                      "Contact Us",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              Spacing.h24,

              _mainContactCard(
                context,
                "Customer Care",
                "assets/svg/customer-service.svg",
                controller.supportData.value,
              ),
              _mainContactCard(
                context,
                "Payment History",
                "assets/svg/payment_enquiry.svg",
                controller.supportData.value,
              ),
              _socialCard(
                iconPath: "assets/icons/instagram.png",
                title: "Instagram",
                subtitle: "Follow us",
                url: controller.supportData.value?.instagram,
              ),

              _socialCard(
                iconPath: "assets/icons/twitter.png",
                title: "Twitter",
                subtitle: "Follow us",
                url: controller.supportData.value?.twitter,
              ),

              if (controller.hasAddress)
                _socialCard(
                  iconPath: "assets/icons/home.png",
                  title: "Address",
                  subtitle:
                      controller.supportData.value!.address ??
                      "10/532 Indira Nagar",
                ),

              Spacing.h24,

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText("You Agree to Our"),
                  Spacing.w4,
                  AppText("Privacy Policy", decoration: TextDecoration.underline),
                ],
              ),

              Spacing.h36,

              /// Toll Free Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  customInfoButton(icon: Icons.phone, title: "Mobile TollFree"),
                  customInfoButton(
                    icon: Icons.phone,
                    title: "DTH TollFree",
                    backgroundColor: yellow,
                  ),
                ],
              ),

              Spacing.h36,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  customInfoButton(icon: Icons.message, title: "Ticket List"),
                  customInfoButton(
                    icon: Icons.add_circle,
                    title: "Create Ticket",
                    backgroundColor: yellow,
                  ),
                ],
              ),

              Spacing.h120,
            ],
          ),
        ),
      ),
    );
  }


     /// MAIN CONTACT CARD
     Widget _mainContactCard(
         BuildContext context,
         String title,
         String iconPath,
         CompanyProfileResponse? data,
         ) {
       final theme = Theme.of(context);
       final yellow = appColors.yellow;
       return Padding(
         padding: const EdgeInsets.all(8.0),
         child: Container(
           width: double.infinity,
           padding: const EdgeInsets.all(15),
           decoration: BoxDecoration(
             color: theme.colorScheme.surface,
             border: Border.all(color: yellow, width: 2),
             borderRadius: BorderRadius.circular(8),
             boxShadow: [
               BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
             ],
           ),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Row(
                 children: [
                   SvgPicture.asset(
                     iconPath,
                     height: 30,
                     width: 30,
                   ),
                   Spacing.w8,
                   AppText(title, fontSize: 18, fontWeight: FontWeight.bold),
                 ],
               ),

               _sectionTitle("Call Us", "assets/svg/call.svg"),

               /// CALL 1
               if ((data?.customerCareMobileNos ?? "").trim().isNotEmpty)
                 _contactRow(data?.customerCareMobileNos??"", "assets/svg/phone.svg", 1),

               /// CALL 2
               if ((data?.customerPhoneNos ?? "").trim().isNotEmpty)
                 _contactRow(data?.customerPhoneNos??"", "assets/svg/telephone.svg", 2),

               _sectionTitle("Whatsapp", "assets/svg/whatsapp_icon.svg"),
               // WHATSAPP
               if ((data?.customerWhatsAppNos ?? "").trim().isNotEmpty)
                 _contactRow(
                   data?.customerWhatsAppNos??"",
                   "assets/svg/whatsapp-svgrepo-com.svg",
                   3,
                 ),

               _sectionTitle("Email", "assets/svg/email-svgrepo-com.svg"),

               /// EMAIL
               if ((data?.customerCareEmailIds ?? "").trim().isNotEmpty)
                 _contactRow(data?.customerCareEmailIds??"", "assets/svg/email.svg", 4),
             ],
           ),
         ),
       );
     }

     Widget _sectionTitle(String title, String svgPath) {
       return Padding(
         padding: const EdgeInsets.only(left: 28.0, top: 12),
         child: Row(
           children: [
             SvgPicture.asset(svgPath, height: 24, width: 24),
             SizedBox(width: 8),
             Text(
               title,
               style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
             ),
           ],
         ),
       );
     }

     Widget _contactRow(String text, String iconPath, int type) {
       return Padding(
         padding: const EdgeInsets.only(left: 28, top: 6, bottom: 6),
         child: InkWell(
           onTap: () => controller.handleContactTap(type, text),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text(
                 text,
                 style: TextStyle(
                   color: appColors.primaryColor,
                   fontSize: 14,
                   fontWeight: FontWeight.w600,
                 ),
               ),
               SvgPicture.asset(iconPath, height: 24, width: 24),
             ],
           ),
         ),
       );
     }

     /// SOCIAL CARD
     Widget _socialCard({
       required String iconPath,
       required String title,
       required String subtitle,
       String? url,
     }) {
       return Padding(
         padding: const EdgeInsets.all(8.0),
         child: Container(
           width: double.infinity,
           padding: const EdgeInsets.all(15),
           decoration: BoxDecoration(
             color: Colors.white,
             border: Border.all(color: Colors.yellow, width: 2),
             borderRadius: BorderRadius.circular(8),
             boxShadow: [
               BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
             ],
           ),
           child: Row(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Image.asset(iconPath, height: 35),
               SizedBox(width: 12),

               Expanded(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     AppText(title, fontSize: 18, fontWeight: FontWeight.w600),
                     SizedBox(height: 4),
                     InkWell(
                       onTap: () {
                         if (url != null && url.trim().isNotEmpty) {
                           launchUrl(Uri.parse(url));
                         }
                       },
                       child: AppText(
                         subtitle,
                         decoration: TextDecoration.underline,
                         fontWeight: FontWeight.w800,
                         color: appColors.primaryColor,
                         fontSize: 17,
                       ),
                     ),
                   ],
                 ),
               ),
             ],
           ),
         ),
       );
     }

     /// REUSABLE INFO BUTTON
     Widget customInfoButton({
       required IconData icon,
       required String title,
       Color? backgroundColor,
       double width = 160,
       double height = 48,
     }) {
       final bg = backgroundColor ?? appColors.primaryColor;
       return Container(
         width: width,
         height: height,
         padding: const EdgeInsets.symmetric(horizontal: 12),
         decoration: BoxDecoration(
           color: bg,
           borderRadius: BorderRadius.circular(6),
           boxShadow: [
             BoxShadow(
               color: Colors.black12,
               blurRadius: 6,
               spreadRadius: 1,
               offset: Offset(0, 3),
             ),
           ],
         ),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Icon(icon, color: Colors.white, size: 20),
             SizedBox(width: 6),
             Flexible(
               child: Text(
                 title,
                 style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                 maxLines: 1,
                 overflow: TextOverflow.ellipsis,
               ),
             ),
           ],
         ),
       );
     }

}
