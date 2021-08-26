import 'package:json_annotation/json_annotation.dart';

import 'external_source.dart';

part 'test.g.dart';

@JsonSerializable()
class Test {
  final ExternalSource monetizationType;
  Test(this.monetizationType);

  factory Test.fromJson(Map<String, dynamic> json) => _$TestFromJson(json);
  Map<String, dynamic> toJson() => _$TestToJson(this);
}
