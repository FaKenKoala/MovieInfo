import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_info/domain/model/account_state/account_state.dart';
import 'package:movie_info/domain/model/media/image.dart';
import 'package:movie_info/domain/model/tv/tv.dart';
import 'package:movie_info/domain/service/i_app_service.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';

part 'tv_event.dart';
part 'tv_state.dart';
part 'tv_bloc.freezed.dart';

@injectable
class TVBloc extends Bloc<TVEvent, TVState> {
  final IAppService movieService;
  TVBloc(this.movieService) : super(TVStateInitial());

  @override
  Stream<TVState> mapEventToState(
    TVEvent event,
  ) async* {
    yield await event.map(
        detail: _getMovieDetail,
        accountState: _getMovieAccountState,
        image: _getMovieImage);
  }

  Future<TVState> _getMovieDetail(_TVEventDetail detail) async {
    final result = await movieService.execute(GetMovieDetail(
      movieId: detail.movieId,
      language: detail.appendToResponse,
      appendToResponse: detail.appendToResponse,
    ));
    return result.fold((l) => TVState.error(l), (r) => TVState.detail(r));
  }

  Future<TVState> _getMovieAccountState(
      _TVEventAccountState state) async {
    final result = await movieService.execute(GetMovieAccountState(
      movieId: state.movieId,
    ));
    return result.fold(
        (l) => TVState.error(l), (r) => TVState.accountState(r));
  }

  Future<TVState> _getMovieImage(_TVEventImage state) async {
    final result = await movieService.execute(GetMovieImage(
      movieId: state.movieId,
      language: state.language,
    ));
    return result.fold((l) => TVState.error(l), (r) => TVState.image(r));
  }
}
