import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';

part 'find_method.freezed.dart';

@freezed
class FindMethod with _$FindMethod implements AppMethod {
  const factory FindMethod.findByExternalID({
    required String externalId,
    required String externalSource
  }) = FindByExternalID;
}
