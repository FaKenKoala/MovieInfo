import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_info/domain/model/account_state/account_state.dart';
import 'package:movie_info/domain/model/media/image.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/service/i_app_service.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';

part 'movie_event.dart';
part 'movie_state.dart';
part 'movie_bloc.freezed.dart';

@injectable
class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final IAppService movieService;
  MovieBloc(this.movieService) : super(MovieStateInitial());

  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event,
  ) async* {
    yield await event.map(
        detail: _getMovieDetail,
        accountState: _getMovieAccountState,
        image: _getMovieImage);
  }

  Future<MovieState> _getMovieDetail(_MovieEventDetail detail) async {
    final result = await movieService.execute(GetMovieDetail(
      movieId: detail.movieId,
      
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

  Future<MovieState> _getMovieImage(_MovieEventImage state) async {
    final result = await movieService.execute(GetMovieImage(
      movieId: state.movieId,
    ));
    return result.fold((l) => MovieState.error(l), (r) => MovieState.image(r));
  }
}
