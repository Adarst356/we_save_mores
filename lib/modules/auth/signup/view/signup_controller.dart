import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:we_save_more/routes/app_routes.dart';
import '../../../../api/ui_state.dart';
import '../../../../utils/app_toast.dart';
import '../data/signup_response.dart';
import '../data/signup_repo.dart';

class SignupController extends GetxController {
  final signupFormKey  = GlobalKey<FormState>();
  final repo = SignupRepo();
  final box = GetStorage();

  /// Text Controllers
  final nameController = TextEditingController();
  final mobileController  = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final signupState = Rx<UiState<SignupResponse>>(UiState.none());

  ///Error messages (reactive)
  var nameError = RxnString();
  var mobileError = RxnString();
  var emailError = RxnString();
  var passwordError = RxnString();

  /// Password visibility
  RxBool obscureText = true.obs;

  /// --- Validation Functions ---
  void validateName(String value) {
    if (value.isEmpty) {
      nameError.value = "Please enter your name";
    } else if (value.length < 3) {
      nameError.value = "Name must be at least 3 characters";
    } else {
      nameError.value = null;
    }
  }

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

  void validateEmail(String value) {
    if (value.isEmpty) {
      emailError.value = "Please enter your email";
    } else if (!RegExp(r'^[\w\.-]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      emailError.value = "Enter a valid email address";
    } else {
      emailError.value = null;
    }
  }

  void validatePassword(String value) {
    if (value.isEmpty) {
      passwordError.value = "Please enter password";
    } else if (value.length < 6) {
      passwordError.value = "Password min at least 6 characters";
    } else {
      passwordError.value = null;
    }
  }

  /// --- Master Validation before Signup ---
  bool validateForm() {
    validateName(nameController.text);
    validateMobile(mobileController.text);
    validateEmail(emailController.text);
    validatePassword(passwordController.text);

    if (nameError.value == null &&
        mobileError.value == null &&
        emailError.value == null &&
        passwordError.value == null) {
      return true;
    } else {
      Fluttertoast.showToast(
        msg: "Please correct all fields before continuing",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.orange.shade400,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return false;
    }
  }

  /// --- Signup Call ---
  void signup() {
    if (!validateForm()) return; // stop if invalid

    repo.signupUser(
      {
        "address": "Gomati Nagar",
        "emailID": emailController.text.trim(),
        "mobileNo": mobileController.text.trim(),
        "name": nameController.text.trim(),
        "password": passwordController.text.trim(),
        "pincode": "226010",
        "referralNo": "",
        "roleID": 0,
      },
      callback: (state) {
        signupState.value = state;

        state.when(
          loading: () {
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
          success: (data) {
            if (Get.isDialogOpen == true) Get.back();
            if (data.statuscode == 1) {
              CommonToast.showToastSuccess(data.msg ?? "Signup Successfully");
              Get.offAllNamed(AppRoutes.login);
            } else {
              CommonToast.showToastError(data.msg ?? "Signup failed");
            }
          },
          error: (msg) {
            if (Get.isDialogOpen == true) Get.back();
            CommonToast.showToastError(msg);
          },
          none: () {},
        );
      },
    );
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
