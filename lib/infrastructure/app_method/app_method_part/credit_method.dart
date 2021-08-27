import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';

part 'credit_method.freezed.dart';

@freezed
class CreditMethod with _$CreditMethod implements AppMethod {
  const factory CreditMethod.getCreditDetail({required String creditId}) =
      GetCreditDetail;
}
