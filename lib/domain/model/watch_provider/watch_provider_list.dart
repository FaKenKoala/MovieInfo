import 'package:json_annotation/json_annotation.dart';
import 'package:movie_info/domain/model/watch_provider/watch_provider.dart';

part 'watch_provider_list.g.dart';

@JsonSerializable()
class WatchProviderList {
  final int id;
  final Map<String, WatchProvider> results;
  WatchProviderList({
    this.id = 0,
    this.results = const {},
  });

  factory WatchProviderList.fromJson(Map<String, dynamic> json) =>
      _$WatchProviderListFromJson(json);
  Map<String, dynamic> toJson() => _$WatchProviderListToJson(this);
}
