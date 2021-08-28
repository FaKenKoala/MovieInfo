import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_info/application/get_it/get_it_main.dart';
import 'package:movie_info/domain/model/api_result/id_result.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/model/movie/rate_content.dart';
import 'package:movie_info/domain/model/tv/episode_group.dart';
import 'package:movie_info/domain/model/tv/tv.dart';
import 'package:movie_info/domain/service/i_app_service.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';
import 'package:movie_info/infrastructure/app_method/app_method_part/genre_method.dart';
import 'package:movie_info/infrastructure/app_method/app_method_part/movie_method.dart';
import 'package:movie_info/infrastructure/app_method/app_method_part/tv_episode_group_method.dart';
import 'package:movie_info/infrastructure/app_method/app_method_part/tv_method.dart';
import 'package:movie_info/infrastructure/util/dio_logger.dart';
import 'package:movie_info/infrastructure/util/http_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:collection/collection.dart';

class ApiTest {
  static ApiTest? _instance;

  final _service = getIt<IAppService>();

  void movieTest(Movie movie) {
    // _service.execute(GetMovieDetail(movieId: movie.id));
    _service.execute(GetMovieCredit(movieId: movie.id));
  }

  /// TV
  void tvApiTest(TV tv) {
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

  /// watch provider
  providerTest() {
    // _service.execute(GetAvailableRegions());
    // _service.execute(GetMovieProviders(watchRegion: 'US'));
    // _service.execute(GetTVProviders(watchRegion: 'US'));
  }

  /// Network
  networkTest() {
    // _service.execute(GetNetworkDetail(networkId: 49));
    // _service.execute(GetNetwrokAlternativeNames(networkId: 49));
    // _service.execute(GetNetworkLogos(networkId: 49));
  }

  keywordTest() {
    // _service.execute(GetKeywordDetail(keywordId: 13084));
    _service.execute(GetKeywordMovies(keywordId: 13084));
  }

  genreTest() {
    // _service.execute(GetMovieGenreList());
    _service.execute(GetTVGenreList());
  }

  companyTest() {
    // _service.execute(GetCompanyDetail(companyId: 7493));
    // _service.execute(GetCompanyAlternativeNames(companyId: 7493));
    _service.execute(GetCompanyLogos(companyId: 7493));
  }

  collectionTest() {
    // _service.execute(GetCollectionDetail(collectionId: 98580));
    // _service.execute(GetCollectionImages(collectionId: 98580));
    _service.execute(GetCollectionTranslations(collectionId: 98580));
  }

  changeTest() {
    // _service.execute(GetChangeMovies());
    // _service.execute(GetChangeTVs());
    _service.execute(GetChangePersons());
  }

  creditTest() {
    String castCreditid = '5e581ca8f48b34001779f896';
    String crewCreditId = '5d93cc14a06efe0012596ec1';
    _service.execute(GetCreditDetail(creditId: crewCreditId));
  }

  personTest() {
    int personId = 7902;
    //31211;

    // _service.execute(GetPersonDetail(personId: 1));

    _service.execute(GetPersonMovieCredits(personId: 53123));
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
