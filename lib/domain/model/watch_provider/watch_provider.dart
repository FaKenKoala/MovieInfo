import 'package:json_annotation/json_annotation.dart';
import 'package:movie_info/domain/model/watch_provider/flatrate.dart';

part 'watch_provider.g.dart';

@JsonSerializable()
class WatchProvider {
  final String? link;
  final List<Flatrate> flatrate;
  WatchProvider({
    this.link,
    this.flatrate = const [],
  });

  factory WatchProvider.fromJson(Map<String, dynamic> json) =>
      _$WatchProviderFromJson(json);
  Map<String, dynamic> toJson() => _$WatchProviderToJson(this);
}
