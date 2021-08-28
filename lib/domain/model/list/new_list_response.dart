import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:movie_info/domain/model/code_response/code_response.dart';

part 'NewListResponse.g.dart';

@JsonSerializable()
class NewListResponse extends CodeResponse {
  final int listId;
  NewListResponse({
    this.listId = 0,
    String statusMessage = '',
    int statusCode = 0,
    bool success = false,
  }) : super(
            statusCode: statusCode,
            statusMessage: statusMessage,
            success: success);

  factory NewListResponse.fromJson(Map<String, dynamic> json) =>
      _$NewListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$NewListResponseToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
