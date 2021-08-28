import 'package:dio/dio.dart';
import 'package:movie_info/application/get_it/get_it_main.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/model/tv/tv.dart';
import 'package:movie_info/domain/service/i_app_service.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';
import 'package:movie_info/infrastructure/app_method/app_method_part/certification_method.dart';
import 'package:movie_info/infrastructure/app_method/app_method_part/genre_method.dart';
import 'package:movie_info/infrastructure/app_method/app_method_part/review_method.dart';
import 'package:movie_info/infrastructure/app_method/app_method_part/tv_season_method.dart';
import 'package:movie_info/infrastructure/util/dio_logger.dart';
import 'package:movie_info/infrastructure/util/http_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiTest {
  static ApiTest? _instance;

  final _service = getIt<IAppService>();

  accountTest() {
    // TODO: 11
  }

  authenticationTest() {
    // TODO: 6
  }

  certificationTest() {
    // 2
    // _service.execute(GetCertificationMovieList());
    _service.execute(GetCertificationTVList());
  }

  changeTest() {
    /// 3
    // _service.execute(GetChangeMovies());
    // _service.execute(GetChangeTVs());
    _service.execute(GetChangePersons());
  }

  collectionTest() {
    /// 3
    // _service.execute(GetCollectionDetail(collectionId: 98580));
    // _service.execute(GetCollectionImages(collectionId: 98580));
    _service.execute(GetCollectionTranslations(collectionId: 98580));
  }

  companyTest() {
    /// 3
    // _service.execute(GetCompanyDetail(companyId: 7493));
    // _service.execute(GetCompanyAlternativeNames(companyId: 7493));
    _service.execute(GetCompanyLogos(companyId: 7493));
  }

  configurationTest() {
    /// 6
    // _service.execute(GetConfigurationCountries());
    // _service.execute(GetConfigurationJobs());
    // _service.execute(GetConfigurationLanguages());
    // _service.execute(GetConfigurationTranslations());
    _service.execute(GetConfigurationTimezones());
  }

  creditTest() {
    /// 1 + 2 +1
    // String castCreditid = '5e581ca8f48b34001779f896';
    String crewCreditId = '5d93cc14a06efe0012596ec1';
    _service.execute(GetCreditDetail(creditId: crewCreditId));
  }

  genreTest() {
    // 2
    // _service.execute(GetMovieGenreList());
    _service.execute(GetTVGenreList());
  }

  guestSessionTest() {
    // TODO: 3
  }

  keywordTest() {
    // 2
    // _service.execute(GetKeywordDetail(keywordId: 13084));
    _service.execute(GetKeywordMovies(keywordId: 13084));
  }

  listTest() {
    // TODO: 7
  }

  void movieTest(Movie movie) {
    /// 23
    // _service.execute(GetMovieDetail(movieId: movie.id));
    // _service.execute(GetMovieCredit(movieId: movie.id));
    // _service.execute(GetMovieReview(movieId: movie.id));
  }

  /// Network
  networkTest() {
    /// 3 + 1
    // _service.execute(GetNetworkDetail(networkId: 49));
    // _service.execute(GetNetwrokAlternativeNames(networkId: 49));
    // _service.execute(GetNetworkLogos(networkId: 49));
  }

  personTest() {
    /// 11
    int personId = 169337;
    //31211;

    // _service.execute(GetPersonDetail(personId: 1));
    // _service.execute(GetPersonChanges(personId: 1));

    // _service.execute(GetPersonMovieCredits(personId: 53123));
    // _service.execute(GetPersonTVCredits(personId: 53123));
    // _service.execute(GetPersonCombinedCredits(personId: 53123));
    // _service.execute(GetPersonExternalIds(personId: 53123));
    _service.execute(GetPersonImages(personId: personId));
    // _service.execute(GetPersonTaggedImages(personId: personId));
    // _service.execute(GetPersonTranslations(personId: 1234));
    // _service.execute(GetLatestPerson());
    // _service.execute(GetPopularPerson());
  }

  reviewTest() {
    // 1
    _service.execute(GetReviewDetail(reviewId: '61048d3d688cd0007f215a28'));
  }

  searchTest() {
    // TODO: 7
  }

  /// TV
  void tvTest(TV tv) {
    /// 25
    ///
    // _service.execute(GetTVDetail(tvId: tv.id));
    // service.execute(GetTVAccountState(tvId: tv.id));
    // _service.execute(GetTVAggregateCredit(tvId: tv.id));
    // _service.execute(GetTVAlternativeTitles(tvId: tv.id));
    // _service.execute(GetTVChanges(tvId: tv.id));
    // _service.execute(GetTVContentRating(tvId: tv.id));
    // _service.execute(GetTVCredit(tvId: tv.id));
    // _service.execute(GetTVEpisodeGroups(tvId: tv.id)).then((value) {
    //   value.fold((l) => null, (r) {
    //     if (r is IDResult<EpisodeGroup>) {
    //       catching(() => r.results.first).toOption().flatMap(
    //           (a) => some(_service.execute(GetTVEpisodeGroupDetail(id: a.id))));
    //     }
    //   });
    // });
    // _service.execute(GetTVExternalId(tvId: tv.id));
    // _service.execute(GetTVImage(tvId: tv.id));
    // _service.execute(GetTVKeyword(tvId: tv.id));
    // _service.execute(GetTVRecommendation(tvId: tv.id));
    // _service.execute(GetTVReview(tvId: tv.id));
    // _service.execute(GetScreenedThreatricallyTV(tvId: tv.id));
    // _service.execute(GetSimilarTV(tvId: tv.id));
    // _service.execute(GetTVTranslation(tvId: tv.id));
    // _service.execute(GetTVVideo(tvId: tv.id));
    // _service.execute(GetTVWatchProvider(tvId: tv.id));
    // _service.execute(RateTV(tvId: tv.id,rateContent: RateContent(value: 10)));
    // _service.execute(DeleteTVRate(tvId: tv.id));
    // _service.execute(GetLatestTV());
    // _service.execute(GetAiringTodayTV());
    // _service.execute(GetOnTheAirTV());
    // _service.execute(GetPopularTV());
    // _service.execute(GetTopRatedTV());
  }

  tvSeasonsTest(TV tv) {
    // TODO: 9
    int seasonId = 3624;
    // _service.execute(GetTVSeasonDetail(tvId: tv.id, seasonNumber: 1));
    // _service.execute(GetTVSeasonAcountState(tvId: tv.id, seasonNumber: 1));
    // _service.execute(GetTVSeasonAggregatedCredits(tvId: tv.id, seasonNumber: 1));

    // _service.execute(GetTVSeasonChange(seasonId: seasonId));

    // _service.execute(GetTVSeasonCredits(tvId: tv.id, seasonNumber: 1));
    // _service.execute(GetTVSeasonExternalID(tvId: tv.id, seasonNumber: 1));

    // _service.execute(GetTVSeasonImage(tvId: tv.id, seasonNumber: 1));
    // _service.execute(GetTVSeasonTranslations(tvId: tv.id, seasonNumber: 1));
    _service.execute(GetTVSeasonVideos(tvId: tv.id, seasonNumber: 1));
  }

  tvEpisodesTest(
    TV tv,
  ) {
    // TODO: 10
  }

  /// watch provider
  providerTest() {
    /// 1 + 3
    // _service.execute(GetAvailableRegions());
    // _service.execute(GetMovieProviders(watchRegion: 'US'));
    // _service.execute(GetTVProviders(watchRegion: 'US'));
  }

  ApiTest._() {
    addDioLogger(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: false,
        error: false));
    getIt<Dio>()..interceptors.add(HttpInterceptor());
  }
  static ApiTest get instance {
    if (_instance == null) {
      _instance = ApiTest._();
    }

    return _instance!;
  }
}
