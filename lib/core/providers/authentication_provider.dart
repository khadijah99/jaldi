import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jaldi/core/constants/end_points.dart';
import 'package:jaldi/core/models/authenticated_user.dart';
import 'package:jaldi/core/models/error_message.dart';
import 'package:jaldi/core/services/api_service.dart';

import '../base/sealed_class.dart';
import '../locator.dart';
import 'dart:convert';

class AuthenticationProvider extends ChangeNotifier {
  final JaldiApiService _apiService = locator<JaldiApiService>();

  late Result<AuthenticatedUser, ErrorResponse>? user;
  bool isDataAvailable = false;
  bool isLoading = false;
  AuthenticationProvider({this.user});

  Future<void> login({required String email, required String password}) async {
    isLoading = true;
    notifyListeners();
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$email:$password'))}';
    final response = await _apiService.login(
        options: Options(method: 'POST', headers: {'Authorization': basicAuth}),
        endpoint: ApiEndpoint.authentication(endpoint: Auth.LOGIN));
    user = response;
    isLoading = false;
    notifyListeners();
  }

  logout() {
    user = null;
  }
}
