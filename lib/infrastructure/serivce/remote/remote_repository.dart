import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_info/domain/model/account_state/account_state.dart';
import 'package:movie_info/domain/model/configuration/configuration.dart';
import 'package:movie_info/domain/model/movie/external_id.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/model/movie/movie_change.dart';
import 'package:movie_info/domain/model/movie/movie_credit.dart';
import 'package:movie_info/domain/model/result/api_result.dart';
import 'package:movie_info/domain/model/title/title.dart';
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
  Future<ApiResult<Movie>> trending(
      {@Path('media_type') required String mediaType,
      @Path('time_window') required String timeWindow});

  /// Movie
  @GET('$MoviePrefix')
  Future<Movie> movieDetail(
      {@Path(MovieId) required int movieId,
      @Query('language') String? language,
      @Query('append_to_response') String? appendToResponse});

  @GET('$MoviePrefix/account_states')
  Future<AccountState> movieAccountState({@Path(MovieId) required int movieId});

  @GET('$MoviePrefix/alternative_titles')
  Future<AlternativeTitles> movieAlternativeTitles({
    @Path(MovieId) required int movieId,
    @Query('country') String? country,
  });

  @GET('$MoviePrefix/changes')
  Future<Changes> movieChanges(
      {@Path(MovieId) required String movieId,
      @Query('start_date') String? startDate,
      @Query('end_date') String? endDate,
      @Query('page') int? page});

  @GET('$MoviePrefix/credits')
  Future<MovieCredit> movieCredit(
      {@Path(MovieId) required int movieId,
      @Query('language') String? language});

  @GET('$MoviePrefix/external_ids')
  Future<ExternalId> movieExternalId({
    @Path(MovieId) required int movieId,
  });

}

const MoviePrefix = '/movie/{$MovieId}';
const MovieId = 'movie_id';
