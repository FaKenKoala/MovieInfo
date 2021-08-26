import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_info/application/get_it/get_it_main.dart';
import 'package:movie_info/domain/model/account_state/account_state.dart';
import 'package:movie_info/domain/model/api_result/id_result.dart';
import 'package:movie_info/domain/model/configuration/configuration.dart';
import 'package:movie_info/domain/model/enum_values/enum_values.dart';
import 'package:movie_info/domain/model/error_response/error_response.dart';
import 'package:movie_info/domain/model/error_response/movie_exception.dart';
import 'package:movie_info/domain/model/media/image.dart';
import 'package:movie_info/domain/model/movie/external_id.dart';
import 'package:movie_info/domain/model/movie/keyword.dart';
import 'package:movie_info/domain/model/movie/movie_change.dart';
import 'package:movie_info/domain/model/movie/movie_credit.dart';
import 'package:movie_info/domain/model/movie/movie_list.dart';
import 'package:movie_info/domain/model/api_result/page_result.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/model/recommendation/recommendation.dart';
import 'package:movie_info/domain/model/release_date/release_date.dart';
import 'package:movie_info/domain/model/review/review.dart';
import 'package:movie_info/domain/model/title/title.dart';
import 'package:movie_info/domain/model/translation/translatetion_list.dart';

import 'package:movie_info/domain/service/i_movie_service.dart';
import 'package:movie_info/infrastructure/movie_method/movie_method.dart';
import 'package:movie_info/infrastructure/util/constant.dart';
import 'package:movie_info/infrastructure/util/movie_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'local/local_repository.dart';
import 'remote/remote_repository.dart';

@Singleton(as: IMovieService)
class MovieService extends IMovieService {
  final RemoteRepository remoteRepository;
  final LocalRepository localRepository;
  MovieService(this.remoteRepository, this.localRepository);

  Future<MovieExceptionEither<T>> execute<T>(MovieMethod method) async {
    /// 这个_executeMethod方法应该用编译时注解自动生成代码，格式时根据method.map的参数名称 {name}，
    /// 生成 name: get{name.firstUppercase}的方法调用，如同现有的_executeMethod所展示的一样。
    ///
    /// 这个方法也可以自动生成，格式是： remoteRepository.{name},参数就根据method的所有参数依此赋值
    try {
      return right(await _executeMethod(method));
    } catch (e) {
      MovieException? movieException;
      if (e is DioError) {
        try {
          ErrorResponse errorResponse =
              ErrorResponse.fromJson(e.response?.data);
          movieException = MovieException(errorResponse: errorResponse);
        } catch (_) {}
      }
      movieException ??= MovieException(message: e);
      MovieLog.print('${method.runtimeType} $movieException');
      return left(movieException);
    }
  }

  Future _executeMethod(MovieMethod method) async {
    return method.map(
        configuration: getConfiguration,
        trending: getTrending,
        movieDetail: getMovieDetail,
        movieAccountState: getMovieAccountState,
        movieAlternativeTitles: getMovieAlterNativeTiles,
        movieChanges: getMovieChanges,
        movieCredit: getMovieCredit,
        movieExternalId: getMovieExternalId,
        movieImage: getMovieImage,
        movieKeyword: getMovieKeyword,
        movieList: getMovieList,
        moveiRecommendation: getMovieRecommendation,
        movieReleaseDate: getMovieReleaseDate,
        movieReview: getMovieReview,
        movieSimilar: getMovieSimilar,
        movieTranslation: getMovieTranslation,
        movieVideo: getMovieVideo);
  }

  /// Configuration
  Future<Configuration> getConfiguration(
      GetConfiguration getConfiguration) async {
    return localRepository.getConfiguration().fold(() async {
      Configuration remoteConfig = await remoteRepository.configuration();
      getIt<SharedPreferences>().setString(
          Constants.ImageGlobalConfig, json.encode(remoteConfig.toJson()));
      return remoteConfig;
    }, (a) => a);
  }

