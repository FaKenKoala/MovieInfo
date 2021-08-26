import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/application/bloc/movie/movie_bloc.dart';
import 'package:movie_info/application/get_it/get_it_main.dart';
import 'package:movie_info/application/route/movie_router.gr.dart';
import 'package:movie_info/application/util/image_global_config.dart';
import 'package:movie_info/domain/model/account_state/account_state.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/service/i_movie_service.dart';
import 'package:movie_info/infrastructure/movie_method/movie_method.dart';
import 'package:movie_info/infrastructure/util/dio_logger.dart';
import 'package:movie_info/presentation/page/movie/movie_image_page.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';

class MovieDetail extends StatefulWidget {
  final Movie movie;
  const MovieDetail({Key? key, required this.movie}) : super(key: key);

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  late Movie movieDetail;
  AccountState? accountState;
  @override
  void initState() {
    super.initState();
    movieDetail = widget.movie;
    addDioLogger();
    getIt<IMovieService>().execute(GetMovieRecommendation(movieId: movieDetail.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => getIt<MovieBloc>()
          // ..add(
          //   MovieEvent.detail(
          //     movieId: widget.movie.id,
          //   ),
          // )
          ,
        child: BlocListener<MovieBloc, MovieState>(
          listenWhen: (previousState, state) {
            return state.maybeMap(detail: (_) => true, orElse: () => false);
          },
          listener: (context, state) {
            state.mapOrNull(detail: (detail) {
              movieDetail = detail.movie;
            });
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text('${movieDetail.title}'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  BlocBuilder<MovieBloc, MovieState>(
                    buildWhen: (previousState, state) {
                      return state.maybeWhen(
                          orElse: () => false,
                          accountState: (thisState) {
                            accountState = thisState;
                            return true;
                          });
                    },
                    builder: (context, state) {
                      return Column(
                        children: [
                          Visibility(
                            visible: accountState == null,
                            child: TextButton(
                                onPressed: () {
                                  context.read<MovieBloc>().add(
                                      MovieEvent.accountState(
                                          movieId: movieDetail.id));
                                },
                                child: Text('Get Account State')),
                          ),
                          Visibility(
                            visible: accountState != null,
                            child: Column(
                              children: [
                                Text('Favorite: ${accountState?.favorite}'),
                                Text('Rate: ${accountState?.rated}'),
                                Text('Watchlist: ${accountState?.watchlist}'),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  Hah(),
                  Builder(builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                          onPressed: () {
                            // getIt<MovieRouter>()
                            //     .push(MovieImagePageRoute(movie: movieDetail));
                            MovieBloc bloc = context.read<MovieBloc>();
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return BlocProvider.value(
                                value: bloc,
                                child: MovieImagePage(movie: movieDetail),
                              );
                            }));
                          },
                          child: Text(
                            'Movie Images',
                            style: Theme.of(context).textTheme.headline4,
                          )),
                    );
                  }),
                  CachedNetworkImage(
                      imageUrl:
                          ImageGlobalConfig.imageUrl(movieDetail.posterPath)),
                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      movieDetail.title,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class Hah extends StatelessWidget {
  const Hah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('hahah: ${context.read<MovieBloc>().hashCode}');
  }
}
