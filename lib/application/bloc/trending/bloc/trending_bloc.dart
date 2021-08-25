import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_info/domain/model/enum_values/enum_values.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/model/result/api_result.dart';
import 'package:movie_info/domain/service/i_movie_service.dart';

part 'trending_event.dart';
part 'trending_state.dart';
part 'trending_bloc.freezed.dart';

@injectable
class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  final IMovieService movieService;
  TrendingBloc(this.movieService) : super(_Initial());

  @override
  Stream<TrendingState> mapEventToState(
    TrendingEvent event,
  ) async* {
    event.when(trending: (mediaType, timeWindow) {
      
    });
  }
}
