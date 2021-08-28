import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:movie_info/domain/model/author/author.dart';
import 'package:movie_info/domain/model/enum_values/enum_values.dart';

part 'review.g.dart';

@JsonSerializable()
class Review {
  Review({
    this.iso6391 = '',
    this.mediaTitle = '',
    this.mediaType = MediaType.ALL,
    this.author = '',
    required this.authorDetails,
    this.content = '',
    this.createdAt,
    this.id = '',
    this.updatedAt,
    this.url = '',
  });

  final String author;
  final Author authorDetails;
  final String content;
  final DateTime? createdAt;
  @JsonKey(name: 'iso_639_1')
  final String iso6391;
  final String id;
  final DateTime? updatedAt;
  final String mediaTitle;
  final MediaType mediaType;
  final String url;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
