import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String hintText;
  final IconButton? suffixIcon;
  final TextEditingController controller;
  final String? errorMessage;
  final bool obscureText;
  const LoginTextField(
      {Key? key,
      required this.hintText,
      this.suffixIcon,
      required this.controller,
      required this.obscureText, this.errorMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          errorText: errorMessage,
            filled: true,
            fillColor: const Color(0xFFFAF8FE),
            border: InputBorder.none,
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE8E3FB)),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            hintText: hintText,
            suffixIcon: suffixIcon),
      ),
    );
  }
}
