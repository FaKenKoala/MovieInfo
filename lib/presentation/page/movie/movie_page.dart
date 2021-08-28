import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_info/application/get_it/get_it_main.dart';
import 'package:movie_info/application/route/app_router.gr.dart';
import 'package:movie_info/application/util/app_config.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/model/api_result/page_result.dart';

class MoviePage extends StatefulWidget {
  final PageResult<Movie> movies;
  const MoviePage({Key? key, required this.movies}) : super(key: key);

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (_, index) {
        final movie = widget.movies.results[index];
        return Material(
          child: InkWell(
            onTap: () {
              getIt<AppRouter>().navigate(MovieDetailPageRoute(movie: movie));
            },
            child: CachedNetworkImage(
              imageUrl: AppConfig.imageUrl(movie.posterPath),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      itemCount: widget.movies.results.length,
    );
  }
}
