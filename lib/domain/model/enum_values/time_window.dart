import 'package:freezed_annotation/freezed_annotation.dart';

enum TimeWindow {
  @JsonValue('day')
  DAY,
  @JsonValue('week')
  WEEK
}

const _TimeWindowEnumMap = {
  TimeWindow.DAY: 'day',
  TimeWindow.WEEK: 'week',
};

extension TimeWindowX on TimeWindow {
  String get name => _TimeWindowEnumMap[this]!;
}
