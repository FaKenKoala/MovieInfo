import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_info/domain/model/api_result/page_result.dart';
import 'package:movie_info/domain/model/code_response/app_exception.dart';
import 'package:movie_info/domain/model/enum_values/enum_values.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/service/i_app_service.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';

part 'movie_home_event.dart';
part 'movie_home_state.dart';
part 'movie_home_bloc.freezed.dart';

@injectable
class MovieHomeBloc extends Bloc<MovieHomeEvent, MovieHomeState> {
  final IAppService appService;
  MovieHomeBloc(this.appService) : super(MovieHomeStateInitial());

  @override
  Stream<MovieHomeState> mapEventToState(
    MovieHomeEvent event,
  ) async* {
    yield await event.when(
        index: (int pos, int page) {
          switch (pos) {
            case 1:
              return _getPopular(page);
            case 2:
              return _getNowPlaying(page);
            case 3:
              return _getUpcoming(page);
            case 4:
              return _getTopRated(page);
            case 0:
            default:
              return _getTrending();
          }
        },
        trending: _getTrending,
        popular: _getPopular,
        nowPlaying: _getNowPlaying,
        upcoming: _getUpcoming,
        topRated: _getTopRated);
  }

  Future<MovieHomeState> _getTrending() async {
    final result =
        await appService.execute(GetMovieTrending(timeWindow: TimeWindow.DAY));
    return result.fold(
        (l) => MovieHomeState.error(l), (r) => MovieHomeState.data(r));
  }

  Future<MovieHomeState> _getPopular(int page) async {
    final result = await appService.execute(GetPopularMovie(page: page));
    return result.fold(
        (l) => MovieHomeState.error(l), (r) => MovieHomeState.data(r));
  }

  Future<MovieHomeState> _getNowPlaying(int page) async {
    final result = await appService.execute(GetNowPlayingMovie(page: page));
    return result.fold(
        (l) => MovieHomeState.error(l), (r) => MovieHomeState.data(r));
  }

  Future<MovieHomeState> _getUpcoming(int page) async {
    final result = await appService.execute(GetUpcomingMovie(page: page));
    return result.fold(
        (l) => MovieHomeState.error(l), (r) => MovieHomeState.data(r));
  }

  Future<MovieHomeState> _getTopRated(int page) async {
    final result = await appService.execute(GetTopRatedMovie(page: page));
    return result.fold(
        (l) => MovieHomeState.error(l), (r) => MovieHomeState.data(r));
  }
}
