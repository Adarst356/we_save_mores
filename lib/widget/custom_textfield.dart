import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final VoidCallback? onSuffixTap;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final int? maxLength; // ✅ added for input limit
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.onSuffixTap,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLength: maxLength,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefixIcon,
          color: theme.primaryColor,
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
          onPressed: onSuffixTap,
          icon: Icon(
            suffixIcon,
            color: theme.primaryColor,
          ),
        )
            : null,
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        errorStyle: const TextStyle(
          color: Colors.red,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        counterText: "",
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: theme.primaryColor, width: 1.5),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
