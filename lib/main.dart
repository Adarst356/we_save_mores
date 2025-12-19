import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:we_save_more/modules/splash/splash_screen.dart';
import 'package:we_save_more/routes/app_pages.dart';
import 'package:we_save_more/routes/app_routes.dart';
import 'package:we_save_more/theme/d.dart';
import 'package:we_save_more/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
/*    final theme=MaterialTheme(context.textTheme);*/
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'We Save More',
    /*  theme: lightTheme,
      darkTheme: theme.dark(),*/
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.splash,
      getPages:  AppPages.routes,
    );
  }
}

