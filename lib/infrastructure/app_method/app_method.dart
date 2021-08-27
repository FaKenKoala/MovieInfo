import 'package:dartz/dartz.dart';
import 'package:movie_info/domain/model/code_response/app_exception.dart';
import 'package:movie_info/infrastructure/app_method/app_method_part/configuration_method.dart';
import 'package:movie_info/infrastructure/app_method/app_method_part/discover_method.dart';
import 'package:movie_info/infrastructure/app_method/app_method_part/find_method.dart';
import 'package:movie_info/infrastructure/app_method/app_method_part/movie_method.dart';
import 'package:movie_info/infrastructure/app_method/app_method_part/trending_method.dart';
import 'package:movie_info/infrastructure/app_method/app_method_part/tv_episode_group_method.dart';
import 'package:movie_info/infrastructure/app_method/app_method_part/tv_method.dart';
export 'app_method_part/configuration_method.dart';
export 'app_method_part/discover_method.dart';
export 'app_method_part/find_method.dart';
export 'app_method_part/movie_method.dart';
export 'app_method_part/trending_method.dart';
export 'app_method_part/tv_method.dart';

typedef AppExceptionEither<T> = Either<AppException, T>;

class AppMethod {}

extension AppMethodX on AppMethod {
  AppMethodType get methodType {
    if (this is ConfigurationMethod) return AppMethodType.Configuration;

    if (this is DiscoverMethod) return AppMethodType.Discover;

    if (this is FindMethod) return AppMethodType.Find;

    if (this is MovieMethod) return AppMethodType.Movie;

    if (this is TrendingMethod) return AppMethodType.Trending;

    if (this is TVMethod) return AppMethodType.TV;

    if (this is TVEpisodeGroupMethod) return AppMethodType.TVEpisodeGroup;

    return AppMethodType.Unknow;
  }
}

enum AppMethodType {
  Configuration,
  Discover,
  Find,
  Movie,
  Trending,
  TV,
  TVEpisodeGroup,
  Unknow,
}
