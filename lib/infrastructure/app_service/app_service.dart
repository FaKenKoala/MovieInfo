import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_info/application/get_it/get_it_main.dart';
import 'package:movie_info/application/util/app_config.dart';
import 'package:movie_info/domain/model/api_result/page_result.dart';
import 'package:movie_info/domain/model/authentication/account.dart';
import 'package:movie_info/domain/model/authentication/guest_session.dart';
import 'package:movie_info/domain/model/authentication/request_token.dart';
import 'package:movie_info/domain/model/authentication/session.dart';
import 'package:movie_info/domain/model/change/change.dart';
import 'package:movie_info/domain/model/code_response/app_exception.dart';
import 'package:movie_info/domain/model/code_response/code_response.dart';
import 'package:movie_info/domain/model/configuration/configuration.dart';
import 'package:movie_info/domain/model/enum_values/enum_values.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/model/person/person.dart';
import 'package:movie_info/domain/model/tv/episode.dart';
import 'package:movie_info/domain/model/tv/tv.dart';
import 'package:movie_info/domain/service/i_app_service.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';
import 'package:movie_info/infrastructure/app_method/app_method_part/account_method.dart';
import 'package:movie_info/infrastructure/app_method/app_method_part/authentication_method.dart';
import 'package:movie_info/infrastructure/app_method/app_method_part/guest_session_method.dart';
import 'package:movie_info/infrastructure/util/constant.dart';
import 'package:movie_info/infrastructure/util/date_util.dart';
import 'package:movie_info/infrastructure/util/movie_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:movie_info/infrastructure/repository/local/local_repository.dart';
import 'package:movie_info/infrastructure/repository/remote/remote_repository.dart';

part 'app_service_part/account_service.dart';
part 'app_service_part/authentication_service.dart';
part 'app_service_part/certification_service.dart';
part 'app_service_part/change_service.dart';
part 'app_service_part/collection_service.dart';
part 'app_service_part/company_service.dart';
part 'app_service_part/configuration_service.dart';
part 'app_service_part/credit_service.dart';
part 'app_service_part/discover_service.dart';
part 'app_service_part/external_id_service.dart';
part 'app_service_part/genre_service.dart';
part 'app_service_part/guest_session_service.dart';
part 'app_service_part/keyword_service.dart';
part 'app_service_part/list_service.dart';
part 'app_service_part/movie_service.dart';
part 'app_service_part/network_service.dart';
part 'app_service_part/person_service.dart';
part 'app_service_part/review_service.dart';
part 'app_service_part/search_service.dart';
part 'app_service_part/trending_service.dart';
part 'app_service_part/tv_episode_group_service.dart';
part 'app_service_part/tv_episode_service.dart';
part 'app_service_part/tv_season_service.dart';
part 'app_service_part/tv_service.dart';
part 'app_service_part/watch_provider_service.dart';

abstract class AppServicePart {
  final LocalRepository localRepository;
  final RemoteRepository remoteRepository;
  AppServicePart._(this.remoteRepository, this.localRepository);
}

