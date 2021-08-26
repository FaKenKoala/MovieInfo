import 'code_response.dart';

class AppException implements Exception {
  CodeResponse? codeResponse;
  dynamic message;
  AppException({this.codeResponse, this.message});

  String toString() {
    if (codeResponse != null) {
      return 'CodeResponse From Server: ${codeResponse!.toJson()}';
    }
    Object? message = this.message;
    if (message == null) return "AppException";
    return "AppException: $message";
  }
}
