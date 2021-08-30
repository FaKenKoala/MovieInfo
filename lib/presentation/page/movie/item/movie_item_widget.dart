import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_info/application/get_it/get_it_main.dart';
import 'package:movie_info/application/route/app_router.gr.dart';
import 'package:movie_info/application/util/app_config.dart';
import 'package:movie_info/domain/model/movie/movie.dart';

class MovieItemWidget extends StatelessWidget {
  final Movie movie;
  const MovieItemWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        getIt<AppRouter>().navigate(MovieDetailPageRoute(movie: movie));
      },
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.maxFinite,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4)),
                      
                  child: CachedNetworkImage(
                    imageUrl: AppConfig.imageUrl(movie.posterPath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(children: [
                Text(
                  '${movie.title}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                Text(
                  '${movie.releaseDate}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
