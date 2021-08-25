import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:movie_info/application/get_it/get_it_main.dart';

@module
abstract class LoggerModule {
  @singleton
  Logger get logger => Logger(printer: PrettyPrinter());
}

class MovieLog {
  static void print(Object? object) {
    if (!kReleaseMode) {
      getIt<Logger>().i('$object');
    }
  }
}
