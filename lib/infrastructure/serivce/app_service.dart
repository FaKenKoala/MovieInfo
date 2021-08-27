import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_info/application/get_it/get_it_main.dart';
import 'package:movie_info/domain/model/code_response/code_response.dart';
import 'package:movie_info/domain/model/configuration/configuration.dart';
import 'package:movie_info/domain/model/enum_values/enum_values.dart';
import 'package:movie_info/domain/model/code_response/app_exception.dart';
import 'package:movie_info/domain/model/api_result/page_result.dart';
import 'package:movie_info/domain/model/media/media_credit.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/model/person/cast.dart';
import 'package:movie_info/domain/model/tv/tv.dart';

import 'package:movie_info/domain/service/i_app_service.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';
import 'package:movie_info/infrastructure/util/constant.dart';
import 'package:movie_info/infrastructure/util/movie_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'repository/local/local_repository.dart';
import 'repository/remote/remote_repository.dart';

part 'app_service_part/certifications_service.dart';
part 'app_service_part/keywords_service.dart';
part 'app_service_part/tv_service.dart';
part 'app_service_part/movie_service.dart';
part 'app_service_part/tv_episodes_service.dart';
part 'app_service_part/tv_seasons_service.dart';
part 'app_service_part/guest_sessions_service.dart';
part 'app_service_part/people_service.dart';
part 'app_service_part/genres_service.dart';
part 'app_service_part/companies_service.dart';
part 'app_service_part/trending_service.dart';
part 'app_service_part/lists_service.dart';
part 'app_service_part/search_service.dart';
part 'app_service_part/configuration_service.dart';
part 'app_service_part/collections_service.dart';
part 'app_service_part/discover_service.dart';
part 'app_service_part/find_service.dart';
part 'app_service_part/changes_service.dart';
part 'app_service_part/reviews_service.dart';
part 'app_service_part/authentication_service.dart';
part 'app_service_part/watch_providers_service.dart';
part 'app_service_part/networks_service.dart';
part 'app_service_part/tv_episode_groups_service.dart';
part 'app_service_part/credits_service.dart';

abstract class AppServicePart {
  final LocalRepository localRepository;
  final RemoteRepository remoteRepository;
  AppServicePart._(this.remoteRepository, this.localRepository);
}

@Singleton(as: IAppService)
class AppService extends AppServicePart
    with
        ConfigurationService,
        DiscoverService,
        FindService,
        MovieService,
        TrendingService,
        TVService
    implements IAppService {
  AppService(RemoteRepository remoteRepository, LocalRepository localRepository)
      : super._(remoteRepository, localRepository);

  @override
  Future<AppExceptionEither<T>> execute<T>(AppMethod method) async {
    /// 这个_executeMethod方法应该用编译时注解自动生成代码，格式时根据method.map的参数名称 {name}，
    /// 生成 name: get{name.firstUppercase}的方法调用，如同现有的_executeMethod所展示的一样。
    ///
    /// 这个方法也可以自动生成，格式是： remoteRepository.{name},参数就根据method的所有参数依此赋值
    try {
      return right(await _executeMethod(method))
        ..fold((l) => null, (r) {
          MovieLog.printJson('${r.toString()}');
          if (r is MediaCredit) {
            MovieLog.printS(r.cast.first.toJson());
          }
        });
    } catch (e) {
      AppException? movieException;
      if (e is DioError) {
        try {
          CodeResponse errorResponse = CodeResponse.fromJson(e.response?.data);
          movieException = AppException(codeResponse: errorResponse);
        } catch (_) {}
      }
      movieException ??= AppException(message: e);
      MovieLog.printS('${method.runtimeType} $movieException');
      return left(movieException);
    }
  }

  Future _executeMethod(AppMethod method) async {
    switch (method.methodType) {
      case AppMethodType.Configuration:
        return (method as ConfigurationMethod)
            .map(getConfiguration: getConfiguration);
      case AppMethodType.Discover:
        return (method as DiscoverMethod)
            .map(discoverMovie: discoverMovie, discoverTV: discoverTV);
      case AppMethodType.Find:
        return (method as FindMethod).map(findByExternalID: findByExternalID);
      case AppMethodType.Movie:
        return (method as MovieMethod).map(
            getMovieDetail: getMovieDetail,
            getMovieAccountState: getMovieAccountState,
            getMovieAlternativeTitles: getMovieAlternativeTitles,
            getMovieChanges: getMovieChanges,
            getMovieCredit: getMovieCredit,
            getMovieExternalId: getMovieExternalId,
            getMovieImage: getMovieImage,
            getMovieKeyword: getMovieKeyword,
            getMovieBelongList: getMovieBelongList,
            getMovieRecommendation: getMovieRecommendation,
            getMovieReleaseDate: getMovieReleaseDate,
            getMovieReview: getMovieReview,
            getMovieSimilar: getSimilarMovie,
            getMovieTranslation: getMovieTranslation,
            getMovieVideo: getMovieVideo,
            getMovieWatchProvider: getMovieWatchProvider,
            rateMovie: rateMovie,
            deleteMovieRate: deleteMovieRate,
            getLatestMovie: getLatestMovie,
            getNowPlayingMovie: getNowPlayingMovie,
            getPopularMovie: getPopularMovie,
            getTopRatedMovie: getTopRatedMovie,
            getUpcomingMovie: getUpcomingMovie);
      case AppMethodType.Trending:
        return (method as TrendingMethod).map(getTrending: getTrending);
      case AppMethodType.TV:
        return (method as TVMethod).when(
            getTVDetail: getTVDetail,
            getTVAccountState: getTVAccountState,
            getTVAggregateCredit: getTVAggregateCredit,
            getTVAlternativeTitles: getTVAlternativeTitles,
            getTVChanges: getTVChanges,
            getTVContentRating: getTVContentRating);
      case AppMethodType.Unknow:
        throw 'Unknown Method Type: $method';
    }
  }
}
