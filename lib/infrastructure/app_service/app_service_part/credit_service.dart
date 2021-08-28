part of '../app_service.dart';

mixin CreditService on AppServicePart {
  get getCreditDetail => remoteRepository.getCreditDetail;
}
