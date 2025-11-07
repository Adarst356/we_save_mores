import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  /// Global key for form
  final formKey = GlobalKey<FormState>();

  /// Controllers for fields
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  /// Password visibility
  RxBool obscureText = true.obs;

  void validateForm() {
    formKey.currentState!.validate();
  }

  @override
  void onClose() {
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
