import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_info/application/bloc/movie/detail/movie_detail_bloc.dart';
import 'package:movie_info/application/get_it/get_it_main.dart';
import 'package:movie_info/application/util/app_config.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/infrastructure/util/dio_logger.dart';
import 'package:movie_info/presentation/page/movie/detail/movie_image_page.dart';
import 'package:movie_info/presentation/widget/genre/genre_widget.dart';
import 'package:movie_info/presentation/widget/language/language_widget.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;
  MovieDetailPage({Key? key, required this.movie}) : super(key: key) {
    addDioLogger();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => getIt<MovieDetailBloc>()
                ..add(
                  MovieDetailEvent.detail(movieId: movie.id),
                )),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Text('${movie.title}'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _MovieDetailWidget(movie: movie),
                  // MovieImagePage(movie: movie),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class _MovieDetailWidget extends StatefulWidget {
  final Movie movie;
  const _MovieDetailWidget({Key? key, required this.movie}) : super(key: key);

  @override
  _MovieDetailWidgetState createState() => _MovieDetailWidgetState();
}

class _MovieDetailWidgetState extends State<_MovieDetailWidget> {
  late Movie movieDetail;
  @override
  void initState() {
    super.initState();
    movieDetail = widget.movie;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      builder: (_, state) {
        state.maybeMap(
            orElse: () {},
            detail: (detailState) {
              movieDetail = detailState.movie;
            });
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
                imageUrl: AppConfig.backdrop(movieDetail.backdropPath)),
            SizedBox(height: 10),
            GenreWidget(genres: movieDetail.genres),
            SizedBox(height: 10),
            SizedBox(height: 10),
            LanguageWidget(languages: movieDetail.spokenLanguages),
            SizedBox(height: 10),
            Row(
              children: [
                RatingBarIndicator(
                    itemCount: 5,
                    itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                    rating: (movieDetail.voteAverage??0).toDouble()/2),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '${movieDetail.voteAverage} / 10.0',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '简介: ${movieDetail.overview}',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                decoration: BoxDecoration(
                  color: Colors.redAccent[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.only(
                    left: 10, top: 10, bottom: 10, right: 40),
                child: Text(
                  '出品公司:',
                  style: TextStyle(fontSize: 24),
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              child: ListView.separated(
                  separatorBuilder: (_, index) {
                    return SizedBox(width: 10);
                  },
                  itemCount: movieDetail.productionCompanies.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    var company = movieDetail.productionCompanies[index];
                    return Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.blueAccent[100],
                      child: Center(
                        child: (company.logoPath?.isEmpty ?? true)
                            ? Text('${company.name}')
                            : CachedNetworkImage(
                                width: 200,
                                imageUrl: AppConfig.logo(company.logoPath),
                                fit: BoxFit.contain,
                              ),
                      ),
                    );
                  }),
            ),
          ],
        );
      },
    );
  }
}
