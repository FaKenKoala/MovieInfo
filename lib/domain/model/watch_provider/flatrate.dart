import 'package:json_annotation/json_annotation.dart';

part 'flatrate.g.dart';

@JsonSerializable()
class Flatrate {
  Flatrate({
    this.displayPriority = 0,
    this.logoPath = '',
    this.providerId = 0,
    this.providerName = '',
  });

  final int displayPriority;
  final String logoPath;
  final int providerId;
  final String providerName;

  factory Flatrate.fromJson(Map<String, dynamic> json) =>
      _$FlatrateFromJson(json);
  Map<String, dynamic> toJson() => _$FlatrateToJson(this);
}
