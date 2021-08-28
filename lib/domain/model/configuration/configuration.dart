import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'configuration.g.dart';

@JsonSerializable()
class APIConfiguration {
  final ImageConfig images;
  final List<String> changeKeys;

  APIConfiguration({
    required this.images,
    this.changeKeys = const [],
  });

  factory APIConfiguration.fromJson(Map<String, dynamic> json) =>
      _$APIConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$APIConfigurationToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}

@JsonSerializable()
class ImageConfig {
  ImageConfig({
    this.baseUrl = '',
    this.secureBaseUrl = '',
    this.backdropSizes = const [],
    this.logoSizes = const [],
    this.posterSizes = const [],
    this.profileSizes = const [],
    this.stillSizes = const [],
  });

  @JsonKey(name: 'base_url')
  String baseUrl;
  @JsonKey(name: 'secure_base_url')
  String secureBaseUrl;
  @JsonKey(name: 'backdrop_sizes')
  List<String> backdropSizes;
  @JsonKey(name: 'logo_sizes')
  List<String> logoSizes;
  @JsonKey(name: 'poster_sizes')
  List<String> posterSizes;
  @JsonKey(name: 'profile_sizes')
  List<String> profileSizes;
  @JsonKey(name: 'still_sizes')
  List<String> stillSizes;

  factory ImageConfig.fromJson(Map<String, dynamic> json) =>
      _$ImageConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ImageConfigToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
