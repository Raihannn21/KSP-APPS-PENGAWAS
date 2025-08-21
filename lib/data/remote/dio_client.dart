import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ksp_pengawas_monthly/data/sharedpreference/user_preferences.dart';
import 'package:ksp_pengawas_monthly/domain/commons/other_utils.dart';
import 'package:ksp_pengawas_monthly/domain/commons/screen_utils.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio);

  // Get:-----------------------------------------------------------------------
  Future<dynamic> get(String uri,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress,
      String token = ""}) async {
    print("$uri $queryParameters");
    final dioOptions = await generateDioOption(options, token: token);

    try {
      final response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: dioOptions,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      OtherUtils.printWrapped(response.data.toString());
      return response.data;
    } on DioException catch (e) {
      OtherUtils.printWrapped(
          e.response?.data.toString() ?? e.response.toString());
      if (e.response.toString().toLowerCase().contains("expired")) {
        ScreenUtils.expiredToken();
      }
      rethrow;
    }
  }

  Future<dynamic> getInner(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    print("$uri $queryParameters");
    final dioOptions = await generateDioOption(options, isInnerService: true);

    try {
      final response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: dioOptions,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      OtherUtils.printWrapped(response.data.toString());
      return response.data;
    } on DioException catch (e) {
      OtherUtils.printWrapped(
          e.response?.data.toString() ?? e.response.toString());
      if (e.response.toString().toLowerCase().contains("expired")) {
        ScreenUtils.expiredToken();
      }
      rethrow;
    }
  }

  // Get:-----------------------------------------------------------------------
  Future<dynamic> delete(String uri,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken}) async {
    print("$uri $queryParameters");
    final dioOptions = await generateDioOption(options);

    try {
      final response = await _dio.delete(
        uri,
        queryParameters: queryParameters,
        options: dioOptions,
        cancelToken: cancelToken,
      );
      print(response.data);
      return response.data;
    } on DioException catch (e) {
      OtherUtils.printWrapped(
          e.response?.data.toString() ?? e.response.toString());
      if (e.response.toString().toLowerCase().contains("expired")) {
        ScreenUtils.expiredToken();
      }
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<dynamic> post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    print("$uri $queryParameters $data");
    final dioOptions = await generateDioOption(options);

    try {
      final response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: dioOptions,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      print(response.data);
      return response.data;
    } on DioException catch (e) {
      OtherUtils.printWrapped(
          e.response?.data.toString() ?? e.response.toString());
      if (e.response.toString().toLowerCase().contains("expired")) {
        ScreenUtils.expiredToken();
      }
      rethrow;
    }
  }

  Future<dynamic> put(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    print("$uri $queryParameters $data");
    final dioOptions = await generateDioOption(options);
    try {
      final response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: dioOptions,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      print(response);
      print(response.statusCode);
      return response.data;
    } on DioException catch (e) {
      OtherUtils.printWrapped(
          e.response?.data.toString() ?? e.response.toString());
      if (e.response.toString().toLowerCase().contains("expired")) {
        ScreenUtils.expiredToken();
      }
      rethrow;
    }
  }

  Future<Options> generateDioOption(Options? options,
      {String token = "", bool isInnerService = false}) async {
    final prefs = UserPreferences();
    final userToken = await prefs.getUserToken();

    final dioOptions = options ?? Options();
    dioOptions.headers = dioOptions.headers ?? {};
    dioOptions.headers!["content-type"] = "application/json";
    dioOptions.headers!["Access-Control-Allow-Origin"] = "*";
    dioOptions.headers!["Authorization"] = "Bearer $userToken";
    log(dioOptions.headers.toString());
    return dioOptions;
  }
}
