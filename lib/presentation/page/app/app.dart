import 'package:flutter/material.dart';
import 'package:movie_info/application/get_it/get_it_main.dart';
import 'package:movie_info/application/route/app_router.gr.dart';
import 'package:movie_info/infrastructure/util/color_util.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: getIt<AppRouter>().delegate(),
      routeInformationParser: getIt<AppRouter>().defaultRouteParser(),
      title: 'Movie Info',
      theme: ThemeData(
        primaryColor: ColorUtil.PrimaryColor,
        secondaryHeaderColor: ColorUtil.SecondaryColor,
        
      ),
    );
  }
}
