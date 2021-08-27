import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:movie_info/domain/model/watch_provider/flatrate.dart';

part 'watch_provider.g.dart';

@JsonSerializable()
class WatchProviderItem {
  final String? link;
  final List<WatchProvider> flatrate;
  WatchProviderItem({
    this.link,
    this.flatrate = const [],
  });

  factory WatchProviderItem.fromJson(Map<String, dynamic> json) =>
      _$WatchProviderItemFromJson(json);
  Map<String, dynamic> toJson() => _$WatchProviderItemToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
