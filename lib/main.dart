import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_save_more/modules/splash/splash_screen.dart';
import 'package:we_save_more/routes/app_pages.dart';
import 'package:we_save_more/routes/app_routes.dart';
import 'package:we_save_more/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'We Save More',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.splash,
      getPages:  AppPages.routes,
    );
  }
}

