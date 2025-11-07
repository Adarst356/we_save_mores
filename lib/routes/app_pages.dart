import 'package:get/get.dart';
import 'package:we_save_more/modules/auth/forgotPassword/view/forgot_pass.dart';
import 'package:we_save_more/modules/auth/forgotPassword/view/forgot_pass_controller.dart';
import 'package:we_save_more/modules/auth/login/view/login_controller.dart';
import 'package:we_save_more/modules/auth/login/view/login_screen.dart';
import 'package:we_save_more/modules/auth/signup/view/signup_controller.dart';
import 'package:we_save_more/modules/auth/signup/view/signup_screen.dart';
import 'package:we_save_more/modules/dashboards/dashboard_screen.dart';
import '../modules/splash/view/splash_screen.dart';
import '../modules/splash/view/splash_controller.dart';
import '../modules/onboarding/view/onboarding_screen.dart';
import '../modules/onboarding/view/onboarding_controller.dart';
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
      page: () => const ForgotPass(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ForgotPassController>(() => ForgotPassController());
      }),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => const DashboardScreen(),

    ),

  ];
}
