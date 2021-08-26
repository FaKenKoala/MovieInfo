import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/application/bloc/trending/trending_bloc.dart';
import 'package:movie_info/application/get_it/get_it_main.dart';
import 'package:movie_info/application/util/app_image_config.dart';
import 'package:movie_info/domain/model/api_result/page_result.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/model/tv/tv.dart';
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
              all: (apiResult) {
                return AllTrendingPage(trendings: apiResult);
              },
              movie: (apiResult) {
                return MoviePage(movies: apiResult);
              },
              tv: (apiResult) {
                return Text('');
              },
              error: (error) => MovieErroWidget());
        },
      ),
    );
  }
}

class AllTrendingPage extends StatefulWidget {
  final PageResult trendings;
  const AllTrendingPage({Key? key, required this.trendings}) : super(key: key);

  @override
  _AllTrendingPageState createState() => _AllTrendingPageState();
}

class _AllTrendingPageState extends State<AllTrendingPage> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (_, index) {
        final item = widget.trendings.results[index];
        String? posterPath;
        if (item is Movie) {
          posterPath = item.posterPath;
        } else if (item is TV) {
          posterPath = item.posterPath;
        }
        print('索引$index: ${item.runtimeType}');
        return Material(
          child: InkWell(
            child: posterPath == null
                ? Text('No image')
                : CachedNetworkImage(
                    imageUrl: ImageGlobalConfig.imageUrl(posterPath),
                    fit: BoxFit.cover,
                  ),
          ),
        );
      },
      itemCount: widget.trendings.results.length,
    );
  }
}
