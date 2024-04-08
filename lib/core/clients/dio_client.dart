import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioService {
  final Dio _dio = Dio();

  Future<Response?> getRequest({
    String? endPoint,
    Map<String, dynamic>? queryParameters,
    bool? isHeaderRequire,
  }) async {
    Response? response;

    try {
      response = await _dio.get(
          endPoint != null
              ? dotenv.get("BASE_URL") + endPoint
              : dotenv.get("BASE_URL"),
          queryParameters: queryParameters,
         
          options: Options(
            headers: _setHeader(isHeaderRequire: isHeaderRequire),
            sendTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
          ));
    } on DioException catch (e) {
      _validateException(
        response: e.response,
        message: e.message,
      );
      rethrow;
    }

    return response;
  }

  Future<Response?> postRequest({
    String? endPoint,
    dynamic data,
    bool? isHeaderRequire,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response? response;

    try {
      response = await _dio.post(dotenv.get("BASE_URL") + endPoint!,
          data: data,
        
          options: Options(
            sendTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
            headers: _setHeader(isHeaderRequire: isHeaderRequire),
          ));
    } on TimeoutException catch (_) {
    } on DioException catch (e) {
      _validateException(
        response: e.response,
        message: e.message,
      );
      rethrow;
    }

    return response;
  }

  Future<Response?> postFileRequest({
    String? endPoint,
    required dynamic data,
    bool? isHeaderRequire,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response? response;

    try {
      response = await _dio.post(dotenv.get("BASE_URL") + endPoint!,
          data: data,
          options: Options(
            sendTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30),
            headers: _setHeader(isHeaderRequire: isHeaderRequire),
          ));
    } on TimeoutException catch (_) {
    } on DioException catch (e) {
      _validateException(
        response: e.response,
        message: e.message,
      );

      rethrow;
    }

    return response;
  }

  Future<Response?> deleteRequest({
    String? endPoint,
    Map<String, dynamic>? queryParameters,
    bool? isHeaderRequire,
  }) async {
    late Response response;

    try {
      response = await _dio.delete(dotenv.get("BASE_URL") + endPoint!,
          queryParameters: queryParameters,
          options: Options(
              headers: _setHeader(isHeaderRequire: isHeaderRequire),
              sendTimeout: const Duration(seconds: 10)));
    } on DioException catch (_) {
      rethrow;
    }

    return response;
  }

  _setHeader({bool? isHeaderRequire}) {}

  void _validateException({
    Response? response,
    String? message,
  }) {}

  Future<void> validateResponse(
      {Response? response, bool message = false, bool istoast = true}) async {
    if (response != null) {}
  }

  void noInternetConnection() {}

  void onTimeOut() {}
}
