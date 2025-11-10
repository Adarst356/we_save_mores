import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart' show Lottie;

import '../../../../api/ui_state.dart';
import '../data/signup_response.dart';
import '../data/signup_repo.dart';

class SignupController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final repo = SignupRepo();
  // Text Controllers
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final signupState = Rx<UiState<SignupResponse>>(UiState.none());


  // Error messages (reactive)
  var nameError = RxnString();
  var mobileError = RxnString();
  var emailError = RxnString();
  var passwordError = RxnString();

  /// Password visibility
  RxBool obscureText = true.obs;

  /// Name Validation
  void validateName(String value) {
    if (value.isEmpty) {
      nameError.value = "Please enter your name";
    } else if (value.length < 3) {
      nameError.value = "Name must be at least 3 characters";
    } else {
      nameError.value = null;
    }
  }

  ///Mobile Validation
  void validateMobile(String value) {
    if (value.isEmpty) {
      mobileError.value = "Please enter your mobile number";
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      mobileError.value = "Only digits allowed";
    } else if (value.length != 10) {
      mobileError.value = "Mobile number must be exactly 10 digits";
    } else {
      mobileError.value = null;
    }
  }

  /// Email Validation
  void validateEmail(String value) {
    if (value.isEmpty) {
      emailError.value = "Please enter your email";
    } else if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      emailError.value = "Enter a valid email address";
    } else {
      emailError.value = null;
    }
  }
  /// Real-time Password Validation
  void validatePassword(String value) {
    if (value.isEmpty) {
      passwordError.value = "Please enter Password";
    } else if (value.length < 6) {
      passwordError.value = "Password must be at least 6 characters";
    } else {
      passwordError.value = null;
    }
  }

  /// Form Submit
  void validateForm() {
    validateName(nameController.text);
    validateMobile(mobileController.text);
    validateEmail(emailController.text);
    validatePassword(passwordController.text);

    if (nameError.value == null &&
        mobileError.value == null &&
        emailError.value == null &&
        passwordError.value == null) {
      Get.snackbar("Success", "Signup successful!");
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void signup() {
    repo.signupUser({
      "address": "Gomati Nagar",
      "emailID": emailController.text.trim(),
      "mobileNo": mobileController.text.trim(),
      "name": nameController.text.trim(),
      "password": passwordController.text.trim(),
      "pincode": "226010",
      "referralNo": "",
      "roleID": 0,
    }, callback: (state) {  signupState.value = state;

      state.when(
        success: (data) {
          if (Get.isDialogOpen == true) Get.back();
          if (data.statuscode == 1) {
            Get.snackbar("Success", data.msg ?? "Signup successful",
                backgroundColor: Colors.green.shade100);
            Get.offAllNamed('/login');
          } else {
            Get.snackbar("Error", data.msg ?? "Signup failed",
                backgroundColor: Colors.red.shade100);
          }
        },
        error: (msg) {
          if (Get.isDialogOpen == true) Get.back();
          Get.snackbar("Error", msg, backgroundColor: Colors.red.shade100);
        },        loading: () {
          Get.dialog(
            Center(
              child: Lottie.asset(
                'assets/svg/Loading circles.json',
                width: 120,
                height: 120,
                fit: BoxFit.contain,
              ),
            ),
            barrierDismissible: false,
          );
        },

        none: () {},
      );
    });
  }
}
