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

  JaldiApiService({required this.dio});

  Future<Result<AuthenticatedUser, ErrorResponse>> login<R>({
    bool isMock = false,
    required String endpoint,
    JSON? data,
    Options? options,
    CancelToken? cancelToken,
    JSON? queryParameters,
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

  Future<Leads> getLeads<R>({
    bool isMock = false,
    required String endpoint,
    int pageNo = 1,
    JSON? data,
    Options? options,
    CancelToken? cancelToken,
    JSON? queryParameters,
  }) async {
    if (isMock) {
      String jsonString = await rootBundle.loadString(AppAssets.mockData);
      // Parse JSON
      Map<String, dynamic> jsonData = json.decode(jsonString);

      Leads data = Leads.fromJson(jsonData);

      return data;
    } else {
      throw DioException(requestOptions: RequestOptions());
    }
  }

  List<InnerLeadData>? _getPaginatedLeads(
      List<InnerLeadData>? allLeads, int pageNo, int perPage) {
    int startIndex = (pageNo - 1) * perPage;
    int endIndex = startIndex + perPage;
    endIndex = endIndex > allLeads!.length ? allLeads.length : endIndex;
    return allLeads.sublist(startIndex, endIndex);
  }
}
