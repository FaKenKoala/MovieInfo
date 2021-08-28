import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'certification.g.dart';

@JsonSerializable()
class CertificationList {
  final Map<String, List<Certification>> certifications;
  CertificationList({
    this.certifications = const {},
  });

  factory CertificationList.fromJson(Map<String, dynamic> json) =>
      _$CertificationListFromJson(json);
  Map<String, dynamic> toJson() => _$CertificationListToJson(this);
  @override
  String toString() {
    return json.encode(toJson());
  }
}

@JsonSerializable()
class Certification {
  final String certification;
  final String meaning;
  final int order;
  Certification({
    this.certification = '',
    this.meaning = '',
    this.order = 0,
  });

  factory Certification.fromJson(Map<String, dynamic> json) =>
      _$CertificationFromJson(json);
  Map<String, dynamic> toJson() => _$CertificationToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
