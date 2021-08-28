part of '../remote_repository.dart';

mixin ReviewRepository {
  @GET('/review/{review_id}')
  Future<Review> getReviewDetail(@Path('review_id') String reviewId);
}