  /// Trending
  Future<PageResult<Movie>> getTrending(GetTrending getTrending) async {
    return await remoteRepository.trending(
        mediaType: getTrending.mediaType.name,
        timeWindow: getTrending.timeWindow.name);
  }

  /// Movie Details
  Future<Movie> getMovieDetail(GetMovieDetail getMovieDetail) async {
    return await remoteRepository.movieDetail(
        movieId: getMovieDetail.movieId,
        language: getMovieDetail.language,
        appendToResponse: getMovieDetail.appendToResponse);
  }

  /// Movie Account State
  Future<AccountState> getMovieAccountState(
      GetMovieAccountState getMovieAccountState) async {
    return await remoteRepository.movieAccountState(
      movieId: getMovieAccountState.movieId,
    );
  }

  /// Movie Alternative Titles
  Future<IDResult<Title>> getMovieAlterNativeTiles(
      GetMovieAlternativeTitles titles) async {
    return await remoteRepository.movieAlternativeTitles(
      movieId: titles.movieId,
      country: titles.country,
    );
  }

  /// Movie Changes
  Future<ChangeList> getMovieChanges(
    GetMovieChanges changes,
  ) async {
    return await remoteRepository.movieChanges(
      movieId: changes.movieId,
      startDate: changes.startDate,
      endDate: changes.endDate,
      page: changes.page,
    );
  }

  /// Movie Credits
  Future<MovieCredit> getMovieCredit(GetMovieCredit credit) async {
    return await remoteRepository.movieCredit(
      movieId: credit.movieId,
      language: credit.language,
    );
  }

  /// Movie External Ids
  Future<ExternalId> getMovieExternalId(GetMovieExternalId id) async {
    return await remoteRepository.movieExternalId(movieId: id.movieId);
  }

  /// Movie Images
  Future<MovieImage> getMovieImage(GetMovieImage image) async {
    return await remoteRepository.movieImage(
        movieId: image.movieId, language: image.language);
  }

  /// Movie Changes
  Future<IDResult<Keyword>> getMovieKeyword(GetMovieKeyword change) async {
    return await remoteRepository.movieKeyword(movieId: change.movieId);
  }

  /// Movie Lists belongs to
  Future<PageResult<MovieList>> getMovieList(GetMovieList list) async {
    return await remoteRepository.movieList(
        movieId: list.movieId, language: list.language, page: list.page);
  }

  /// Movie Lists belongs to
  Future<PageResult<Recommendation>> getMovieRecommendation(
      GetMovieRecommendation list) async {
    return await remoteRepository.movieRecommendation(
        movieId: list.movieId, language: list.language, page: list.page);
  }

  /// Movie Release Dates
  Future<IDResult<ReleaseDateWithCountry>> getMovieReleaseDate(
      GetMovieReleaseDate date) async {
    return await remoteRepository.movieReleaseDate(
      movieId: date.movieId,
    );
  }

  /// Movie Lists belongs to
  Future<PageResult<Review>> getMovieReview(GetMovieReview review) async {
    return await remoteRepository.movieReview(
        movieId: review.movieId, language: review.language, page: review.page);
  }

  /// Movie Lists belongs to
  Future<PageResult<Movie>> getMovieSimilar(GetMovieSimilar similar) async {
    return await remoteRepository.movieSimilar(
        movieId: similar.movieId,
        language: similar.language,
        page: similar.page);
  }

  /// Movie Translations
  Future<TranslationList> getMovieTranslation(
      GetMovieTranslation translation) async {
    return await remoteRepository.movieTranslation(
      movieId: translation.movieId,
    );
  }

  /// Movie Videos
  Future<TranslationList> getMovieVideo(GetMovieVideo video) async {
    return await remoteRepository.movieVideo(
      movieId: video.movieId,
      language: video.language,
    );
  }
}
