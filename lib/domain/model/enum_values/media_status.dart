import 'package:freezed_annotation/freezed_annotation.dart';

enum MediaStatus {
  @JsonValue('Rumored')
  Rumored,
  @JsonValue('Planned')
  Planned,
  @JsonValue('In Production')
  InProduction,
  @JsonValue('Post Production')
  PostProduction,
  @JsonValue('Released')
  Released,
  @JsonValue('Canceled')
  Canceled
}
