import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'company.g.dart';

@JsonSerializable()
class Company {
  final String description;
  final String headquarters;
  final String homepage;
  final int id;
  final String? logoPath;
  final String name;
  final String originCountry;
  final Company? parentCompany;
  Company({
    this.description = '',
    this.headquarters = '',
    this.homepage = '',
    this.id = 0,
    this.logoPath,
    this.name = '',
    this.originCountry = '',
    this.parentCompany,
  });

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
