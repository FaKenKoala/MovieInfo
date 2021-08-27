import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'network.g.dart';

@JsonSerializable()
class Network {
  Network({
    this.name = '',
    this.id = 0,
    this.logoPath = '',
    this.originCountry = '',
    this.homepage = '',
    this.headquarters = '',
  });

  final String name;
  final int id;
  final String logoPath;
  final String originCountry;
  final String homepage;
  final String headquarters;

  factory Network.fromJson(Map<String, dynamic> json) =>
      _$NetworkFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
