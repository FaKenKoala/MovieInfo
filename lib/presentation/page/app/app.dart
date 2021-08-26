import 'package:flutter/material.dart';
import 'package:movie_info/application/get_it/get_it_main.dart';
import 'package:movie_info/application/route/movie_router.gr.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: getIt<MovieRouter>().delegate(),
      routeInformationParser: getIt<MovieRouter>().defaultRouteParser(),
      title: 'Movie Info',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
