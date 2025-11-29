import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final RxBool obscureText;
  final Color? prefixIconColor;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  final Color? fillColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool showLabel;

  const CustomPasswordField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.labelText,
    this.prefixIconColor,
    this.focusedBorderColor,
    this.enabledBorderColor,
    this.fillColor,
    this.borderRadius,
    this.contentPadding,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.showLabel = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLabel && labelText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              labelText!,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
        Obx(
              () => TextField(
            controller: controller,
            obscureText: obscureText.value,
            keyboardType: keyboardType,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey[400]),
              prefixIcon: Icon(
                Icons.lock_outline,
                color: prefixIconColor ?? const Color(0xFF4A148C),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  obscureText.value ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey[600],
                ),
                onPressed: () {
                  obscureText.value = !obscureText.value;
                },
              ),
              filled: true,
              fillColor: fillColor ?? Colors.white,
              contentPadding: contentPadding,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 8),
                borderSide: BorderSide(
                  color: enabledBorderColor ?? Colors.grey[300]!,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 8),
                borderSide: BorderSide(
                  color: enabledBorderColor ?? Colors.grey[300]!,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 8),
                borderSide: BorderSide(
                  color: focusedBorderColor ?? const Color(0xFF4A148C),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 8),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 8),
                borderSide: const BorderSide(color: Colors.red, width: 2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}