import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_event.dart';
part 'movie_state.dart';
part 'movie_bloc.freezed.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(_Initial());

  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
