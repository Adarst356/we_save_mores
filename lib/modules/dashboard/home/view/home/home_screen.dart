import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:we_save_more/modules/dashboard/main_nav/main_nav_controller.dart';
import 'package:we_save_more/routes/app_routes.dart';
import 'package:we_save_more/utils/spacing.dart';
import 'package:we_save_more/widget/app_text.dart';
import '../../../../../theme/app_colors.dart';
import '../../../drawer/view/side_drawer_screen.dart';
import '../../../notification/notification_controller.dart';
import '../../../profile/view/balance_controller.dart';
import '../../../profile/view/profile_controller.dart';
import '../../home_appbar/home_appbar.dart';
import '../news/news_widget.dart';
import 'banner_controller.dart';
import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  final box = GetStorage();

  HomeScreen({super.key});

  final profileController = Get.put(ProfileController());
  final balanceController = Get.put(BalanceController());
  final homeController = Get.put(HomeController());
  final notificationController = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    final role = box.read('role') ?? 'Customer';

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: SideDrawer(),

      /// ======= APPBAR =======
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: Obx(() {
          return CustomAppbarFlutter(
            userName: profileController.profileData.value?.name ?? "",
            role: role,
            mobileNumber: profileController.profileData.value?.mobileNo ?? "",
            profileImage: profileController.profileData.value?.profilePic,
            leftWidget: Builder(
              builder: (context) => GestureDetector(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: SvgPicture.asset(
                  "assets/svg/menu-fries-svgrepo-com.svg",
                  width: 28,
                  height: 28,
                  color: Colors.white,
                ),
              ),
            ),
            rightWidget: Row(
              children: [
                /// WHATSAPP ICON
                GestureDetector(
                  onTap: () {
                    final mobile =
                        profileController.profileData.value?.mobileNo ?? "";
                    final whatsapp = "https://wa.me/91$mobile";
                    launchUrl(
                      Uri.parse(whatsapp),
                      mode: LaunchMode.externalApplication,
                    );
                  },
                  child: SvgPicture.asset(
                    "assets/svg/whatsapp-svgrepo-com.svg",
                    width: 26,
                    height: 26,
                  ),
                ),
                Spacing.w10,

                /// REFRESH ICON
                GestureDetector(
                  onTap: () {
                    profileController.getProfile();
                    Get.snackbar(
                      "Refreshing...",
                      "Profile data updated",
                      snackPosition: SnackPosition.TOP,
                    );
                  },
                  child: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
                Spacing.w10,

                /// NOTIFICATION ICON
                // Replace your notification icon with this:
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.notification);
                      },
                      child: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),

                    // Badge indicator
                    Obx(() {
                      final count = notificationController.notificationCount.value;
                      if (count == 0) return const SizedBox();

                      return Positioned(
                        right: -2,
                        top: -2,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1.5),
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 18,
                            minHeight: 18,
                          ),
                          child: Center(
                            child: Text(
                              count > 99 ? '99+' : count.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ],
            ),
            onTapAvatar: () {
              Get.toNamed(AppRoutes.profile);
            },
          );
        }),
      ),

      /// ======= BODY STARTS =======
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// ======= WALLET BOX =======
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 110,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
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
                    const SizedBox(width: 15),
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
                        const AppText(
                          "PREPAID WALLET",
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Obx(
                                () => AppText(
                              '₹ ${balanceController.balance.value.toStringAsFixed(2)}',
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            /// ======= LATEST NEWS - NOW USING API =======
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LatestNewsWidget(),
            ),

            /// ======= MAIN CONTENT =======
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  /// ======= QUICK ACTIONS (Add Money etc) =======
                  Container(
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
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.addMoney);
                            },
                            child: serviceCircularItem("Add \nMoney", Icons.add),
                          ),
                          serviceCircularItem("Send\nMoney", Icons.send),
                          GestureDetector(
                            onTap: (){Get.find<MainNavigationController>().selectedIndex.value = 3;},
                            child: serviceCircularItem(
                              "Transaction Report",
                              Icons.receipt_long,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.walletHistory);
                            },
                            child: serviceCircularItem(
                              "Wallet History",
                              Icons.account_balance_wallet,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Spacing.h12,

                  /// ======= OUR SERVICES CARD =======
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Title Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const AppText(
                              "Our Services",
                              fontSize: 21,
                              fontWeight: FontWeight.w900,
                            ),
                            SvgPicture.asset(
                              "assets/svg/youtube.svg",
                              height: 62,
                            ),
                          ],
                        ),
                        Spacing.h10,

                        /// GRID
                        Obx(
                              () => homeController.GetOpTypeState.value.when(
                            success: (getOpTypes) {
                              final assignedList =
                                  getOpTypes.data?.assignedOpTypes ?? [];
                              final activeServices = assignedList
                                  .where((service) =>
                              service.isActive == true &&
                                  service.isServiceActive == true)
                                  .toList();
                              return GridView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 90,
                                  childAspectRatio: 0.80,
                                ),
                                itemCount: activeServices.length,
                                itemBuilder: (context, index) {
                                  final service = activeServices[index];
                                  return serviceItem(
                                    service.name ?? "Service",
                                    iconPath: getServiceIconSvg(
                                      service.name ?? "",
                                    ),
                                    onTap: () => handleServiceTap(
                                      service.serviceId as int?,
                                      service.name ?? "",
                                    ),
                                  );
                                },
                              );
                            },
                            error: (msg) => Text(msg),
                            loading: () =>
                                Center(child: CircularProgressIndicator()),
                            none: () => SizedBox(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacing.h10,

                  /// ======= OTHER SERVICES CARD =======
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AppText(
                            "Other Services",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.referral);
                                },
                                child: otherServiceItem(
                                  "Refer\nEarn",
                                  "assets/lottie/referral.json",
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.userDayBook);
                                },
                                child: otherServiceItem(
                                  "Total\nCommission",
                                  "assets/lottie/Growth.json",
                                ),
                              ),
                              otherServiceItem(
                                "Spin\nEarn",
                                "assets/lottie/spin_earn.json",
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.redeemCard);
                                },
                                child: otherServiceItem(
                                  "Scratch\nCard",
                                  "assets/images/scratch.gif",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// ======= BOTTOM BANNER =======
                  Obx(
                        () => BannerController.to.bannerState.value.when(
                      success: (data) {
                        return Padding(
                          padding: const EdgeInsets.all(15),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.network(
                              (data.bannerUrl?.first.resourceUrl).toString(),
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      error: (msg) => Text(msg),
                      loading: () => CircularProgressIndicator(),
                      none: () => SizedBox(),
                    ),
                  ),
                ],
              ),
            ),

            Spacing.h100,
          ],
        ),
      ),
    );
  }

  /// ======= HANDLE SERVICE TAP - UPDATED LOGIC =======
  void handleServiceTap(int? serviceId, String serviceName) async {
    if (serviceId == null) return;

    final normalizedName = serviceName.toLowerCase().trim();

    // Check if service is DTH or Prepaid
    bool isPrepaid = normalizedName.contains('prepaid');
    bool isDTH = normalizedName.contains('dth');

    if (isPrepaid || isDTH) {
      // Go directly to BillPaymentScreen
      Get.toNamed(
        AppRoutes.billPayment,
        arguments: {
          "serviceId": serviceId,
          "serviceName": serviceName,
          "providerId": null,
          "providerName": null,
          "providerImage": null,
        },
      );
    } else {
      // For other services: First show Select Provider screen
      final result = await Get.toNamed(
        AppRoutes.serviceOperator,
        arguments: {
          "serviceId": serviceId,
          "serviceName": serviceName,
        },
      );

      // After selecting provider, navigate to Bill Payment
      if (result != null) {
        Get.toNamed(
          AppRoutes.billPayment,
          arguments: {
            "serviceId": serviceId,
            "serviceName": serviceName,
            "providerId": result["providerId"],
            "providerName": result["providerName"],
            "providerImage": result["providerImage"],
          },
        );
      }
    }
  }

  String getServiceIconSvg(String serviceName) {
    String name = serviceName.toLowerCase().trim();
    return "assets/svg/$name.svg";
  }

  /// WIDGET HELPERS
  Widget serviceCircularItem(String title, IconData icon) {
    return Column(
      children: [
        Container(
          height: 55,
          width: 55,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Icon(icon, size: 28, color: Colors.black87),
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: 70,
          child: AppText(
            title,
            align: TextAlign.center,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget serviceItem(
      String title, {
        required String iconPath,
        Function()? onTap,
      }) {
    final isSvg = iconPath.toLowerCase().endsWith(".svg");

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            child: isSvg
                ? SvgPicture.asset(iconPath, height: 35, width: 35)
                : Image.asset(iconPath, height: 35, width: 35),
          ),
          const SizedBox(height: 5),
          AppText(
            title,
            align: TextAlign.center,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }

  Widget otherServiceItem(String title, dynamic iconPath) {
    const double iconSize = 65;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          child: SizedBox(
            height: iconSize,
            width: iconSize,
            child: _buildIcon(iconPath),
          ),
        ),
        const SizedBox(height: 6),
        AppText(
          title,
          align: TextAlign.center,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }

  Widget _buildIcon(dynamic icon) {
    if (icon is IconData) {
      return Icon(icon, size: 50);
    } else if (icon is String && icon.endsWith(".svg")) {
      return SvgPicture.asset(icon, fit: BoxFit.contain);
    } else if (icon is String && icon.endsWith(".json")) {
      return Lottie.asset(icon, fit: BoxFit.contain);
    } else if (icon is String) {
      return Image.asset(icon, fit: BoxFit.contain);
    }

    return const SizedBox();
  }
}