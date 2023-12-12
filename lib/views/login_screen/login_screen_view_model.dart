// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:jaldi/core/base/sealed_class.dart';
import 'package:jaldi/core/models/error_message.dart';
import 'package:jaldi/core/providers/authentication_provider.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:jaldi/core/logger.dart';
import 'package:vrouter/vrouter.dart';

import '../../core/models/authenticated_user.dart';

class LoginScreenViewModel extends BaseViewModel {
  late Logger log;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = false;
  Color loginButtonColor = Color(0xFFF8CD3A);
  Color loginButtonTextColor = Colors.black;
  String? errorMessage;

  LoginScreenViewModel(context) {
    log = getLogger(runtimeType.toString());
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
      loginButtonColor = const Color(0xFFF8CD3A);
      loginButtonTextColor = Colors.black;
    }
    notifyListeners();
  }

  login(BuildContext context) async {
    await Provider.of<AuthenticationProvider>(context, listen: false)
        .login(email: emailController.text, password: passwordController.text);
    final response =
        Provider.of<AuthenticationProvider>(context, listen: false).user;
    if (response is Success<AuthenticatedUser, ErrorResponse>) {
      final data = response;
      context.vRouter.to("/leads");
    } else {
      final data = response as Failure<AuthenticatedUser, ErrorResponse>;
      errorMessage = data.exception.response!.message;
      print(data);
    }
    notifyListeners();
  }
}
