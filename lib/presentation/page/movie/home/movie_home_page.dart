import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/application/bloc/movie/list/movie_home_bloc.dart';
import 'package:movie_info/presentation/page/movie/home/movie_list_page.dart';
import 'package:movie_info/presentation/widget/loading_widget.dart';
import 'package:movie_info/presentation/widget/movie_error_widget.dart';

class MovieHomePage extends StatefulWidget {
  const MovieHomePage({Key? key}) : super(key: key);

  @override
  _MovieHomePageState createState() => _MovieHomePageState();
}

class _MovieHomePageState extends State<MovieHomePage>
    with AutomaticKeepAliveClientMixin {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<MovieHomeBloc>().add(MovieHomeEvent.trending());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<MovieHomeBloc, MovieHomeState>(builder: (_, state) {
      return state.when(
          initial: () => LoadingWidget(),
          data: (movies) => MovieListPage(movies: movies),
          error: (_) => MovieErroWidget());
    });
  }

  @override
  bool get wantKeepAlive => true;
}
