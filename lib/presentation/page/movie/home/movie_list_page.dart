import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_info/domain/model/api_result/page_result.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/infrastructure/util/platform_util.dart';
import 'package:movie_info/presentation/page/movie/item/movie_item_widget.dart';

class MovieListPage extends StatefulWidget {
  final PageResult<Movie> movies;
  MovieListPage({Key? key, required this.movies}) : super(key: key);

  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  late ScrollController controller;
  late int widgetHashcode;
  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    widgetHashcode = widget.hashCode;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widgetHashcode != widget.hashCode && widget.movies.page == 1) {
      /// new type movie data, sometimes only buile new widget and rebuild state.build, but not renew state.
      /// This is the mechanism of flutter!!!
      controller.jumpTo(0);
    }
    return GridView.builder(
        controller: controller,
        itemCount: widget.movies.results.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isPhone ? 2 : 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 2 / 3,
        ),
        itemBuilder: (_, index) {
          var movie = widget.movies.results[index];
          return MovieItemWidget(movie: movie);
        });
  }
}
