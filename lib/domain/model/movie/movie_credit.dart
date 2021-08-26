import 'package:json_annotation/json_annotation.dart';
import 'package:movie_info/domain/model/person/cast.dart';

part 'movie_credit.g.dart';

@JsonSerializable()
class MovieCredit {
  final int id;
  final List<Cast> cast;
  final List<Cast> crew;
  MovieCredit({
    this.id = 0,
    this.cast = const [],
    this.crew = const [],
  });

  factory MovieCredit.fromJson(Map<String, dynamic> json) =>
      _$MovieCreditFromJson(json);
  Map<String, dynamic> toJson() => _$MovieCreditToJson(this);
}
