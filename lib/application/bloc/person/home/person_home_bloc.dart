import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_home_event.dart';
part 'person_home_state.dart';
part 'person_home_bloc.freezed.dart';

class PersonHomeBloc extends Bloc<PersonHomeEvent, PersonHomeState> {
  PersonHomeBloc() : super(_Initial());

  @override
  Stream<PersonHomeState> mapEventToState(
    PersonHomeEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
