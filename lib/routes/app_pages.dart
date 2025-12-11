import 'package:get/get.dart';
import 'package:we_save_more/modules/auth/change_password/view/change_pass_controller.dart';
import 'package:we_save_more/modules/auth/change_password/view/change_pass_screen.dart';
import 'package:we_save_more/modules/auth/change_pin/change_pin_screen.dart';
import 'package:we_save_more/modules/auth/forgotPassword/view/forgot_pass.dart';
import 'package:we_save_more/modules/auth/forgotPassword/view/forgot_pass_controller.dart';
import 'package:we_save_more/modules/auth/login/view/login_controller.dart';
import 'package:we_save_more/modules/auth/login/view/login_screen.dart';
import 'package:we_save_more/modules/auth/signup/view/signup_controller.dart';
import 'package:we_save_more/modules/auth/signup/view/signup_screen.dart';
import 'package:we_save_more/modules/dashboard/drawer/view/side_drawer_screen.dart';

import 'package:we_save_more/modules/dashboard/reports/view/userDayBookReport/user_day_book_controller.dart';
import 'package:we_save_more/modules/dashboard/reports/view/userDayBookReport/user_day_book_screen.dart';

import 'package:we_save_more/modules/dashboard/reports/view/ledgerReport/ledger_report_screen.dart';
import 'package:we_save_more/modules/dashboard/main_nav/main_nav.dart';
import 'package:we_save_more/modules/dashboard/notification/notification_screen.dart';
import 'package:we_save_more/modules/dashboard/profile/view/balance_controller.dart';
import 'package:we_save_more/modules/dashboard/profile/view/profile_controller.dart';
import 'package:we_save_more/modules/dashboard/profile/view/profile_screen.dart';
import 'package:we_save_more/modules/dashboard/profile/view/update_profile_controller.dart';
import 'package:we_save_more/modules/dashboard/reports/view/rechargeReport/report_screen.dart';
import 'package:we_save_more/modules/dashboard/reports/view/shareReport/share_success_report.dart';
import '../modules/auth/change_pin/chnage_pin_controller.dart';
import '../modules/dashboard/drawer/view/side_drawer_controller.dart';
import '../modules/dashboard/home/view/add_money/add_money_controller.dart';
import '../modules/dashboard/home/view/add_money/add_money_screen.dart';
import '../modules/dashboard/home/view/billpayment_view/bill_payment_controller.dart';
import '../modules/dashboard/home/view/billpayment_view/bill_payment_screen.dart';
import '../modules/dashboard/home/view/home/banner_controller.dart';
import '../modules/dashboard/home/view/home/home_controller.dart';
import '../modules/dashboard/home/view/home/home_screen.dart';

import '../modules/dashboard/home/view/reward/redeem_card_controller.dart';
import '../modules/dashboard/home/view/reward/redeem_card_screen.dart';
import '../modules/dashboard/inviteReferral/view/refers_controller.dart';
import '../modules/dashboard/inviteReferral/view/refers_screen.dart';
import '../modules/dashboard/reports/view/ledgerReport/ledger_report_controller.dart';
import '../modules/dashboard/main_nav/main_nav_controller.dart';
import '../modules/dashboard/notification/notification_controller.dart';
import '../modules/dashboard/profile/view/update_profile_screen.dart';
import '../modules/dashboard/reports/view/rechargeReport/report_controller.dart';
import '../modules/dashboard/support/view/support_controller.dart';
import '../modules/dashboard/support/view/support_screen.dart';
import '../modules/splash/splash_screen.dart';
import '../modules/splash/splash_controller.dart';
import '../modules/onboarding/onboarding_screen.dart';
import '../modules/onboarding/onboarding_controller.dart';
import '../routes/app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SplashController>(() => SplashController());
      }),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<OnboardingController>(() => OnboardingController());
      }),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<LoginController>(() => LoginController());
      }),
    ),
    GetPage(
      name: AppRoutes.signUp,
      page: () => SignupScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SignupController>(() => SignupController());
      }),
    ),
    GetPage(
      name: AppRoutes.forgotPass,
      page: () => ForgotPass(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ForgotPassController>(() => ForgotPassController());
      }),
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => HomeScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<HomeController>(() => HomeController());
      }),
    ),
    GetPage(
      name: AppRoutes.notification,
      page: () => NotificationScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<NotificationController>(() => NotificationController());
      }),
    ),
    GetPage(
      name: AppRoutes.bottomNav,
      page: () => MainNav(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SupportController>(() => SupportController());
        Get.lazyPut<ReportController>(() => ReportController());
        Get.lazyPut<ReferralController>(() => ReferralController());
        Get.lazyPut<ProfileController>(() => ProfileController());
        Get.lazyPut<MainNavigationController>(() => MainNavigationController());
        Get.lazyPut<BannerController>(() => BannerController());
      }),
    ),
    GetPage(
      name: AppRoutes.referral,
      page: () => RefersScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ReferralController>(() => ReferralController());
      }),
    ),
    GetPage(
      name: AppRoutes.supportPage,
      page: () => SupportScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SupportController>(() => SupportController());
      }),
    ),
    GetPage(
      name: AppRoutes.report,
      page: () => ReportScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ReportController>(() => ReportController());
      }),
    ),
    GetPage(
      name: AppRoutes.sideDrawer,
      page: () => SideDrawer(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SideDrawerController>(() => SideDrawerController());
      }),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfileScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ProfileController>(() => ProfileController());
      }),
    ),
    GetPage(
      name: AppRoutes.notification,
      page: () => NotificationScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<NotificationController>(() => NotificationController());
      }),
    ),
    GetPage(
      name: AppRoutes.changePassword,
      page: () => ChangePassScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ChangePassController>(() => ChangePassController());
      }),
    ),
    GetPage(
      name: AppRoutes.changePin,
      page: () => ChangePinScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ChangePinController>(() => ChangePinController());
      }),
    ),
    GetPage(
      name: AppRoutes.updateProfile,
      page: () => UpdateProfileScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<UpdateProfileController>(() => UpdateProfileController());
      }),
    ),
    GetPage(
      name: AppRoutes.addMoney,
      page: () => AddMoneyScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AddMoneyController>(() => AddMoneyController());
        Get.lazyPut<BalanceController>(() => BalanceController());
      }),
    ),
    GetPage(
      name: AppRoutes.userDayBook,
      page: () => UserDayBookScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<UserDayBookController>(() => UserDayBookController());
      }),
    ),
    GetPage(
      name: AppRoutes.walletHistory,
      page: () => WalletHistoryScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<WalletHistoryController>(() => WalletHistoryController());
      }),
    ),
    GetPage(
      name: AppRoutes.redeemCard,
      page: () => RedeemCardScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<RedeemCardController>(() => RedeemCardController());
      }),
    ),
    GetPage(name: AppRoutes.shareReport, page: () => RechargeSuccessScreen()),
    GetPage(
      name: AppRoutes.billPayment,
      page: () => BillPaymentScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<BillPaymentController>(() => BillPaymentController());
      }),
    ),
  ];
}
