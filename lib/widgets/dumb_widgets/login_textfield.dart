import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String hintText;
  final IconButton? suffixIcon;
  final TextEditingController controller;
  final bool obscureText;
  LoginTextField(
      {Key? key,
      required this.hintText,
      this.suffixIcon,
      required this.controller,
      required this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
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
