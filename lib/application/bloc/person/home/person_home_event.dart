part of 'person_home_bloc.dart';

@freezed
class PersonHomeEvent with _$PersonHomeEvent {
  const factory PersonHomeEvent.started() = _Started;
}