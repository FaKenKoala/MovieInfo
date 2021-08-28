import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:movie_info/application/get_it/get_it_main.dart';
import 'package:movie_info/domain/model/api_result/page_result.dart';
import 'package:movie_info/domain/model/change/change_list.dart';
import 'package:movie_info/domain/model/code_response/app_exception.dart';
import 'package:movie_info/domain/model/code_response/code_response.dart';
import 'package:movie_info/domain/model/configuration/configuration.dart';
import 'package:movie_info/domain/model/enum_values/enum_values.dart';
import 'package:movie_info/domain/model/media/image.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/model/person/credit.dart';
import 'package:movie_info/domain/model/tv/tv.dart';
import 'package:movie_info/domain/service/i_app_service.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';
import 'package:movie_info/infrastructure/app_method/app_method_part/change_method.dart';
import 'package:movie_info/infrastructure/app_method/app_method_part/genre_method.dart';
import 'package:movie_info/infrastructure/util/constant.dart';
import 'package:movie_info/infrastructure/util/date_util.dart';
import 'package:movie_info/infrastructure/util/movie_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:movie_info/infrastructure/repository/local/local_repository.dart';
import 'package:movie_info/infrastructure/repository/remote/remote_repository.dart';

part 'app_service_part/configuration_service.dart';
part 'app_service_part/credit_service.dart';
part 'app_service_part/discover_service.dart';
part 'app_service_part/person_service.dart';
part 'app_service_part/trending_service.dart';

abstract class AppServicePart {
  final LocalRepository localRepository;
  final RemoteRepository remoteRepository;
  AppServicePart._(this.remoteRepository, this.localRepository);
}