@Singleton(as: IAppService)
class AppService extends AppServicePart
    with
        AccountService,
        AuthenticationService,
        CertificationService,
        ChangeService,
        CollectionService,
        CompanyService,
        ConfigurationService,
        CreditService,
        DiscoverService,
        ExternalIDService,
        GenreService,
        KeywordService,
        ListService,
        MovieService,
        GuestSessionService,
        NetworkService,
        PersonService,
        ReviewService,
        SearchService,
        TrendingService,
        TVEpisodeGroupService,
        TVEpisodeService,
        TVSeasonService,
        TVService,
        WatchProviderService
    implements IAppService {
  AppService(RemoteRepository remote, LocalRepository localRepository)
      : super._(remote, localRepository);

  @override
  Future<Either<AppException, T>> execute<T>(AppMethod method) async {
    try {
      var finalResult = await _executeMethod(method);
      catching(() {
        // MovieLog.printJson('${finalResult.toString()}');
      });
      return right(finalResult);
    } catch (exception) {
      AppException finalException = catching(() {
        CodeResponse errorResponse =
            CodeResponse.fromJson((exception as DioError).response?.data);
        return AppException(codeResponse: errorResponse);
      }).swap().map((_) {
        return AppException(message: exception);
      }).fold(id, id);

      MovieLog.printS('${method.runtimeType} $finalException');
      return left(finalException);
    }
  }

  Future _executeMethod(AppMethod method) async {
    switch (method.methodType) {
      case AppMethodType.Account:
        return (method as AccountMethod).map(
            getAccountDetail: getAccountDetail,
            getCreatedList: getCreatedList,
            getFavoriteMovies: getFavoriteMovies,
            getFavoriteTVs: getFavoriteTVs,
            markAsFavorite: markAsFavorite,
            getAccountRatedMovies: getAccountRatedMovies,
            getAccountRatedTVs: getAccountRatedTVs,
            getAccountRatedTVEpisodes: getAccountRatedTVEpisodes,
            getMovieWatchlist: getMovieWatchlist,
            getTVWatchlist: getTVWatchlist,
            addToWatchlist: addToWatchlist);

      case AppMethodType.Authentication:
        return (method as AuthenticationMethod).when(
            getGuestSession: getGuestSession,
            getRequestToken: getRequestToken,
            createSession: createSession,
            createSessionWithLogin: createSessionWithLogin,
            createSessionV4: createSessionV4,
            deleteSession: deleteSession);

      case AppMethodType.Certification:
        return (method as CertificationMethod).when(
            getCertificationMovieList: getCertificationMovieList,
            getCertificationTVList: getCertificationTVList);

      case AppMethodType.Change:
        return (method as ChangeMethod).when(
            getChangeMovies: getChangeMovies,
            getChangeTVs: getChangeTVs,
            getChangePersons: getChangePersons);

      case AppMethodType.Collection:
        return (method as CollectionMethod).when(
            getCollectionDetail: getCollectionDetail,
            getCollectionImages: getCollectionImages,
            getCollectionTranslations: getCollectionTranslations);

      case AppMethodType.Company:
        return (method as CompanyMethod).when(
            getCompanyDetail: getCompanyDetail,
            getCompanyAlternativeNames: getCompanyAlternativeNames,
            getCompanyLogos: getCompanyLogos);

      case AppMethodType.Configuration:
        return (method as ConfigurationMethod).when(
            getAPIConfiguration: getAPIConfiguration,
            getConfigurationCountries: getConfigurationCountries,
            getConfigurationJobs: getConfigurationJobs,
            getConfigurationLanguages: getConfigurationLanguages,
            getConfigurationTranslations: getConfigurationTranslations,
            getConfigurationTimezones: getConfigurationTimezones);

      case AppMethodType.Credit:
        return (method as CreditMethod).when(getCreditDetail: getCreditDetail);

      case AppMethodType.Discover:
        return (method as DiscoverMethod)
            .map(discoverMovie: discoverMovie, discoverTV: discoverTV);

      case AppMethodType.Find:
        return (method as FindMethod).when(findByExternalID: findByExternalID);

      case AppMethodType.GuestSession:
        return (method as GuestSessionMethod).when(
            getRatedMovies: getRatedMovies,
            getRatedTVs: getRatedTVs,
            getRatedTVEpisodes: getRatedTVEpisodes);

      case AppMethodType.Genre:
        return (method as GenreMethod)
          ..when(
              getMovieGenreList: getMovieGenreList,
              getTVGenreList: getTVGenreList);

      case AppMethodType.Keyword:
        return (method as KeywordMethod).when(
            getKeywordDetail: getKeywordDetail,
            getKeywordMovies: getKeywordMovies);
      case AppMethodType.List:
        return (method as ListMethod).when(
            getMediaListDetail: getMediaListDetail,
            getMediaListItemStatus: getMediaListItemStatus,
            createMediaList: createMediaList,
            addMediaListItem: addMediaListItem,
            removeMediaListItem: removeMediaListItem,
            clearMediaList: clearMediaList,
            deleteMediaList: deleteMediaList);

      case AppMethodType.Movie:
        return (method as MovieMethod).when(
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
            getSimilarMovie: getSimilarMovie,
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

      case AppMethodType.Network:
        return (method as NetworkMethod).when(
            getNetworkDetail: getNetworkDetail,
            getNetworkAlternativeNames: getNetworkAlternativeNames,
            getNetworkLogos: getNetworkLogos);

      case AppMethodType.Person:
        return (method as PersonMethod).when(
            getPersonDetail: getPersonDetail,
            getPersonChanges: getPersonChanges,
            getPersonMovieCredits: getPersonMovieCredits,
            getPersonTVCredits: getPersonTVCredits,
            getPersonCombinedCredits: getPersonCombinedCredits,
            getPersonExternalIds: getPersonExternalIds,
            getPersonImages: getPersonImages,
            getPersonTaggedImages: getPersonTaggedImages,
            getPersonTranslations: getPersonTranslations,
            getLatestPerson: getLatestPerson,
            getPopularPerson: getPopularPerson);

      case AppMethodType.Search:
        return (method as SearchMethod).when(
            searchCompany: searchCompany,
            searchCollection: searchCollection,
            searchKeyword: searchKeyword,
            searchMovie: searchMovie,
            multiSearch: multiSearch,
            searchPerson: searchPerson,
            searchTV: searchTV);

      case AppMethodType.Review:
        return (method as ReviewMethod).when(getReviewDetail: getReviewDetail);

      case AppMethodType.Trending:
        return (method as TrendingMethod).map(
            getMovieTrending: getMovieTrending,
            getTVTrending: getTVTrending,
            getPersonTrending: getPersonTrending,
            getTrending: getTrending);

      case AppMethodType.TV:
        return (method as TVMethod).when(
            getTVDetail: getTVDetail,
            getTVAccountState: getTVAccountState,
            getTVAggregateCredit: getTVAggregateCredit,
            getTVAlternativeTitles: getTVAlternativeTitles,
            getTVChanges: getTVChanges,
            getTVContentRating: getTVContentRating,
            getTVCredit: getTVCredit,
            getTVEpisodeGroups: getTVEpisodeGroups,
            getTVExternalId: getTVExternalId,
            getTVImage: getTVImage,
            getTVKeyword: getTVKeyword,
            getTVRecommendation: getTVRecommendation,
            getTVReview: getTVReview,
            getTVScreenedTheatrically: getTVScreenedTheatrically,
            getSimilarTV: getSimilarTV,
            getTVTranslation: getTVTranslation,
            getTVVideo: getTVVideo,
            getTVWatchProvider: getTVWatchProvider,
            rateTV: rateTV,
            deleteTVRate: deleteTVRate,
            getLatestTV: getLatestTV,
            getAiringTodayTV: getAiringTodayTV,
            getOnTheAirTV: getOnTheAirTV,
            getPopularTV: getPopularTV,
            getTopRatedTV: getTopRatedTV);

      case AppMethodType.TVSeason:
        return (method as TVSeasonMethod).when(
            getTVSeasonDetail: getTVSeasonDetail,
            getTVSeasonAccountState: getTVSeasonAccountState,
            getTVSeasonAggregatedCredits: getTVSeasonAggregatedCredits,
            getTVSeasonChange: getTVSeasonChange,
            getTVSeasonCredits: getTVSeasonCredits,
            getTVSeasonExternalID: getTVSeasonExternalID,
            getTVSeasonImage: getTVSeasonImage,
            getTVSeasonTranslations: getTVSeasonTranslations,
            getTVSeasonVideos: getTVSeasonVideos);

      case AppMethodType.TVEpisode:
        return (method as TVEpisodeMethod).when(
            getTVEpisodeDetail: getTVEpisodeDetail,
            getTVEpisodeAccountState: getTVEpisodeAccountState,
            getTVEpisodeChange: getTVEpisodeChange,
            getTVEpisodeCredits: getTVEpisodeCredits,
            getTVEpisodeExternalID: getTVEpisodeExternalID,
            getTVEpisodeImage: getTVEpisodeImage,
            getTVEpisodeTranslations: getTVEpisodeTranslations,
            getTVEpisodeVideo: getTVEpisodeVideo,
            rateTVEpisode: rateTVEpisode,
            deleteRateTVEpisode: deleteRateTVEpisode);

      case AppMethodType.TVEpisodeGroup:
        return (method as TVEpisodeGroupMethod)
            .when(getTVEpisodeGroupDetail: getTVEpisodeGroupDetail);

      case AppMethodType.WatchProvider:
        return (method as WatchProviderMethod).when(
            getAvailableRegions: getAvailableRegions,
            getMovieProviders: getMovieProviders,
            getTVProviders: getTVProviders);

      case AppMethodType.Unknow:
        throw 'Unknown Method Type: $method';
    }
  }
}
