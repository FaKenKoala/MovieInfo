import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/application/bloc/movie/movie_bloc.dart';
import 'package:movie_info/application/util/image_global_config.dart';
import 'package:movie_info/domain/model/image/image.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/presentation/widget/movie_error_widget.dart';

class MovieImagePage extends StatefulWidget {
  final Movie movie;
  const MovieImagePage({Key? key, required this.movie}) : super(key: key);

  @override
  _MovieImagePageState createState() => _MovieImagePageState();
}

class _MovieImagePageState extends State<MovieImagePage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<MovieBloc>().add(MovieEvent.image(movieId: widget.movie.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.movie.title}'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: BlocBuilder<MovieBloc, MovieState>(
            builder: (_, state) {
              return state.maybeMap(
                  image: (image) {
                    final backdrops = image.image.backdrops;
                    final logos = image.image.logos;
                    final posters = image.image.posters;
                    return Container(
                      height: 500,
                      child:Text('fuck you'));
                      // child: GridView.builder(
                      //   physics: NeverScrollableScrollPhysics(),
                      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //       crossAxisCount: 2,
                      //       mainAxisSpacing: 10,
                      //       crossAxisSpacing: 10),
                      //   itemBuilder: (_, index) {
                      //     return CachedNetworkImage(
                      //         imageUrl: ImageGlobalConfig.imageUrl(
                      //             backdrops[index].filePath));
                      //   },
                      //   itemCount: backdrops.length,
                      // ),
                    // );
                  },
                  orElse: () => Container(
                    height: 100,
                    child: MovieErroWidget()));
            },
            buildWhen: (prev, now) {
              return now is MovieStateImage || now is MovieStateError;
            },
          ),
        ),
      ),
    );
  }

}
