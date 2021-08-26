import 'package:movie_info/domain/model/error_response/error_response.dart';

class MovieException implements Exception {
  ErrorResponse? errorResponse;
  dynamic message;
  MovieException({this.errorResponse, this.message});

  String toString() {
    if (errorResponse != null) {
      return 'ErrorResponse From Server: ${errorResponse!.toJson()}';
    }
    Object? message = this.message;
    if (message == null) return "MovieException";
    return "MovieException: $message";
  }
}
