import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'content_rating.g.dart';

@JsonSerializable()
class ContentRating {
  final String iso31661;
  final String rating;
  ContentRating({
    this.iso31661 = '',
    this.rating = '',
  });

  factory ContentRating.fromJson(Map<String, dynamic> json) =>
      _$ContentRatingFromJson(json);
  Map<String, dynamic> toJson() => _$ContentRatingToJson(this);
  @override
  String toString() {
    return json.encode(toJson());
  }
}
