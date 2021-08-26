import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/application/bloc/movie/movie_bloc.dart';
import 'package:movie_info/presentation/page/home/home_page.dart';
import 'package:movie_info/presentation/page/movie/movie_detail_page.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: MyHomePage, initial: true),
  AutoRoute(page: MovieDetail),
  // AutoRoute(page: MovieImagePage),
  // CustomRoute(
  //   page: MovieImagePage,
  //   customRouteBuilder: myCustomRouteBuilder,
  // ),
])
class $MovieRouter {}

Route<T> myCustomRouteBuilder<T>(
    BuildContext context, Widget child, CustomPage<T> page) {
  return PageRouteBuilder(
      settings: page,
      pageBuilder: (_, __, ___) {
        return BlocProvider(
          create: (_) => context.read<MovieBloc>(),
          child: child,
        );
      });
}
