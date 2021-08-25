import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_info/domain/model/configuration/configuration.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/model/result/api_result.dart';
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

  @GET('/movie/{movie_id}')
  Future movieDetail(
      {@Path('movie_id') required String movieId,
      @Query('language') String? language,
      @Query('append_to_response') String? appendToResponse});

      
}
