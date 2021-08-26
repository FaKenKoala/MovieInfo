import 'package:json_annotation/json_annotation.dart';

part 'code_response.g.dart';

@JsonSerializable()
class CodeResponse {
  final bool success;
  final int statusCode;
  final String statusMessage;

  CodeResponse({
    this.success = false,
    this.statusCode = 0,
    this.statusMessage = '',
  });

  factory CodeResponse.fromJson(Map<String, dynamic> json) =>
      _$CodeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CodeResponseToJson(this);
}
