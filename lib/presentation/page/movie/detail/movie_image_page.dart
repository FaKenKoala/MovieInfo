import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart' show Either;
import 'package:flutter/material.dart';
import 'package:movie_info/application/get_it/get_it_main.dart';
import 'package:movie_info/application/util/app_config.dart';
import 'package:movie_info/domain/model/media/image.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/service/i_app_service.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';
import 'package:movie_info/presentation/widget/loading_widget.dart';
import 'package:movie_info/presentation/widget/movie_error_widget.dart';

class MovieImagePage extends StatefulWidget {
  final Movie movie;
  const MovieImagePage({Key? key, required this.movie}) : super(key: key);

  @override
  _MovieImagePageState createState() => _MovieImagePageState();
}

class _MovieImagePageState extends State<MovieImagePage> {
  Future<Either<Exception, MediaImageList>>? future;
  @override
  void initState() {
    super.initState();
    future =
        getIt<IAppService>().execute(GetMovieImage(movieId: widget.movie.id));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Either<Exception, MediaImageList>>(
      future: future,
      builder: (_, snapshot) {
        if (!snapshot.hasData) {
          return LoadingWidget();
        }
        return snapshot.data!.fold(
            (l) => MovieErroWidget(),
            (r) => DefaultTextStyle(
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (r.backdrops.isNotEmpty)
                        _ImageWidget(
                          images: r.backdrops,
                          title: 'Backdrops',
                        ),
                      if (r.logos.isNotEmpty)
                        _ImageWidget(
                          images: r.logos,
                          title: 'Logos',
                        ),
                      if (r.posters.isNotEmpty)
                        _ImageWidget(images: r.posters, title: '海报' //'Posters',
                            ),
                    ],
                  ),
                ));
      },
    );
  }
}

class _ImageWidget extends StatelessWidget {
  final List<MediaImageItem> images;
  final String title;
  const _ImageWidget({Key? key, required this.images, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue[200],
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Text(title),
          ),
          SizedBox(height: 10),
          Container(
            height: 200,
            child: ListView.separated(
              shrinkWrap: true,
              primary: false,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (_, index) {
                return SizedBox(
                  width: 10,
                );
              },
              itemBuilder: (_, index) {
                return CachedNetworkImage(
                    imageUrl: AppConfig.imageUrl(images[index].filePath),
                    fit: BoxFit.cover);
              },
              itemCount: images.length,
            ),
          ),
        ],
      ),
    );
  }
}
