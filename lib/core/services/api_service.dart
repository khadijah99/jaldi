import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:jaldi/core/models/authenticated_user.dart';
import 'package:jaldi/core/models/leads.dart';
import 'package:jaldi/core/typedefs.dart';

class JaldiApiService {
  final Dio dio;

  JaldiApiService({required this.dio});

  Future<AuthenticatedUser> login<R>({
    bool isMock = false,
    required String endpoint,
    JSON? data,
    Options? options,
    CancelToken? cancelToken,
    JSON? queryParameters,
  }) async {
    final response = await dio.post<JSON>(
      endpoint,
      data: data,
      options: options,
      queryParameters: queryParameters,
    );
    return AuthenticatedUser.fromJson(response.data!);
  }

  Future<Leads> getLeads<R>({
    bool isMock = false,
    required String endpoint,
    JSON? data,
    Options? options,
    CancelToken? cancelToken,
    JSON? queryParameters,
  }) async {
    if (isMock) {
      String jsonString =
          await rootBundle.loadString('assets/json-files/mock_data.json');
      // Parse JSON
      Map<String, dynamic> jsonData = json.decode(jsonString);

      Leads data = Leads.fromJson(jsonData);
      return data;
    } else {
      throw DioException(requestOptions: RequestOptions());
    }
  }
}
