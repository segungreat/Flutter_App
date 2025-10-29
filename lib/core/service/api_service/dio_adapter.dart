import 'package:dio/dio.dart';

import '../../core.dart';

class DioHttpClientAdapter implements VlabHttpClientInterface {
  final DioHttpClient _dioHttpClient = DioHttpClient();
  String get baseURL => _dioHttpClient.baseUrl;

  @override
  Future deleteHttp(String route, {Map<String, dynamic>? params}) async {
    await _dioHttpClient.setHeader();
    params?.removeWhere((key, value) => value == null);
    final fullRoute = '$baseURL$route';
    return _dioHttpClient.makeRequest(
      HttpMethod.delete,
      fullRoute: fullRoute,
      params: params,
    );
  }

  @override
  Future<VlabRequestResponse> getHttp(
    String route, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    bool formdata = false,
  }) async {
    await _dioHttpClient.setHeader(
      formdata: formdata,
    );
    params?.removeWhere((key, value) => value == null);
    final fullRoute = '$baseURL$route';
    return _dioHttpClient.makeRequest(
      HttpMethod.get,
      fullRoute: fullRoute,
      body: body,
      params: params,
    );
  }

  @override
  Future<VlabRequestResponse> patchHttp(String route, body,
      {Map<String, dynamic>? params, bool formdata = false, bool formEncoded = false}) {
    _dioHttpClient.setHeader(
      formdata: formdata,
      formEncoded: formEncoded,
    );
    params?.removeWhere((key, value) => value == null);
    final fullRoute = '$baseURL$route';
    if (formdata) {
      body = FormData.fromMap(body as Map<String, dynamic>);
    }
    return _dioHttpClient.makeRequest(
      HttpMethod.patch,
      fullRoute: fullRoute,
      body: body,
      params: params,
    );
  }

  @override
  Future<VlabRequestResponse> postHttp(String route, body,
      {Map<String, dynamic>? params,
      bool formdata = false,
      bool formEncoded = false,
      void Function({int count, int total})? onSendProgress,
      void Function({int count, int total})? onRecieveProgress}) async {
    await _dioHttpClient.setHeader(
      formdata: formdata,
      formEncoded: formEncoded,
    );
    params?.removeWhere((key, value) => value == null);
    final fullRoute = '$baseURL$route';
    if (formdata) {
      body = FormData.fromMap(body as Map<String, dynamic>);
    }

    return _dioHttpClient.makePostRequest(
      fullRoute: fullRoute,
      body: body,
      params: params,
    );
  }

  @override
  Future<VlabRequestResponse> putHttp(String route, body,
      {Map<String, dynamic>? params, bool formdata = false, bool formEncoded = false}) async {
    await _dioHttpClient.setHeader(
      formdata: formdata,
      formEncoded: formEncoded,
    );
    params?.removeWhere((key, value) => value == null);
    final fullRoute = '$baseURL$route';
    if (formdata) {
      body = FormData.fromMap(body as Map<String, dynamic>);
    }
    return _dioHttpClient.makeRequest(
      HttpMethod.put,
      fullRoute: fullRoute,
      body: body,
      params: params,
    );
  }
}
