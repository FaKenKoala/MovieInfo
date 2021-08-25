import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_info/domain/model/enum_values/enum_values.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/model/result/api_result.dart';
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
    final result = await movieService.execute(MovieMethod.trending(
        mediaType: event.mediaType ?? MediaType.ALL,
        timeWindow: event.timeWindow ?? TimeWindow.DAY));

    return result.fold((error) => TrendingState.error(error),
        (data) => TrendingState.data(data));
  }
}
