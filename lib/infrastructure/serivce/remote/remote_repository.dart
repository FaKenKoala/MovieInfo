import 'package:dio/dio.dart' hide Headers;
import 'package:injectable/injectable.dart';
import 'package:movie_info/domain/model/account_state/account_state.dart';
import 'package:movie_info/domain/model/api_result/id_result.dart';
import 'package:movie_info/domain/model/code_response/code_response.dart';
import 'package:movie_info/domain/model/configuration/configuration.dart';
import 'package:movie_info/domain/model/media/image.dart';
import 'package:movie_info/domain/model/movie/external_id.dart';
import 'package:movie_info/domain/model/movie/keyword.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/model/movie/movie_change.dart';
import 'package:movie_info/domain/model/movie/movie_credit.dart';
import 'package:movie_info/domain/model/movie/movie_list.dart';
import 'package:movie_info/domain/model/api_result/page_result.dart';
import 'package:movie_info/domain/model/movie/rate_content.dart';
import 'package:movie_info/domain/model/recommendation/recommendation.dart';
import 'package:movie_info/domain/model/release_date/release_date.dart';
import 'package:movie_info/domain/model/review/review.dart';
import 'package:movie_info/domain/model/title/title.dart';
import 'package:movie_info/domain/model/translation/translatetion_list.dart';
import 'package:movie_info/domain/model/watch_provider/watch_provider_list.dart';
import 'package:retrofit/retrofit.dart';
part 'remote_repository.g.dart';

@RestApi()
@singleton
abstract class RemoteRepository {
  @factoryMethod
  factory RemoteRepository(Dio dio, {@Named("baseUrl") String baseUrl}) =
      _RemoteRepository;

  @GET('/configuration')
  Future<Configuration> configuration();

  @GET('/trending/{media_type}/{time_window}')
  Future<PageResult<Movie>> getTrending(
      {@Path('media_type') required String mediaType,
      @Path('time_window') required String timeWindow});

  /// Movie
  @GET('$MoviePrefix')
  Future<Movie> getMovieDetail(
      {@Path(MovieId) required int movieId,
      @Query(Language) required String? language,
      @Query('append_to_response') required String? appendToResponse});

  @GET('$MoviePrefix/account_states')
  Future<AccountState> getMovieAccountState(
      {@Path(MovieId) required int movieId});

  @GET('$MoviePrefix/alternative_titles')
  Future<IDResult<Title>> getMovieAlternativeTitles({
    @Path(MovieId) required int movieId,
    @Query('country') String? country,
  });

  @GET('$MoviePrefix/changes')
  Future<ChangeList> getMovieChanges(
      {@Path(MovieId) required String movieId,
      @Query('start_date') String? startDate,
      @Query('end_date') String? endDate,
      @Query(Page) int? page});

  @GET('$MoviePrefix/credits')
  Future<MovieCredit> getMovieCredit(
      {@Path(MovieId) required int movieId, @Query(Language) String? language});

  @GET('$MoviePrefix/external_ids')
  Future<ExternalId> getMovieExternalId({
    @Path(MovieId) required int movieId,
  });

  @GET('$MoviePrefix/images')
  Future<MovieImage> getMovieImage({
    @Path(MovieId) required int movieId,
    @Query(Language) String? language,
  });

  @GET('$MoviePrefix/keywords')
  Future<IDResult<Keyword>> getMovieKeyword({
    @Path(MovieId) required int movieId,
  });

  @GET('$MoviePrefix/lists')
  Future<PageResult<MovieList>> getMovieBelongList({
    @Path(MovieId) required int movieId,
    @Query(Language) String? language,
    @Query(Page) int? page,
  });

  @GET('$MoviePrefix/recommendations')
  Future<PageResult<Recommendation>> getMovieRecommendation({
    @Path(MovieId) required int movieId,
    @Query(Language) String? language,
    @Query(Page) int? page,
  });

  @GET('$MoviePrefix/release_dates')
  Future<IDResult<ReleaseDateWithCountry>> getMovieReleaseDate({
    @Path(MovieId) required int movieId,
  });

  @GET('$MoviePrefix/reviews')
  Future<PageResult<Review>> getMovieReview({
    @Path(MovieId) required int movieId,
    @Query(Language) String? language,
    @Query(Page) int? page,
  });

  @GET('$MoviePrefix/similar')
  Future<PageResult<Movie>> getSimilarMovie({
    @Path(MovieId) required int movieId,
    @Query(Language) String? language,
    @Query(Page) int? page,
  });

  @GET('$MoviePrefix/translations')
  Future<TranslationList> getMovieTranslation({
    @Path(MovieId) required int movieId,
  });

  @GET('$MoviePrefix/videos')
  Future<TranslationList> movieVideo({
    @Path(MovieId) required int movieId,
    @Query(Language) String? language,
  });

  @GET('$MoviePrefix/watch/providers')
  Future<WatchProviderList> getMovieWatchProvider({
    @Path(MovieId) required int movieId,
  });

  @POST('$MoviePrefix/rating')
  Future<CodeResponse> rateMovie({
    @Path(MovieId) required int movieId,
    @Body() required RateContent content,
  });

  @DELETE('$MoviePrefix/rating')
  Future<CodeResponse> deleteMovieRate({
    @Path(MovieId) required int movieId,
  });

  @GET('/movie/latest')
  Future<Movie> getLatestMovie();

  @GET('/movie/now_playing')
  Future<PageResult<Movie>> getNowPlayingMovie({
    @Query(Language) String? language,
    @Query(Page) int? page,
    @Query('region') String? region,
  });

  @GET('/movie/popular')
  Future<PageResult<Movie>> getPopularMovie({
    @Query(Language) String? language,
    @Query(Page) int? page,
    @Query('region') String? region,
  });

  @GET('/movie/top_rated')
  Future<PageResult<Movie>> getTopRatedMovie({
    @Query(Language) String? language,
    @Query(Page) int? page,
    @Query('region') String? region,
  });

  @GET('/movie/upcoming')
  Future<PageResult<Movie>> getUpcomingMovie({
    @Query(Language) String? language,
    @Query(Page) int? page,
    @Query('region') String? region,
  });
}

const MoviePrefix = '/movie/{$MovieId}';
const MovieId = 'movie_id';
const Language = 'language';
const Page = 'page';
