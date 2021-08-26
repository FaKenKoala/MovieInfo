import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/model/movie/movie_list.dart';

class GenericConverter<T> implements JsonConverter<T, Object?> {
  const GenericConverter();

  @override
  T fromJson(Object? json) {
    if (json is Map<String, dynamic>) {
      switch (T) {
        case Movie:
          return Movie.fromJson(json) as T;
        case MovieList:
          return MovieList.fromJson(json) as T;
      }
    }

    return json as T;
  }

  @override
  Object? toJson(T object) => object;
}
