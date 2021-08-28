import 'package:flutter/material.dart';
import 'package:movie_info/application/get_it/get_it_main.dart';
import 'package:movie_info/application/util/app_image_config.dart';
import 'package:movie_info/infrastructure/util/dio_logger.dart';

import 'presentation/page/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureGetIt();
  await ImageGlobalConfig.init();
  runApp(MyApp());
}
