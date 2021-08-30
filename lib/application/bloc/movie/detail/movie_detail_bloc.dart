import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_info/domain/model/account_state/account_state.dart';
import 'package:movie_info/domain/model/media/image.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/service/i_app_service.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';
part 'movie_detail_bloc.freezed.dart';

@injectable
class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final IAppService appService;
  MovieDetailBloc(this.appService) : super(MovieStateInitial());

  @override
  Stream<MovieDetailState> mapEventToState(
    MovieDetailEvent event,
  ) async* {
    yield await event.map(
        detail: _getMovieDetail,
        accountState: _getMovieAccountState,
        image: _getMovieImage);
  }

  Future<MovieDetailState> _getMovieDetail(_MovieEventDetail detail) async {
    final result = await appService.execute(GetMovieDetail(
      movieId: detail.movieId,
    ));

    return result.fold(
        (l) => MovieDetailState.error(l), (r) => MovieDetailState.detail(r));
  }

  Future<MovieDetailState> _getMovieAccountState(
      _MovieEventAccountState state) async {
    final result = await appService.execute(GetMovieAccountState(
      movieId: state.movieId,
    ));
    return result.fold((l) => MovieDetailState.error(l),
        (r) => MovieDetailState.accountState(r));
  }

  Future<MovieDetailState> _getMovieImage(_MovieEventImage state) async {
    final result = await appService.execute(GetMovieImage(
      movieId: state.movieId,
    ));
    return result.fold(
        (l) => MovieDetailState.error(l), (r) => MovieDetailState.image(r));
  }
}
