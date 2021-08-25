import 'package:freezed_annotation/freezed_annotation.dart';
part 'account_state.g.dart';

@JsonSerializable()
class AccountState {
  int id;
  bool favorite;
  Rate rated;
  bool watchlist;

  AccountState({
    required this.id,
    required this.favorite,
    required this.rated,
    required this.watchlist,
  });

  factory AccountState.fromJson(Map<String, dynamic> json) =>
      _$AccountStateFromJson(json);
  Map<String, dynamic> toJson() => _$AccountStateToJson(this);
}

@JsonSerializable()
class Rate {
  final int value;

  Rate({
    this.value = 0,
  });

factory Rate.fromJson(Map<String, dynamic> json) =>
      _$RateFromJson(json);
  Map<String, dynamic> toJson() => _$RateToJson(this);
}
