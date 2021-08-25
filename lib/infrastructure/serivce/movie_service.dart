import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_info/application/get_it/get_it_main.dart';
import 'package:movie_info/domain/model/configuration/configuration.dart';
import 'package:movie_info/domain/model/enum_values/enum_values.dart';
import 'package:movie_info/domain/model/result/api_result.dart';
import 'package:movie_info/domain/model/movie/movie.dart';

import 'package:movie_info/domain/service/i_movie_service.dart';
import 'package:movie_info/infrastructure/movie_method/movie_method.dart';
import 'package:movie_info/infrastructure/util/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'local/local_repository.dart';
import 'remote/remote_repository.dart';

@Singleton(as: IMovieService)
class MovieService extends IMovieService {
  final RemoteRepository remoteRepository;
  final LocalRepository localRepository;
  MovieService(this.remoteRepository, this.localRepository);

  Future<Either<T, Exception>> execute<T>(MovieMethod method) async {
    try {
      return left(await _executeMethod(method));
    } on DioError catch (e) {
      return right(e);
    } on Exception catch (e) {
      return right(e);
    }
  }

  Future _executeMethod(MovieMethod method) async {
    return method.map(trending: getTrending, configuration: getConfiguration);
  }

  Future<ApiResult<Movie>> getTrending(GetTrending getTrending) async {
    return await remoteRepository.trending(
        mediaType: getTrending.mediaType.name,
        timeWindow: getTrending.timeWindow.name);
  }

  Future<Configuration> getConfiguration(
      GetConfiguration getConfiguration) async {
    Option<Configuration> config = localRepository.getConfiguration();
    if (config.isNone()) {
      Configuration remoteConfig = await remoteRepository.configuration();
      getIt<SharedPreferences>()
          .setString(Constants.ImageGlobalConfig, json.encode(remoteConfig.toJson()));
      return remoteConfig;
    }
    throw Exception('no config');
  }
}
