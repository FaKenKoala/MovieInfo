import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:movie_info/domain/model/language/language.dart';

part 'translatetion_list.g.dart';

@JsonSerializable()
class TranslationList {
  final int id;
  final List<Language> translations;
  TranslationList({
    this.id = 0,
    this.translations = const [],
  });

  factory TranslationList.fromJson(Map<String, dynamic> json) =>
      _$TranslationListFromJson(json);
  Map<String, dynamic> toJson() => _$TranslationListToJson(this);
  
  @override
  String toString() {
    return json.encode(toJson());
  }
}
