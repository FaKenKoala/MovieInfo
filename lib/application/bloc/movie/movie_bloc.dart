import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_info/domain/model/account_state/account_state.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/service/i_movie_service.dart';
import 'package:movie_info/infrastructure/movie_method/movie_method.dart';

part 'movie_event.dart';
part 'movie_state.dart';
part 'movie_bloc.freezed.dart';

@injectable
class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final IMovieService movieService;
  MovieBloc(this.movieService) : super(MovieStateInitial());

  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event,
  ) async* {
    yield await event.map(
        detail: _getMovieDetail, accountState: _getMovieAccountState);
  }

  Future<MovieState> _getMovieDetail(_MovieEventDetail detail) async {
    final result = await movieService.execute(GetMovieDetail(
      movieId: detail.movieId,
      language: detail.appendToResponse,
      appendToResponse: detail.appendToResponse,
    ));
    return result.fold((l) => MovieState.error(l), (r) => MovieState.detail(r));
  }

  Future<MovieState> _getMovieAccountState(
      _MovieEventAccountState state) async {
    final result = await movieService.execute(GetMovieAccountState(
      movieId: state.movieId,
    ));
    return result.fold(
        (l) => MovieState.error(l), (r) => MovieState.accountState(r));
  }
}
