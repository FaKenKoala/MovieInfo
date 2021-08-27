import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';
part 'tv_method.freezed.dart';

@freezed
class TVMethod with _$TVMethod implements AppMethod {
  /// Get TV Detail
  const factory TVMethod.getTVDetail(
      {required int tvId, String? appendToResponse}) = GetTVDetail;
  /// Get TV Account State
  const factory TVMethod.getTVAccountState({
    required int tvId,
  }) = GetTVAccountState;
}
