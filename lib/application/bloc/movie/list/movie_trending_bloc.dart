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

part 'movie_trending_event.dart';
part 'movie_trending_state.dart';
part 'movie_trending_bloc.freezed.dart';

@injectable
class MovieTrendingBloc extends Bloc<MovieTrendingEvent, MovieTrendingState> {
  final IAppService appService;
  MovieTrendingBloc(this.appService) : super(MovieTrendingStateInitial()) {
    add(MovieTrendingEvent.trending());
  }

  @override
  Stream<MovieTrendingState> mapEventToState(
    MovieTrendingEvent event,
  ) async* {
    yield await event.map(trending: _getMovieList);
  }

  Future<MovieTrendingState> _getMovieList(_MovieTrendingEventList list) async {
    final result =
        await appService.execute(GetMovieTrending(timeWindow: TimeWindow.DAY));
    return result.fold((l) => MovieTrendingState.error(l),
        (r) => MovieTrendingState.trending(r));
  }
}
