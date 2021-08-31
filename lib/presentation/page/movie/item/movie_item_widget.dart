import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_info/application/get_it/get_it_main.dart';
import 'package:movie_info/application/route/app_router.gr.dart';
import 'package:movie_info/application/util/app_config.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/infrastructure/util/color_util.dart';
import 'package:movie_info/presentation/widget/rating_widget.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.maxFinite,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4)),
                  child: CachedNetworkImage(
                    imageUrl: AppConfig.poster(movie.posterPath),
                    fit: BoxFit.cover,

                    // placeholder: (_, __) {
                    //   return CachedNetworkImage(imageUrl: Cache);
                    // },
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(-1, 0),
              heightFactor: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 2.5),
                child: CustomPaint(
                  size: Size(40, 40),
                  painter:
                      RatingPainter(valueInTen: movie.voteAverage, radius: 20),
                ),
              ),
            ),
            SizedBox(
              height: 12.5,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                        color: Colors.black45,
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
