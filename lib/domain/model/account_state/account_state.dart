import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'account_state.g.dart';

@JsonSerializable()
class AccountState {
  final int id;
  final bool favorite;
  final Rate? rated;
  final bool watchlist;
  final int episodeNumber;

  AccountState({
    this.id = 0,
    this.favorite = false,
    this.rated,
    this.watchlist = false,
    this.episodeNumber = 0,
  });

  factory AccountState.fromJson(Map<String, dynamic> json) =>
      _$AccountStateFromJson(json);
  Map<String, dynamic> toJson() => _$AccountStateToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}

@JsonSerializable()
class Rate {
  final int value;

  Rate({
    this.value = 0,
  });

  factory Rate.fromJson(Map<String, dynamic> json) => _$RateFromJson(json);
  Map<String, dynamic> toJson() => _$RateToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
