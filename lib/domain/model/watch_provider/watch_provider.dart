import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'watch_provider.g.dart';

@JsonSerializable()
class WatchProviderList {
  final int id;
  final Map<String, WatchProviderItem> results;
  WatchProviderList({
    this.id = 0,
    this.results = const {},
  });

  factory WatchProviderList.fromJson(Map<String, dynamic> json) =>
      _$WatchProviderListFromJson(json);
  Map<String, dynamic> toJson() => _$WatchProviderListToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}

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

@JsonSerializable()
class WatchProvider {
  WatchProvider({
    this.displayPriority = 0,
    this.logoPath = '',
    this.providerId = 0,
    this.providerName = '',
  });

  final int displayPriority;
  final String logoPath;
  final int providerId;
  final String providerName;

  factory WatchProvider.fromJson(Map<String, dynamic> json) =>
      _$WatchProviderFromJson(json);
  Map<String, dynamic> toJson() => _$WatchProviderToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
