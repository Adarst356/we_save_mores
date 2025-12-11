import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../routes/app_routes.dart';

class SplashController extends GetxController {
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    _goToNextScreen();
  }

  void _goToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));

    bool isLoggedIn = box.read('isLoggedIn') ?? false;

    if (isLoggedIn) {
      ///  If user already logged in → go to home
      Get.offAllNamed(AppRoutes.bottomNav);
    } else {
      /// Otherwise → go to onboarding/login
      Get.offAllNamed(AppRoutes.onboarding);
    }
  }
}
