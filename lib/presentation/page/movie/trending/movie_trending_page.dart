import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/application/bloc/movie/list/movie_trending_bloc.dart';
import 'package:movie_info/application/get_it/get_it_main.dart';
import 'package:movie_info/presentation/page/movie/trending/movie_list_page.dart';
import 'package:movie_info/presentation/widget/loading_widget.dart';
import 'package:movie_info/presentation/widget/movie_error_widget.dart';

class MovieTrendingPage extends StatefulWidget {
  const MovieTrendingPage({Key? key}) : super(key: key);

  @override
  _MovieTrendingPageState createState() => _MovieTrendingPageState();
}

class _MovieTrendingPageState extends State<MovieTrendingPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<MovieTrendingBloc>(),
      child: BlocBuilder<MovieTrendingBloc, MovieTrendingState>(
          builder: (_, state) {
        return state.when(
            initial: () => LoadingWidget(),
            trending: (movies) => MovieListPage(movies: movies.results),
            error: (_) => MovieErroWidget());
      }),
    );

  }
}
