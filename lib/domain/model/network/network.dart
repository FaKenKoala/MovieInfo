import 'package:json_annotation/json_annotation.dart';

part 'network.g.dart';

@JsonSerializable()
class Network {
  Network({
    this.name = '',
    this.id = 0,
    this.logoPath = '',
    this.originCountry = '',
  });

  final String name;
  final int id;
  final String logoPath;
  final String originCountry;

  factory Network.fromJson(Map<String, dynamic> json) =>
      _$NetworkFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkToJson(this);
}
