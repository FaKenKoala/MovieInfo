import 'dart:convert';

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
  static void printJson(String input) {
    if (!kReleaseMode) {
      try {
        const JsonDecoder decoder = JsonDecoder();
        const JsonEncoder encoder = JsonEncoder.withIndent('  ');
        final dynamic object = decoder.convert(input);
        final dynamic prettyString = encoder.convert(object);
        prettyString.split('\n').forEach((dynamic element) => print(element));
      } catch (e) {
        print(input);
      }
    }
  }

  static void printS(Object? object) {
    if (!kReleaseMode) {
      getIt<Logger>().i('$object');
    }
  }
}
