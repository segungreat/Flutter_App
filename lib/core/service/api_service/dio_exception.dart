import 'dart:developer' as logger;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../core.dart';

class FmHttpException {
  static VlabRequestResponse handleDioError(DioException e) {
    if (kDebugMode) {
      logger.log('DioException: ${e.message}');
      logger.log('Error Type: ${e.type.name}');
      logger.log('Error Data: ${e.response?.data}');
      logger.log('Status Code: ${e.response?.statusCode}');
    }

    final errorMessage = {
          DioExceptionType.connectionTimeout: "Connection Timeout",
          DioExceptionType.receiveTimeout: "Connection Timeout",
          DioExceptionType.sendTimeout: "Connection Timeout",
          DioExceptionType.unknown: "An unknown error occurred. Please check your internet and try again.",
        }[e.type] ??
        e.response?.statusMessage ??
        "An error occurred.";

    return VlabRequestResponse(
      success: false,
      data: e.response?.data,
      responseCodeError: errorMessage,
      statusCode: e.response?.statusCode,
    );
  }
}
