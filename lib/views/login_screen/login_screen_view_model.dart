import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:jaldi/core/logger.dart';

class LoginScreenViewModel extends BaseViewModel {
  late Logger log;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = false;
  Color loginButtonColor = Color(0xFFF8CD3A);
  Color loginButtonTextColor = Colors.black;

  LoginScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }

  toggleObscureText() {
    obscureText = !obscureText;
    notifyListeners();
  }

  toggleButtonColor(bool value) {
    if (value) {
      loginButtonColor = const Color.fromARGB(255, 0, 77, 140);
      loginButtonTextColor = Colors.white;
    } else {
      loginButtonColor = Color(0xFFF8CD3A);
      loginButtonTextColor = Colors.black;
    }

    notifyListeners();
  }
}
