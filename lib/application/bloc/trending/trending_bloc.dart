import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_info/domain/model/enum_values/enum_values.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/model/api_result/page_result.dart';
import 'package:movie_info/domain/model/tv/tv.dart';
import 'package:movie_info/domain/service/i_movie_service.dart';
import 'package:movie_info/infrastructure/movie_method/movie_method.dart';

part 'trending_event.dart';
part 'trending_state.dart';
part 'trending_bloc.freezed.dart';

@injectable
class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  final IMovieService movieService;
  TrendingBloc(this.movieService) : super(_Initial()) {
    add(TrendingEvent.trending());
  }

  @override
  Stream<TrendingState> mapEventToState(
    TrendingEvent event,
  ) async* {
    yield await event.map(trending: getTrending);
  }

  Future<TrendingState> getTrending(_Trending event) async {
    final result = await movieService.execute(MovieMethod.getTrending(
        mediaType: event.mediaType ?? MediaType.ALL,
        timeWindow: event.timeWindow ?? TimeWindow.DAY));

    return result.fold((error) => TrendingState.error(error), (data) {
      
      switch (event.mediaType) {
        case MediaType.MOVIE:
          return TrendingState.movie(data);
        case MediaType.TV:
          return TrendingState.tv(data);
        default:
          return TrendingState.all(data);
      }
    });
  }
}
