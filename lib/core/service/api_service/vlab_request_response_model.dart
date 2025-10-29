class VlabRequestResponse {
  final bool success;
  final dynamic data;
  final String? responseCodeError;
  final int? statusCode;

  VlabRequestResponse({
    required this.success,
    this.data,
    this.responseCodeError,
    this.statusCode,
  });
}
