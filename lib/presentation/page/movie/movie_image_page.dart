import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart' show Either;
import 'package:flutter/material.dart';
import 'package:movie_info/application/get_it/get_it_main.dart';
import 'package:movie_info/application/util/app_image_config.dart';
import 'package:movie_info/domain/model/media/image.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/service/i_movie_service.dart';
import 'package:movie_info/infrastructure/movie_method/movie_method.dart';
import 'package:movie_info/presentation/widget/loading_widget.dart';
import 'package:movie_info/presentation/widget/movie_error_widget.dart';

class MovieImagePage extends StatefulWidget {
  final Movie movie;
  const MovieImagePage({Key? key, required this.movie}) : super(key: key);

  @override
  _MovieImagePageState createState() => _MovieImagePageState();
}

class _MovieImagePageState extends State<MovieImagePage> {
  Future<Either<Exception, MovieImage>>? future;
  @override
  void initState() {
    super.initState();
    future =
        getIt<IMovieService>().execute(GetMovieImage(movieId: widget.movie.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.movie.title}'),
      ),
      body: FutureBuilder<Either<Exception, MovieImage>>(
        future: future,
        builder: (_, snapshot) {
          if (!snapshot.hasData) {
            return LoadingWidget();
          }
          return snapshot.data!.fold(
              (l) => MovieErroWidget(),
              (r) => SingleChildScrollView(
                    child: DefaultTextStyle(
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(text: 'Backdrops'),
                          GridViewWidget(images: r.backdrops),
                          TextWidget(text: 'Logos'),
                          GridViewWidget(images: r.logos),
                          TextWidget(text: 'Posters'),
                          GridViewWidget(images: r.posters),
                        ],
                      ),
                    ),
                  ));
        },
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  final String text;
  const TextWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow[100],
      padding: const EdgeInsets.all(8.0),
      child: Text(text),
    );
  }
}

class GridViewWidget extends StatelessWidget {
  final List<AppImage> images;
  const GridViewWidget({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
      itemBuilder: (_, index) {
        return CachedNetworkImage(
            imageUrl: AppImageConfig.imageUrl(images[index].filePath),
            fit: BoxFit.cover);
      },
      itemCount: images.length,
    );
  }
}
