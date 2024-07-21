import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:moviemax/src/core/constants/app_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio()
      ..options.baseUrl = AppConstants.baseUrl
      ..options.headers = {
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
        HttpHeaders.authorizationHeader: 'Bearer ${AppConstants.apiToken}'
      }
      ..options.connectTimeout = const Duration(milliseconds: 15000)
      ..options.receiveTimeout = const Duration(milliseconds: 15000)
      ..options.responseType = ResponseType.json
      ..interceptors.add(
        PrettyDioLogger(
          compact: false,
          logPrint: (object) => log(object.toString(), name: 'TMDB API'),
        ),
      );
  }

  // GET 
  Future<Response<dynamic>> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException {
      rethrow;
    }
  }

  // POST
  Future<Response<dynamic>> post(String uri,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceivedProgress}) async {
    try {
      final response = await _dio.post(uri,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceivedProgress);
      return response;
    } on DioException {
      rethrow;
    }
  }

  // PUT
  Future<Response<dynamic>> put(String uri,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceivedProgress}) async {
    try {
      final response = await _dio.put(uri,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceivedProgress);
      return response;
    } on DioException {
      rethrow;
    }
  }

  // PATCH
  Future<Response<dynamic>> patch(String uri,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceivedProgress}) async {
    try {
      final response = await _dio.patch(uri,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceivedProgress);
      return response;
    } on DioException {
      rethrow;
    }
  }

  // DELETE
  Future<Response<dynamic>> delete(String uri,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceivedProgress}) async {
    try {
      final response = await _dio.delete(uri,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken);
      return response;
    } on DioException {
      rethrow;
    }
  }
}
