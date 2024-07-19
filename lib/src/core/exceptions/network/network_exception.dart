import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:moviemax/src/core/network/model/network_error_model.dart';

class NetworkException extends Equatable implements Exception {
  late final String message; 
  late final int? statusCode; 

  NetworkException.fromDioError(DioException dioException) {
    statusCode = dioException.response?.statusCode;

    switch (dioException.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break; 
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connectio with API server";
        break; 
      case DioExceptionType.connectionError:
        if (dioException.error.runtimeType == SocketException) {
          message = "Please check your internet connection";
        } else {
          message = "unexpected error occurrence";
        }
        break; 
      case DioExceptionType.badCertificate:
        message = "Bad Certificate";
        break; 
      case DioExceptionType.badResponse:
        final model = NetworkErrorModel.fromJson(dioException.response?.data as Map<String, dynamic>);
        message = model.statusMessage ?? 'Unexpected bad response';
        break;
      case DioExceptionType.unknown:
        message = "unexpected error occurrence";
        break;
    }
  }

  @override
  List<Object?> get props => [message, statusCode];
}