import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_info/application/get_it/get_it_main.dart';
import 'package:movie_info/domain/model/account_state/account_state.dart';
import 'package:movie_info/domain/model/api_result/id_result.dart';
import 'package:movie_info/domain/model/code_response/code_response.dart';
import 'package:movie_info/domain/model/configuration/configuration.dart';
import 'package:movie_info/domain/model/enum_values/enum_values.dart';
import 'package:movie_info/domain/model/code_response/movie_exception.dart';
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
import 'package:movie_info/domain/model/watch_provider/watch_provider_list.dart';

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
          CodeResponse errorResponse = CodeResponse.fromJson(e.response?.data);
          movieException = MovieException(codeResponse: errorResponse);
        } catch (_) {}
      }
      movieException ??= MovieException(message: e);
      MovieLog.print('${method.runtimeType} $movieException');
      return left(movieException);
    }
  }

  Future _executeMethod(MovieMethod method) async {
    return method.map(
        getConfiguration: getConfiguration,
        getTrending: getTrending,
        getMovieDetail: getMovieDetail,
        getMovieAccountState: getMovieAccountState,
        getMovieAlternativeTitles: getMovieAlterNativeTiles,
        getMovieChanges: getMovieChanges,
        getMovieCredit: getMovieCredit,
        getMovieExternalId: getMovieExternalId,
        getMovieImage: getMovieImage,
        getMovieKeyword: getMovieKeyword,
        getMovieList: getMovieBelongList,
        getMoveiRecommendation: getMovieRecommendation,
        getMovieReleaseDate: getMovieReleaseDate,
        getMovieReview: getMovieReview,
        getMovieSimilar: getMovieSimilar,
        getMovieTranslation: getMovieTranslation,
        getMovieVideo: getMovieVideo,
        getMovieWatchProvider: getMovieWatchProvider,
        rateMovie: rateMovie,
        deleteMovieRate: delteMovieRate,
        getLatestMovie: getLatestMovie,
        getNowPlayingMovie: getNowPlayingMovie,
        getPopularMovie: getPopularMovie,
        getTopRatedMovie: getTopRatedMovie,
        getUpcomingMovie: getUpcomingMovie);
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
    return await remoteRepository.getTrending(
        mediaType: getTrending.mediaType.name,
        timeWindow: getTrending.timeWindow.name);
  }

  /// Movie Details
  Future<Movie> getMovieDetail(GetMovieDetail getMovieDetail) async {
    return await remoteRepository.getMovieDetail(
        movieId: getMovieDetail.movieId,
        language: getMovieDetail.language,
        appendToResponse: getMovieDetail.appendToResponse);
  }

  /// Movie Account State
  Future<AccountState> getMovieAccountState(
      GetMovieAccountState getMovieAccountState) async {
    return await remoteRepository.getMovieAccountState(
      movieId: getMovieAccountState.movieId,
    );
  }

  /// Movie Alternative Titles
  Future<IDResult<Title>> getMovieAlterNativeTiles(
      GetMovieAlternativeTitles titles) async {
    return await remoteRepository.getMovieAlternativeTitles(
      movieId: titles.movieId,
      country: titles.country,
    );
  }

  /// Movie Changes
  Future<ChangeList> getMovieChanges(
    GetMovieChanges changes,
  ) async {
    return await remoteRepository.getMovieChanges(
      movieId: changes.movieId,
      startDate: changes.startDate,
      endDate: changes.endDate,
      page: changes.page,
    );
  }

  /// Movie Credits
  Future<MovieCredit> getMovieCredit(GetMovieCredit credit) async {
    return await remoteRepository.getMovieCredit(
      movieId: credit.movieId,
      language: credit.language,
    );
  }

  /// Movie External Ids
  Future<ExternalId> getMovieExternalId(GetMovieExternalId id) async {
    return await remoteRepository.getMovieExternalId(movieId: id.movieId);
  }

  /// Movie Images
  Future<MovieImage> getMovieImage(GetMovieImage image) async {
    return await remoteRepository.getMovieImage(
        movieId: image.movieId, language: image.language);
  }

  /// Movie Changes
  Future<IDResult<Keyword>> getMovieKeyword(GetMovieKeyword change) async {
    return await remoteRepository.getMovieKeyword(movieId: change.movieId);
  }

  /// Movie Lists belongs to
  Future<PageResult<MovieList>> getMovieBelongList(
      GetMovieBelongList list) async {
    return await remoteRepository.getMovieBelongList(
        movieId: list.movieId, language: list.language, page: list.page);
  }

  /// Movie Lists belongs to
  Future<PageResult<Recommendation>> getMovieRecommendation(
      GetMovieRecommendation list) async {
    return await remoteRepository.getMovieRecommendation(
        movieId: list.movieId, language: list.language, page: list.page);
  }

  /// Movie Release Dates
  Future<IDResult<ReleaseDateWithCountry>> getMovieReleaseDate(
      GetMovieReleaseDate date) async {
    return await remoteRepository.getMovieReleaseDate(
      movieId: date.movieId,
    );
  }

  /// Movie Lists belongs to
  Future<PageResult<Review>> getMovieReview(GetMovieReview review) async {
    return await remoteRepository.getMovieReview(
        movieId: review.movieId, language: review.language, page: review.page);
  }

  /// Movie Lists belongs to
  Future<PageResult<Movie>> getMovieSimilar(GetSimilarMovie similar) async {
    return await remoteRepository.getSimilarMovie(
        movieId: similar.movieId,
        language: similar.language,
        page: similar.page);
  }

  /// Movie Translations
  Future<TranslationList> getMovieTranslation(
      GetMovieTranslation translation) async {
    return await remoteRepository.getMovieTranslation(
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

  /// Movie Watch Provider
  Future<WatchProviderList> getMovieWatchProvider(
      GetMovieWatchProvider video) async {
    return await remoteRepository.getMovieWatchProvider(
      movieId: video.movieId,
    );
  }

  /// Rate Movie
  Future<CodeResponse> rateMovie(RateMovie rateMovie) async {
    return await remoteRepository.rateMovie(
        movieId: rateMovie.movieId, content: rateMovie.rateContent);
  }

  /// Delete Rate Movie
  Future<CodeResponse> delteMovieRate(DeleteMovieRate rate) async {
    return await remoteRepository.deleteMovieRate(movieId: rate.movieId);
  }

  /// Get Latest Movie
  Future<Movie> getLatestMovie(GetLatestMovie movie) async {
    return await remoteRepository.getLatestMovie();
  }

  /// Get Now Playing Movie
  Future<PageResult<Movie>> getNowPlayingMovie(GetNowPlayingMovie movie) async {
    return await remoteRepository.getNowPlayingMovie(
        language: movie.language, page: movie.page, region: movie.region);
  }

  /// Get Popular Movie
  Future<PageResult<Movie>> getPopularMovie(GetPopularMovie movie) async {
    return await remoteRepository.getPopularMovie(
        language: movie.language, page: movie.page, region: movie.region);
  }

  /// Get Top Rated Movie
  Future<PageResult<Movie>> getTopRatedMovie(GetTopRatedMovie movie) async {
    return await remoteRepository.getTopRatedMovie(
        language: movie.language, page: movie.page, region: movie.region);
  }

  /// Get Upcoming Movie
  Future<PageResult<Movie>> getUpcomingMovie(GetUpcomingMovie movie) async {
    return await remoteRepository.getUpcomingMovie(
        language: movie.language, page: movie.page, region: movie.region);
  }
}
