import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'network.g.dart';

@JsonSerializable()
class Network {
  Network({
    this.headquarters = '',
    this.homepage = '',
    this.id = 0,
    this.logoPath = '',
    this.name = '',
    this.originCountry = '',
  });

  final String headquarters;
  final String homepage;
  final int id;
  final String logoPath;
  final String name;
  final String originCountry;

  factory Network.fromJson(Map<String, dynamic> json) =>
      _$NetworkFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
