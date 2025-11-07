import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final mobileController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool obscureText = true.obs;

  void validateForm() {
    if (formKey.currentState!.validate()) {

    }
  }

  @override
  void onClose() {
    mobileController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
