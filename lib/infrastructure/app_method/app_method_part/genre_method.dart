import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';

part 'genre_method.freezed.dart';

@freezed
class GenreMethod with _$GenreMethod implements AppMethod {
  const factory GenreMethod.getMovieGenreList() = GetMovieGenreList;
  const factory GenreMethod.getTVGenreList() = GetTVGenreList;
}
