import 'package:json_annotation/json_annotation.dart';

part 'rate_content.g.dart';

@JsonSerializable()
class RateContent {
  final num value;
  RateContent({required this.value});

  factory RateContent.fromJson(Map<String, dynamic> json) =>
      _$RateContentFromJson(json);
  Map<String, dynamic> toJson() => _$RateContentToJson(this);
}
