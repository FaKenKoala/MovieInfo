part of '../app_service.dart';

mixin ExternalIDService on AppServicePart {
  get findByExternalID => remoteRepository.findByExternalID;
}
