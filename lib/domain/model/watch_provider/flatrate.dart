import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'flatrate.g.dart';

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
