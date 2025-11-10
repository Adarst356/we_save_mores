import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_save_more/modules/splash/splash_controller.dart';
class SplashScreen extends GetView<SplashController> {
    const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplashController>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back_splash.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: Colors.black.withOpacity(0.2),
            ),
            Image.asset(
              'assets/images/app_logo.png',
              height: size.height * 0.25,
              width: size.width * 0.50,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
