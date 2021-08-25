import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_info/application/util/image_global_config.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/model/result/api_result.dart';

class MoviePage extends StatefulWidget {
  final ApiResult<Movie> movies;
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
        return Container(
          child: CachedNetworkImage(
            imageUrl: ImageGlobalConfig.imageUrl(movie.posterPath),
            fit: BoxFit.cover,
          ),
        );
      },
      itemCount: widget.movies.results.length,
    );
  }
}
