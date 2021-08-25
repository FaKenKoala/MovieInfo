import 'package:injectable/injectable.dart';
import 'package:movie_info/domain/model/enum_values/enum_values.dart';
import 'package:movie_info/domain/model/result/result.dart';
import 'package:movie_info/domain/model/movie/movie.dart';

import 'package:movie_info/domain/service/i_movie_service.dart';
import 'package:movie_info/infrastructure/serivce/movie_client/movie_client.dart';

@Singleton(as: IMovieService)
class MovieService extends IMovieService {
  final MovieClient client;
  MovieService(this.client);

  @override
  Future<Result<Movie>> trending(
      {MediaType mediaType = MediaType.ALL,
      TimeWindow timeWindow = TimeWindow.DAY}) async {
    return await client.trending(
        mediaType: mediaType.name, timeWindow: timeWindow.name);
  }
}
