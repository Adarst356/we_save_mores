// lib/widget/common_toast.dart
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../theme/app_colors.dart';

class CommonToast {
  static void _show(String message, {required Color backgroundColor}) {
    Fluttertoast.cancel(); // Avoid stacking multiple toasts
    Fluttertoast.showToast(
      msg: message.trim(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: backgroundColor.withOpacity(0.95),
      textColor: appColors.textLight,
      fontSize: 15.0,
    );
  }

  static void showToast(String message) {
    _show(message, backgroundColor: appColors.primaryColor);
  }

  static void showToastSuccess(String message) {
    _show(message, backgroundColor: appColors.success);
  }

  static void showToastError(String message) {
    _show(message, backgroundColor: appColors.error);
  }

  static void showToastWarning(String message) {
    _show(message, backgroundColor: appColors.warning);
  }
}
