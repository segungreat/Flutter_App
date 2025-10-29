import 'package:dio/dio.dart';
import 'package:vlab/core/core.dart';
import 'package:flutter/foundation.dart';

class DioHttpClient {
  late final Dio dio;

  static final DioHttpClient _dioInstance = DioHttpClient._internal();
  DioHttpClient._internal();

  factory DioHttpClient() => _dioInstance;

  final VlabSecureDataSource secureDataSource = VlabSecureDataSource();

  final _logger = getLogger('DioHttpClient');
  String get baseUrl => VlabConstants.baseUrl;

  Dio initializeDio() {
    final options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );
    final dio = Dio(options);
    return dio;
  }

  Future<VlabRequestResponse> makeRequest(
    HttpMethod method,
      {required String fullRoute, Map<String, dynamic>? body, Map<String, dynamic>? params}) async {
    try {
      final response = await dio.get(
        fullRoute,
        data: body,
        queryParameters: params,
      );
      _logger.i('Url ---> $fullRoute');
      _logger.i('Data: ${response.data}');
      return VlabRequestResponse(
        data: response.data,
        success: response.statusCode?.toString().startsWith('2') ?? false,
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      if (e.response != null) {
        _logger.e('statusCode: ${e.response?.statusCode}');
        _logger.e('message: Undefined message by Abolaji');
        _logger.e('error: Underfined error by Abolaji');
      }

      return FmHttpException.handleDioError(e);
    }
  }

  Future<VlabRequestResponse> makePostRequest(
      {required String fullRoute,
      Map<String, dynamic>? body,
      Map<String, dynamic>? params,
      void Function({int count, int total})? onSendProgress,
      void Function({int count, int total})? onRecieveProgress}) async {
    try {
      final response = await dio.post(
        fullRoute,
        data: body,
        onSendProgress: (count, total) {
          if (onSendProgress != null) onSendProgress(count: count, total: total);
          showLoadingProgress(count, total);
        },
        onReceiveProgress: ((count, total) {
          if (onRecieveProgress != null) onRecieveProgress(count: count, total: total);
          showLoadingProgress(count, total);
        }),
        queryParameters: params,
      );
      _logger.i('Url ---> $fullRoute');
      _logger.i('Data: ${response.data}');
      return VlabRequestResponse(
        data: response.data,
        success: response.statusCode?.toString().startsWith('2') ?? false,
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      if (e.response != null) {
        _logger.e('statusCode: ${e.response?.statusCode}');
        _logger.e('message: Undefined message by Abolaji');
        _logger.e('error: Underfined error by Abolaji');
      }

      return FmHttpException.handleDioError(e);
    }
  }


  Future getOperableHttpMethod(
    HttpMethod method,
    String fullRoute,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
  ) {
    switch (method) {
      case HttpMethod.put:
        return dio.put(
          fullRoute,
          data: body,
          queryParameters: params,
        );
      case HttpMethod.delete:
        return dio.delete(
          fullRoute,
          data: body,
          queryParameters: params,
        );
      case HttpMethod.patch:
        return dio.patch(
          fullRoute,
          data: body,
          queryParameters: params,
        );

      default:
        return dio.get(
          fullRoute,
          data: body,
          queryParameters: params,
        );
    }
  }

  Future<void> setHeader({
    bool formdata = false,
    bool formEncoded = false,
  }) async {
    dio.options.headers = {
      'content-type': formdata
          ? 'multipart/form-data'
          : formEncoded
              ? 'application/x-www-form-urlencoded'
              : 'application/json',
      'Accept': '*/*',
      'Authorization': 'Bearer ${await secureDataSource.getToken()}',
    };
  }

  void dispose() => dio.close(force: true);

  void resetDio() => dio = initializeDio();

  void showLoadingProgress(int received, int total) {
    if (total != -1 && kDebugMode) {
      _logger.i('${(received / total * 100).toStringAsFixed(0)}%');
    }
  }
}
