import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:movie_info/domain/model/enum_values/enum_values.dart';

part 'add_to_watchlist_content.g.dart';

@JsonSerializable()
class AddtoWatchlistContent {
  final MediaType mediaType;
  final String mediaId;
  final bool watchlist;
  AddtoWatchlistContent({
    required this.mediaType,
    required this.mediaId,
    required this.watchlist,
  });

  factory AddtoWatchlistContent.fromJson(Map<String, dynamic> json) => _$AddtoWatchlistContentFromJson(json);
  Map<String, dynamic> toJson() => _$AddtoWatchlistContentToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}