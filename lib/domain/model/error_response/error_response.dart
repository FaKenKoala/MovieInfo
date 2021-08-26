import 'package:json_annotation/json_annotation.dart';

part 'error_response.g.dart';

@JsonSerializable()
class ErrorResponse {
  final bool success;
  final int statusCode;
  final String statusMessage;

  ErrorResponse({
    this.success = false,
    this.statusCode = 0,
    this.statusMessage = '',
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);
}
