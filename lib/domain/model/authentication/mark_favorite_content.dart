import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:movie_info/domain/model/enum_values/enum_values.dart';

part 'mark_favorite_content.g.dart';

@JsonSerializable()
class MarkFavoriteContent {
  final MediaType mediaType;
  final String mediaId;
  final bool favorite;
  MarkFavoriteContent({
    required this.mediaType,
    required this.mediaId,
    required this.favorite,
  });

  factory MarkFavoriteContent.fromJson(Map<String, dynamic> json) =>
      _$MarkFavoriteContentFromJson(json);
  Map<String, dynamic> toJson() => _$MarkFavoriteContentToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
