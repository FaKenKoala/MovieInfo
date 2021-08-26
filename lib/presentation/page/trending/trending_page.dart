import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/application/bloc/trending/trending_bloc.dart';
import 'package:movie_info/application/get_it/get_it_main.dart';
import 'package:movie_info/presentation/page/movie/movie_page.dart';
import 'package:movie_info/presentation/widget/loading_widget.dart';
import 'package:movie_info/presentation/widget/movie_error_widget.dart';

class TrendingPage extends StatefulWidget {
  const TrendingPage({Key? key}) : super(key: key);

  @override
  _TrendingPageState createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<TrendingBloc>(),
      child: BlocBuilder<TrendingBloc, TrendingState>(
        builder: (_, state) {
          return state.when(
              initial: () => LoadingWidget(),
              data: (apiResult) {
                return MoviePage(movies: apiResult);
              },
              error: (error) => MovieErroWidget());
        },
      ),
    );
  }
}
