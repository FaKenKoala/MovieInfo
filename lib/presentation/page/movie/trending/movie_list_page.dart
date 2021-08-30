import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/infrastructure/util/platform_util.dart';
import 'package:movie_info/presentation/page/movie/item/movie_item_widget.dart';

class MovieListPage extends StatefulWidget {
  final List<Movie> movies;
  const MovieListPage({Key? key, required this.movies}) : super(key: key);

  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: widget.movies.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isPhone ? 2 : 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 2 / 3,
        ),
        itemBuilder: (_, index) {
          var movie = widget.movies[index];
          return MovieItemWidget(movie: movie);
        });
  }
}
