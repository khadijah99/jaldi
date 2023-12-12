import 'package:flutter/material.dart';
import '../constants/config.dart';

@immutable
class ApiEndpoint {
  const ApiEndpoint._();

  static const baseUrl = Config.baseUrl;

  static String authentication({required Auth endpoint, String? payload}) {
    switch (endpoint) {
      case Auth.LOGIN:
        return '/auth/login';

      default:
        return '/auth/login';
    }
  }
}

/// A collection of endpoints used for getting movies purposes.
enum Auth { LOGIN }
