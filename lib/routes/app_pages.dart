import 'package:get/get.dart';
import 'package:we_save_more/modules/auth/forgotPassword/view/forgot_pass.dart';
import 'package:we_save_more/modules/auth/forgotPassword/view/forgot_pass_controller.dart';
import 'package:we_save_more/modules/auth/login/view/login_controller.dart';
import 'package:we_save_more/modules/auth/login/view/login_screen.dart';
import 'package:we_save_more/modules/auth/signup/view/signup_controller.dart';
import 'package:we_save_more/modules/auth/signup/view/signup_screen.dart';
import 'package:we_save_more/modules/dashboard/home/home_screen.dart';
import 'package:we_save_more/modules/dashboard/main_nav/main_nav.dart';
import 'package:we_save_more/modules/dashboard/notification/notification_screen.dart';
import 'package:we_save_more/modules/dashboard/refers/view/refers_controller.dart';
import '../modules/dashboard/home/home_controller.dart';
import '../modules/dashboard/main_nav/main_nav_controller.dart';
import '../modules/dashboard/notification/notification_controller.dart';
import '../modules/dashboard/refers/view/refers_screen.dart';
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
      page: () =>  SplashScreen(),
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
      page: () =>  LoginScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<LoginController>(() => LoginController());
      }),
    ),
    GetPage(
      name: AppRoutes.signUp,
      page: () =>  SignupScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SignupController>(() => SignupController());
      }),
    ),
    GetPage(
      name: AppRoutes.forgotPass,
      page: () =>  ForgotPass(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ForgotPassController>(() => ForgotPassController());
      }),
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () =>  HomeScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<HomeController>(() => HomeController());
      }),
    ),
    GetPage(
      name: AppRoutes.notification,
      page: () =>  NotificationScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<NotificationController>(() => NotificationController());
      }),
    ),
    GetPage(
      name: AppRoutes.bottomNav,
      page: () =>  MainNav(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SupportController>(() => SupportController());
        Get.lazyPut<MainNavigationController>(() => MainNavigationController());
      }),
    ),
    GetPage(
      name: AppRoutes.referral,
      page: () =>  RefersScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ReferralController>(() => ReferralController());
      }),
    ),
    GetPage(
      name: AppRoutes.supportPage,
      page: () =>  SupportScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SupportController>(() => SupportController());
      }),
    ),
  ];
}
