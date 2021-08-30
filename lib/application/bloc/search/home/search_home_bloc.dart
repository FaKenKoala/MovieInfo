import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_home_event.dart';
part 'search_home_state.dart';
part 'search_home_bloc.freezed.dart';

class SearchHomeBloc extends Bloc<SearchHomeEvent, SearchHomeState> {
  SearchHomeBloc() : super(_Initial());

  @override
  Stream<SearchHomeState> mapEventToState(
    SearchHomeEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
