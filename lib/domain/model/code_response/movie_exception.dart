
import 'code_response.dart';

class MovieException implements Exception {
  CodeResponse? codeResponse;
  dynamic message;
  MovieException({this.codeResponse, this.message});

  String toString() {
    if (codeResponse != null) {
      return 'CodeResponse From Server: ${codeResponse!.toJson()}';
    }
    Object? message = this.message;
    if (message == null) return "MovieException";
    return "MovieException: $message";
  }
}
