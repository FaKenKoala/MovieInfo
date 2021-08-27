part of '../app_service.dart';

mixin FindService on AppServicePart {
  get findByExternalID => remoteRepository.findByExternalID;
}
