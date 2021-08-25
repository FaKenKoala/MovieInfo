import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/model/result/api_result.dart';
import 'package:retrofit/retrofit.dart';
part 'movie_client.g.dart';

@RestApi()
@singleton
abstract class MovieClient {
  @factoryMethod
  factory MovieClient(Dio dio, {@Named("baseUrl")String baseUrl}) = _MovieClient;

  @GET('/trending/{media_type}/{time_window}')
  Future<ApiResult<Movie>> trending(
      {@Path('media_type') required String mediaType,
      @Path('time_window') required String timeWindow});
}
