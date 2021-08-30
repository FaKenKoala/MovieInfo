import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_home_event.dart';
part 'tv_home_state.dart';
part 'tv_home_bloc.freezed.dart';

class TvHomeBloc extends Bloc<TvHomeEvent, TvHomeState> {
  TvHomeBloc() : super(_Initial());

  @override
  Stream<TvHomeState> mapEventToState(
    TvHomeEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
