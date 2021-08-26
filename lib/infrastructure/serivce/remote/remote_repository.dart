import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_info/domain/model/account_state/account_state.dart';
import 'package:movie_info/domain/model/api_result/id_result.dart';
import 'package:movie_info/domain/model/configuration/configuration.dart';
import 'package:movie_info/domain/model/media/image.dart';
import 'package:movie_info/domain/model/movie/external_id.dart';
import 'package:movie_info/domain/model/movie/keyword.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/model/movie/movie_change.dart';
import 'package:movie_info/domain/model/movie/movie_credit.dart';
import 'package:movie_info/domain/model/movie/movie_list.dart';
import 'package:movie_info/domain/model/api_result/page_result.dart';
import 'package:movie_info/domain/model/recommendation/recommendation.dart';
import 'package:movie_info/domain/model/release_date/release_date.dart';
import 'package:movie_info/domain/model/review/review.dart';
import 'package:movie_info/domain/model/title/title.dart';
import 'package:movie_info/domain/model/translation/translatetion_list.dart';
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
  Future<PageResult<Movie>> trending(
      {@Path('media_type') required String mediaType,
      @Path('time_window') required String timeWindow});

  /// Movie
  @GET('$MoviePrefix')
  Future<Movie> movieDetail(
      {@Path(MovieId) required int movieId,
      @Query(Language) String? language,
      @Query('append_to_response') String? appendToResponse});

  @GET('$MoviePrefix/account_states')
  Future<AccountState> movieAccountState({@Path(MovieId) required int movieId});

  @GET('$MoviePrefix/alternative_titles')
  Future<IDResult<Title>> movieAlternativeTitles({
    @Path(MovieId) required int movieId,
    @Query('country') String? country,
  });

  @GET('$MoviePrefix/changes')
  Future<ChangeList> movieChanges(
      {@Path(MovieId) required String movieId,
      @Query('start_date') String? startDate,
      @Query('end_date') String? endDate,
      @Query(Page) int? page});

  @GET('$MoviePrefix/credits')
  Future<MovieCredit> movieCredit(
      {@Path(MovieId) required int movieId, @Query(Language) String? language});

  @GET('$MoviePrefix/external_ids')
  Future<ExternalId> movieExternalId({
    @Path(MovieId) required int movieId,
  });

  @GET('$MoviePrefix/images')
  Future<MovieImage> movieImage({
    @Path(MovieId) required int movieId,
    @Query(Language) String? language,
  });

  @GET('$MoviePrefix/keywords')
  Future<IDResult<Keyword>> movieKeyword({
    @Path(MovieId) required int movieId,
  });

  @GET('$MoviePrefix/lists')
  Future<PageResult<MovieList>> movieList({
    @Path(MovieId) required int movieId,
    @Query(Language) String? language,
    @Query(Page) int? page,
  });

  @GET('$MoviePrefix/recommendations')
  Future<PageResult<Recommendation>> movieRecommendation({
    @Path(MovieId) required int movieId,
    @Query(Language) String? language,
    @Query(Page) int? page,
  });

  @GET('$MoviePrefix/release_dates')
  Future<IDResult<ReleaseDateWithCountry>> movieReleaseDate({
    @Path(MovieId) required int movieId,
  });

  @GET('$MoviePrefix/reviews')
  Future<PageResult<Review>> movieReview({
    @Path(MovieId) required int movieId,
    @Query(Language) String? language,
    @Query(Page) int? page,
  });

  @GET('$MoviePrefix/similar')
  Future<PageResult<Movie>> movieSimilar({
    @Path(MovieId) required int movieId,
    @Query(Language) String? language,
    @Query(Page) int? page,
  });

  @GET('$MoviePrefix/translations')
  Future<TranslationList> movieTranslation({
    @Path(MovieId) required int movieId,
  });

  @GET('$MoviePrefix/videos')
  Future<TranslationList> movieVideo({
    @Path(MovieId) required int movieId,
    @Query(Language) String? language,
  });
}

const MoviePrefix = '/movie/{$MovieId}';
const MovieId = 'movie_id';
const Language = 'language';
const Page = 'page';
