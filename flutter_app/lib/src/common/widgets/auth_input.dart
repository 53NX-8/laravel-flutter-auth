import 'package:flutter/material.dart';

class AuthInput extends StatelessWidget {
  final TextEditingController controller;
  final bool isPassword;
  final String label;
  final Icon prefixIcon;

  const AuthInput({
    super.key,
    required this.controller,
    this.isPassword = false,
    required this.prefixIcon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        labelText: label,
      ),
    );
  }
}
