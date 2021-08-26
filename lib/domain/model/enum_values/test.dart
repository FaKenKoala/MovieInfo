import 'package:json_annotation/json_annotation.dart';
import 'package:movie_info/domain/model/enum_values/monetization_type.dart';

part 'test.g.dart';

@JsonSerializable()
class Test {
  final MonetizationType monetizationType;
  Test(this.monetizationType);

  factory Test.fromJson(Map<String, dynamic> json) => _$TestFromJson(json);
  Map<String, dynamic> toJson() => _$TestToJson(this);
}
