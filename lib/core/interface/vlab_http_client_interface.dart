import 'package:vlab/core/core.dart';

abstract class VlabHttpClientInterface {
  /// [VlabHttpClientInterface] is an interface for making HTTP requests.
  /// It provides methods for making GET, POST, PUT, PATCH, and DELETE requests.
  /// It also provides methods for making requests with form data and form encoded data.
  /// The methods return a [VlabRequestResponse] object which contains the response data and status code.
  /// [VlabRequestResponse] is a model class that contains the response data and status code.
  /// [VlabRequestResponse] is used to handle the response from the server.

  Future<VlabRequestResponse> getHttp(
    String route, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    bool formdata = false,
  });

  Future<VlabRequestResponse> postHttp(
    String route,
    dynamic body, {
    Map<String, dynamic>? params,
    bool formdata = false,
    bool formEncoded = false,
    void Function({int count, int total})? onSendProgress,
    void Function({int count, int total})? onRecieveProgress,
  });

  Future<VlabRequestResponse> putHttp(
    String route,
    dynamic body, {
    Map<String, dynamic>? params,
    bool formdata = false,
    bool formEncoded = false,
  });

  Future<VlabRequestResponse> patchHttp(
    String route,
    dynamic body, {
    Map<String, dynamic>? params,
    bool formdata = false,
    bool formEncoded = false,
  });

  Future deleteHttp(String route, {Map<String, dynamic>? params});
}
