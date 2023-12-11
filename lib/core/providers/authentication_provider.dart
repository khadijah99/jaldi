import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jaldi/core/constants/end_points.dart';
import 'package:jaldi/core/models/authenticated_user.dart';
import 'package:jaldi/core/services/api_service.dart';

import '../locator.dart';

class AuthenticationProvider extends ChangeNotifier {
  final JaldiApiService _apiService = locator<JaldiApiService>();

  late AuthenticatedUser? user;
  bool isDataAvailable = false;
  bool isLoading = false;
  AuthenticationProvider({this.user});

  void setUserData(AuthenticatedUser userData) {
    user = userData;
    notifyListeners();
  }

  Future<void> login({required String email, required String password}) async {
    isLoading = true;
    notifyListeners();
    final response = await _apiService.login(
        options: Options(extra: {'email': email, 'password': password}),
        endpoint: ApiEndpoint.authentication(endpoint: Auth.LOGIN));
    user = response;

    isLoading = false;
    notifyListeners();
  }
}
