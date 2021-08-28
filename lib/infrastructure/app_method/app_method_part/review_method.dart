import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';

part 'review_method.freezed.dart';

@freezed
class ReviewMethod with _$ReviewMethod implements AppMethod {
  factory ReviewMethod.getReviewDetail({
    required String reviewId,
  }) = GetReviewDetail;
}
