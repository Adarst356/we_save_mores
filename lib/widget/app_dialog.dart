import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDialog {
  static void show({
    String? title,
    String? message,

    // Icon/Image Options
    IconData? icon,
    String? imagePath,
    Widget? customWidget,
    Color? iconColor,
    Color? iconBackgroundColor,
    double? iconSize,

    // Primary Button
    String? primaryButtonText,
    Color? primaryButtonColor,
    Color? primaryButtonTextColor,
    VoidCallback? onPrimaryPressed,
    double? primaryButtonWidth,
    double? primaryButtonHeight,

    // Secondary Button
    String? secondaryButtonText,
    Color? secondaryButtonColor,
    Color? secondaryButtonTextColor,
    VoidCallback? onSecondaryPressed,
    double? secondaryButtonWidth,
    double? secondaryButtonHeight,

    // Dialog Options
    bool showCloseButton = true,
    double? dialogWidth,
    bool barrierDismissible = true,

    // Text Styling
    TextStyle? titleStyle,
    TextStyle? messageStyle,
    double? contentPadding,
  }) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          width: dialogWidth ?? Get.width * 0.85,
          constraints: BoxConstraints(
            maxWidth: dialogWidth ?? Get.width * 0.85,
            maxHeight: Get.height * 0.8,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showCloseButton)
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.close,
                            size: 20,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),

                SizedBox(height: showCloseButton ? 0 : 20),

                Column(
                  children: [
                    if (customWidget != null)
                      Padding(
                        padding: EdgeInsets.all(contentPadding ?? 16),
                        child: customWidget,
                      ),

                    if (imagePath != null)
                      Padding(
                        padding: EdgeInsets.all(contentPadding ?? 16),
                        child: Image.asset(
                          imagePath,
                          height: iconSize ?? 80,
                          width: iconSize ?? 80,
                          fit: BoxFit.contain,
                        ),
                      ),

                    if (icon != null)
                      Container(
                        margin: EdgeInsets.only(top: 8, bottom: 8),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: iconBackgroundColor ?? Colors.orange.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          icon,
                          size: iconSize ?? 48,
                          color: iconColor ?? Colors.orange,
                        ),
                      ),
                  ],
                ),


                if (title != null) ...[
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      title,
                      style: titleStyle ??
                          const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4A148C),
                          ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],

                if (message != null) ...[
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      message,
                      style: messageStyle ??
                          const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            height: 1.5,
                          ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],

                const SizedBox(height: 24),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: _buildButtons(
                    primaryButtonText: primaryButtonText,
                    primaryButtonColor: primaryButtonColor,
                    primaryButtonTextColor: primaryButtonTextColor,
                    onPrimaryPressed: onPrimaryPressed,
                    primaryButtonWidth: primaryButtonWidth,
                    primaryButtonHeight: primaryButtonHeight,
                    secondaryButtonText: secondaryButtonText,
                    secondaryButtonColor: secondaryButtonColor,
                    secondaryButtonTextColor: secondaryButtonTextColor,
                    onSecondaryPressed: onSecondaryPressed,
                    secondaryButtonWidth: secondaryButtonWidth,
                    secondaryButtonHeight: secondaryButtonHeight,
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  static Widget _buildButtons({
    String? primaryButtonText,
    Color? primaryButtonColor,
    Color? primaryButtonTextColor,
    VoidCallback? onPrimaryPressed,
    double? primaryButtonWidth,
    double? primaryButtonHeight,
    String? secondaryButtonText,
    Color? secondaryButtonColor,
    Color? secondaryButtonTextColor,
    VoidCallback? onSecondaryPressed,
    double? secondaryButtonWidth,
    double? secondaryButtonHeight,
  }) {
    final bool hasBothButtons = primaryButtonText != null && secondaryButtonText != null;
    final double defaultHeight = 45;

    if (hasBothButtons) {
      return Row(
        children: [
          Flexible(
            child: SizedBox(
              width: secondaryButtonWidth,
              height: secondaryButtonHeight ?? defaultHeight,
              child: OutlinedButton(
                onPressed: () {
                  Get.back();
                  if (onSecondaryPressed != null) {
                    onSecondaryPressed();
                  }
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: secondaryButtonColor ?? Colors.grey,
                    width: 1.5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    secondaryButtonText,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: secondaryButtonTextColor ?? Colors.grey[700],
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Flexible(
            child: SizedBox(
              width: primaryButtonWidth,
              height: primaryButtonHeight ?? defaultHeight,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                  if (onPrimaryPressed != null) {
                    onPrimaryPressed();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryButtonColor ?? const Color(0xFFFFA726),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    primaryButtonText,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: primaryButtonTextColor ?? Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }

    if (primaryButtonText != null) {
      return Center(
        child: SizedBox(
          width: primaryButtonWidth ?? 180,
          height: primaryButtonHeight ?? defaultHeight,
          child: ElevatedButton(
            onPressed: () {
              Get.back();
              if (onPrimaryPressed != null) {
                onPrimaryPressed();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryButtonColor ?? const Color(0xFFFFA726),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                primaryButtonText,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: primaryButtonTextColor ?? Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      );
    }

    if (secondaryButtonText != null) {
      return Center(
        child: SizedBox(
          width: secondaryButtonWidth ?? 180,
          height: secondaryButtonHeight ?? defaultHeight,
          child: OutlinedButton(
            onPressed: () {
              Get.back();
              if (onSecondaryPressed != null) {
                onSecondaryPressed();
              }
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: secondaryButtonColor ?? Colors.grey,
                width: 1.5,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                secondaryButtonText,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: secondaryButtonTextColor ?? Colors.grey[700],
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}