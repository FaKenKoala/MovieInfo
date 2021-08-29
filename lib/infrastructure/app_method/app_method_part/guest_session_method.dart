import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';

part 'guest_session_method.freezed.dart';

@freezed
class GuestSessionMethod with _$GuestSessionMethod implements AppMethod {
  factory GuestSessionMethod.getRatedMovies({
    String? sortBy,
  }) = GetRatedMovies;

  factory GuestSessionMethod.getRatedTVs({
    String? sortBy,
  }) = GetRatedTVs;

  factory GuestSessionMethod.getRatedTVEpisodes({
    String? sortBy,
  }) = GetRatedTVEpisodes;
}
