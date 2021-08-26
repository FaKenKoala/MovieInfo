import 'package:freezed_annotation/freezed_annotation.dart';

enum MonetizationType {
  @JsonValue('flatrate')
  FlatRate,
  @JsonValue('free')
  Free,
  @JsonValue('ads')
  Ads,
  @JsonValue('rent')
  Rent,
  @JsonValue('buy')
  Buy,
}


const MonetizationTypeEnumMap = {
  MonetizationType.FlatRate: 'flatrate',
  MonetizationType.Free: 'free',
  MonetizationType.Ads: 'ads',
  MonetizationType.Rent: 'rent',
  MonetizationType.Buy: 'buy',
};

extension MonetizationTypeX on MonetizationType{
  String get name => MonetizationTypeEnumMap[this]!;
}