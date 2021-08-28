part of '../app_service.dart';

mixin ReviewService on AppServicePart {
  get getReviewDetail => remoteRepository.getReviewDetail;
}
