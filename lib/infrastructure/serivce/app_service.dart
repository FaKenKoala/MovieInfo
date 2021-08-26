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
import 'package:movie_info/domain/model/code_response/app_exception.dart';
import 'package:movie_info/domain/model/media/image.dart';
import 'package:movie_info/domain/model/movie/external_id.dart';
import 'package:movie_info/domain/model/movie/keyword.dart';
import 'package:movie_info/domain/model/movie/movie_change.dart';
import 'package:movie_info/domain/model/movie/movie_credit.dart';
import 'package:movie_info/domain/model/movie/movie_list.dart';
import 'package:movie_info/domain/model/api_result/page_result.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/model/person/person.dart';
import 'package:movie_info/domain/model/recommendation/recommendation.dart';
import 'package:movie_info/domain/model/release_date/release_date.dart';
import 'package:movie_info/domain/model/review/review.dart';
import 'package:movie_info/domain/model/title/title.dart';
import 'package:movie_info/domain/model/translation/translatetion_list.dart';
import 'package:movie_info/domain/model/tv/tv.dart';
import 'package:movie_info/domain/model/watch_provider/watch_provider_list.dart';

import 'package:movie_info/domain/service/i_app_service.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';
import 'package:movie_info/infrastructure/util/constant.dart';
import 'package:movie_info/infrastructure/util/movie_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'repository/local/local_repository.dart';
import 'repository/remote/remote_repository.dart';

part 'app_service_part/configuration_part.dart';
part 'app_service_part/movie_part.dart';
part 'app_service_part/trending_part.dart';
part 'app_service_part/tv_part.dart';

abstract class AppServicePart {
  final LocalRepository localRepository;
  final RemoteRepository remoteRepository;
  AppServicePart._(this.remoteRepository, this.localRepository);
}

@Singleton(as: IAppService)
class AppService extends AppServicePart
    with ConfigurationPart, MoviePart, TrendingPart, TVPart
    implements IAppService {
  AppService(RemoteRepository remoteRepository, LocalRepository localRepository)
      : super._(remoteRepository, localRepository);

  @override
  Future<AppExceptionEither<T>> execute<T>(AppMethod method) async {
    /// 这个_executeMethod方法应该用编译时注解自动生成代码，格式时根据method.map的参数名称 {name}，
    /// 生成 name: get{name.firstUppercase}的方法调用，如同现有的_executeMethod所展示的一样。
    ///
    /// 这个方法也可以自动生成，格式是： remoteRepository.{name},参数就根据method的所有参数依此赋值
    try {
      return right(await _executeMethod(method));
    } catch (e) {
      AppException? movieException;
      if (e is DioError) {
        try {
          CodeResponse errorResponse = CodeResponse.fromJson(e.response?.data);
          movieException = AppException(codeResponse: errorResponse);
        } catch (_) {}
      }
      movieException ??= AppException(message: e);
      MovieLog.print('${method.runtimeType} $movieException');
      return left(movieException);
    }
  }

  Future _executeMethod(AppMethod method) async {
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
        getUpcomingMovie: getUpcomingMovie,
        getTVDetail: getTVDetail);
  }
}
