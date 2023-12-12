import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:jaldi/core/base/sealed_class.dart';
import 'package:jaldi/core/constants/app_assets.dart';
import 'package:jaldi/core/models/authenticated_user.dart';
import 'package:jaldi/core/models/error_message.dart';
import 'package:jaldi/core/models/leads.dart';
import 'package:jaldi/core/typedefs.dart';

class JaldiApiService {
  final Dio dio;

  // Constructor for JaldiApiService, requiring an instance of Dio
  JaldiApiService({required this.dio});

  // Method for user login
  Future<Result<AuthenticatedUser, ErrorResponse>> login<R>({
    bool isMock = false, // Flag to simulate/mock API response
    required String endpoint, // API endpoint for login
    JSON? data, // Data to be sent in the request body
    Options? options, // Options for the HTTP request
    CancelToken? cancelToken, // Token for cancelling the request
    JSON? queryParameters, // Query parameters for the request
  }) async {
    try {
      final response = await dio.post<JSON>(
        endpoint,
        data: data,
        options: options,
        queryParameters: queryParameters,
      );
      return Success(AuthenticatedUser.fromJson(response.data!));
    } on DioException catch (e) {
      return Failure(ErrorResponse.fromJson(e.response!.data));
    }
  }

  // Method to fetch leads
  Future<Leads> getLeads<R>({
    bool isMock = false, // Flag to determine if mock data should be used
    required String endpoint, // API endpoint for fetching leads
    int pageNo = 1, // Page number for pagination
    JSON? data, // Data to be sent in the request body
    Options? options, // Options for the HTTP request
    CancelToken? cancelToken, // Token for cancelling the request
    JSON? queryParameters, // Query parameters for the request
  }) async {
    if (isMock) {
      // Load and parse mock JSON data if isMock is true
      String jsonString = await rootBundle.loadString(AppAssets.mockData);
      Map<String, dynamic> jsonData = json.decode(jsonString);
      Leads data = Leads.fromJson(jsonData);
      return data;
    } else {
      // Throw DioException if not using mock data
      throw DioException(requestOptions: RequestOptions());
    }
  }

  // Method to get a subset of paginated leads
  List<InnerLeadData>? _getPaginatedLeads(
      List<InnerLeadData>? allLeads, int pageNo, int perPage) {
    int startIndex = (pageNo - 1) * perPage;
    int endIndex = startIndex + perPage;
    endIndex = endIndex > allLeads!.length ? allLeads.length : endIndex;
    return allLeads.sublist(startIndex, endIndex);
  }
}
