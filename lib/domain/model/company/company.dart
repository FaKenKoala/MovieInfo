import 'package:json_annotation/json_annotation.dart';
part 'company.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Company {
  final int id;
  final String? logoPath;
  final String name;
  final String originCountry;
  Company({
    this.id = 0,
    this.logoPath,
    this.name = '',
    this.originCountry = '',
  });

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
