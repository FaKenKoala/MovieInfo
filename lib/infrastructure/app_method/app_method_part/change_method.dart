import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';
part 'change_method.freezed.dart';

@freezed
class ChangeMethod with _$ChangeMethod implements AppMethod {
  const factory ChangeMethod.getChangeMovies() = GetChangeMovies;

  const factory ChangeMethod.getChangeTVs() = GetChangeTVs;

  const factory ChangeMethod.getChangePersons() = GetChangePersons;

}
