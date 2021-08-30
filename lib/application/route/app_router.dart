import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/application/bloc/movie/detail/movie_detail_bloc.dart';
import 'package:movie_info/presentation/page/home/home_page.dart';
import 'package:movie_info/presentation/page/movie/detail/movie_detail_page.dart';
import 'package:movie_info/presentation/page/tv/tv_detail_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
  AutoRoute(page: AppHomePage, initial: true),
  AutoRoute(page: MovieDetailPage),
  // AutoRoute(page: MovieImagePage),
  // CustomRoute(
  //   page: MovieImagePage,
  //   customRouteBuilder: myCustomRouteBuilder,
  // ),
  AutoRoute(page: TVDetailPage),
])
class $AppRouter {}

Route<T> myCustomRouteBuilder<T>(
    BuildContext context, Widget child, CustomPage<T> page) {
  return PageRouteBuilder(
      settings: page,
      pageBuilder: (_, __, ___) {
        return BlocProvider(
          create: (_) => context.read<MovieDetailBloc>(),
          child: child,
        );
      });
}
