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

  // User data or authentication result
  late Result<AuthenticatedUser, ErrorResponse>? user;

  // Flag indicating whether user data is available
  bool isDataAvailable = false;

  // Flag indicating loading state
  bool isLoading = false;

  // Constructor for AuthenticationProvider
  AuthenticationProvider({this.user});

  // Method for user login
  Future<void> login({required String email, required String password}) async {
    isLoading = true; // Set loading flag to true
    notifyListeners(); // Notify listeners about the change in state

    // Create Basic Authorization header
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$email:$password'))}';

    // Perform login request to the API service
    final response = await _apiService.login(
      options: Options(
        method: 'POST',
        headers: {'Authorization': basicAuth}, // Set Authorization header
      ),
      endpoint: ApiEndpoint.authentication(
          endpoint: Auth.LOGIN), // API endpoint for authentication
    );

    user = response; // Store the authentication result
    isLoading = false; // Set loading flag to false
    notifyListeners(); // Notify listeners about the change in state
  }

  // Method for user logout
  logout() {
    user = null; // Clear user data upon logout
  }
}
