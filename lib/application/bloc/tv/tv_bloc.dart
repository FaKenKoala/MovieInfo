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
        detail: _getTVDetail,
        accountState: _getTVAccountState,
        image: _getTVImage);
  }

  Future<TVState> _getTVDetail(_TVEventDetail detail) async {
    final result = await movieService.execute(GetTVDetail(
      tvId: detail.movieId,
      
    ));
    return result.fold((l) => TVState.error(l), (r) => TVState.detail(r));
  }

  Future<TVState> _getTVAccountState(_TVEventAccountState state) async {
    // final result = await movieService.execute(GetTVAccountState(
    //   movieId: state.movieId,
    // ));
    // return result.fold((l) => TVState.error(l), (r) => TVState.accountState(r));
    throw Exception();
  }

  Future<TVState> _getTVImage(_TVEventImage state) async {
    throw Exception();
    // final result = await movieService.execute(GetTVImage(
    //   movieId: state.movieId,
    // ));
    // return result.fold((l) => TVState.error(l), (r) => TVState.image(r));
  }
}
