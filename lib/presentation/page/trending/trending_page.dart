import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/application/bloc/trending/trending_bloc.dart';
import 'package:movie_info/application/get_it/get_it_main.dart';
import 'package:movie_info/application/route/app_router.gr.dart';
import 'package:movie_info/application/util/app_config.dart';
import 'package:movie_info/domain/model/api_result/page_result.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/model/tv/tv.dart';
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
              data: (apiResult) => _TrendingListWidget(trendings: apiResult),
              error: (error) => MovieErroWidget());
        },
      ),
    );
  }
}

class _TrendingListWidget extends StatefulWidget {
  final PageResult trendings;
  const _TrendingListWidget({Key? key, required this.trendings})
      : super(key: key);

  @override
  _TrendingListWidgetState createState() => _TrendingListWidgetState();
}

class _TrendingListWidgetState extends State<_TrendingListWidget> {
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
        return Material(
          child: InkWell(
            onTap: () {
              if (item is TV) {
                getIt<AppRouter>().push(TVDetailPageRoute(tv: item));
              } else if (item is Movie) {
                getIt<AppRouter>().push(MovieDetailPageRoute(movie: item));
              }
            },
            child: posterPath == null
                ? Text('No image')
                : CachedNetworkImage(
                    imageUrl: AppConfig.poster(posterPath),
                    fit: BoxFit.cover,
                  ),
          ),
        );
      },
      itemCount: widget.trendings.results.length,
    );
  }
}
