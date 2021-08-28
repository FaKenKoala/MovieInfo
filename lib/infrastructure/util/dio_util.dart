import 'package:dio/dio.dart';
import 'package:movie_info/application/get_it/get_it_main.dart';
import 'package:movie_info/application/util/app_config.dart';
import 'package:movie_info/infrastructure/util/constant.dart';

void addGuestSession() {
  getIt<Dio>().options.queryParameters[Constants.GuestSessionID] =
      AppConfig.instance.guestSession?.guestSessionId;
}