@Singleton(as: IAppService)
class AppService extends AppServicePart
    with
        ConfigurationService,
        CreditService,
        DiscoverService,
        PersonService,
        TrendingService
    implements IAppService {
  AppService(RemoteRepository remote, LocalRepository localRepository)
      : super._(remote, localRepository);

  @override
  Future<AppExceptionEither<T>> execute<T>(AppMethod method) async {
    /// 这个_executeMethod方法应该用编译时注解自动生成代码，格式时根据method.map的参数名称 {name}，
    /// 生成 name: get{name.firstUppercase}的方法调用，如同现有的_executeMethod所展示的一样。
    ///
    /// 这个方法也可以自动生成，格式是： remote.{name},参数就根据method的所有参数依此赋值
    try {
      return right(await _executeMethod(method))
        ..fold((l) => null, (r) {
          // catching(() => MovieLog.printJson('${r.toString()}'));
          MovieLog.printJson('${r.toString()}');
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
      case AppMethodType.Change:
        return (method as ChangeMethod).when(
            getChangeMovies: remote.getChangeMovies,
            getChangeTVs: remote.getChangeTVs,
            getChangePersons: remote.getChangePersons);

      case AppMethodType.Collection:
        return (method as CollectionMethod).when(
            getCollectionDetail: remote.getCollectionDetail,
            getCollectionImages: remote.getCollectionImages,
            getCollectionTranslations: remote.getCollectionTranslation);

      case AppMethodType.Company:
        return (method as CompanyMethod).when(
            getCompanyDetail: remote.getCompanyDetail,
            getCompanyAlternativeNames: remote.getCompanyAlternativeNames,
            getCompanyLogos: remote.getCompanyLogos);

      case AppMethodType.Configuration:
        return (method as ConfigurationMethod).when(
            getAPIConfiguration: getAPIConfiguration,
            getConfigurationCountries: remote.getConfigurationCountries,
            getConfigurationJobs: remote.getConfigurationJobs,
            getConfigurationLanguages: remote.getConfigurationLanguages,
            getConfigurationTranslations: remote.getConfigurationTranslations,
            getConfigurationTimezones: remote.getConfigurationTimezones);

      case AppMethodType.Credit:
        return (method as CreditMethod).map(getCreditDetail: getCreditDetail);

      case AppMethodType.Discover:
        return (method as DiscoverMethod)
            .map(discoverMovie: discoverMovie, discoverTV: discoverTV);

      case AppMethodType.Find:
        return (method as FindMethod)
            .when(findByExternalID: remote.findByExternalID);

      case AppMethodType.Genre:
        return (method as GenreMethod).when(
            getMovieGenreList: remote.getMovieGenreList,
            getTVGenreList: remote.getTVGenreList);

      case AppMethodType.Keyword:
        return (method as KeywordMethod).when(
            getKeywordDetail: remote.getKeywordDetail,
            getKeywordMovies: remote.getKeywordMovies);

      case AppMethodType.Movie:
        return (method as MovieMethod).when(
            getMovieDetail: remote.getMovieDetail,
            getMovieAccountState: remote.getMovieAccountState,
            getMovieAlternativeTitles: remote.getMovieAlternativeTitles,
            getMovieChanges: remote.getMovieChanges,
            getMovieCredit: remote.getMovieCredit,
            getMovieExternalId: remote.getMovieExternalId,
            getMovieImage: remote.getMovieImage,
            getMovieKeyword: remote.getMovieKeyword,
            getMovieBelongList: remote.getMovieBelongList,
            getMovieRecommendation: remote.getMovieRecommendation,
            getMovieReleaseDate: remote.getMovieReleaseDate,
            getMovieReview: remote.getMovieReview,
            getSimilarMovie: remote.getSimilarMovie,
            getMovieTranslation: remote.getMovieTranslation,
            getMovieVideo: remote.getMovieVideo,
            getMovieWatchProvider: remote.getMovieWatchProvider,
            rateMovie: remote.rateMovie,
            deleteMovieRate: remote.deleteMovieRate,
            getLatestMovie: remote.getLatestMovie,
            getNowPlayingMovie: remote.getNowPlayingMovie,
            getPopularMovie: remote.getPopularMovie,
            getTopRatedMovie: remote.getTopRatedMovie,
            getUpcomingMovie: remote.getUpcomingMovie);

      case AppMethodType.Network:
        return (method as NetworkMethod).when(
            getNetworkDetail: remote.getNetworkDetail,
            getNetworkAlternativeNames: remote.getNetworkAlternativeNames,
            getNetworkLogos: remote.getNetworkLogos);

      case AppMethodType.Person:
        return (method as PersonMethod).when(
            getPersonDetail: remote.getPersonDetail,
            getPersonChanges: getPersonChanges,
            getPersonMovieCredits: remote.getPersonMovieCredits,
            getPersonTVCredits: remote.getPersonTVCredits,
            getPersonCombinedCredits: remote.getPersonCombinedCredits,
            getPersonExternalIds: remote.getPersonExternalIds,
            getPersonImages: remote.getPersonImages,
            getPersonTaggedImages: remote.getPersonTaggedImages,
            getPersonTranslations: remote.getPersonTranslations,
            getLatestPerson: remote.getLatestPerson,
            getPopularPerson: remote.getPopularPerson);

      case AppMethodType.Trending:
        return (method as TrendingMethod).map(getTrending: getTrending);

      case AppMethodType.TV:
        return (method as TVMethod).when(
            getTVDetail: remote.getTVDetail,
            getTVAccountState: remote.getTVAccountState,
            getTVAggregateCredit: remote.getTVAggregateCredit,
            getTVAlternativeTitles: remote.getTVAlternativeTitles,
            getTVChanges: remote.getTVChanges,
            getTVContentRating: remote.getTVContentRating,
            getTVCredit: remote.getTVCredit,
            getTVEpisodeGroups: remote.getTVEpisodeGroups,
            getTVExternalId: remote.getTVExternalId,
            getTVImage: remote.getTVImage,
            getTVKeyword: remote.getTVKeyword,
            getTVRecommendation: remote.getTVRecommendation,
            getTVReview: remote.getTVReview,
            getTVScreenedThreatrically: remote.getTVScreenedTheatrically,
            getSimilarTV: remote.getSimilarTV,
            getTVTranslation: remote.getTVTranslation,
            getTVVideo: remote.getTVVideo,
            getTVWatchProvider: remote.getTVWatchProvider,
            rateTV: remote.rateTV,
            deleteTVRate: remote.deleteTVRate,
            getLatestTV: remote.getLatestTV,
            getAiringTodayTV: remote.getAiringTodayTV,
            getOnTheAirTV: remote.getOnTheAirTV,
            getPopularTV: remote.getPopularTV,
            getTopRatedTV: remote.getTopRatedTV);

      case AppMethodType.TVEpisodeGroup:
        return (method as TVEpisodeGroupMethod)
            .when(getTVEpisodeGroupDetail: remote.getTVEpisodeGroupDetail);

      case AppMethodType.WatchProvider:
        return (method as WatchProviderMethod).when(
            getAvailableRegions: remote.getAvailableRegions,
            getMovieProviders: remote.getMovieProviders,
            getTVProviders: remote.getTVProviders);

      case AppMethodType.Unknow:
        throw 'Unknown Method Type: $method';
    }
  }

  RemoteRepository get remote => remoteRepository;
}
