import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/application/bloc/tv/tv_bloc.dart';
import 'package:movie_info/application/get_it/get_it_main.dart';
import 'package:movie_info/application/util/app_image_config.dart';
import 'package:movie_info/domain/model/account_state/account_state.dart';
import 'package:movie_info/domain/model/tv/tv.dart';
import 'package:movie_info/domain/service/i_app_service.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';
import 'package:movie_info/infrastructure/util/dio_logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:provider/provider.dart';

class TVDetailPage extends StatefulWidget {
  final TV tv;
  const TVDetailPage({Key? key, required this.tv}) : super(key: key);

  @override
  _TVDetailPageState createState() => _TVDetailPageState();
}

class _TVDetailPageState extends State<TVDetailPage> {
  late TV tvDetail;
  AccountState? accountState;
  @override
  void initState() {
    super.initState();
    tvDetail = widget.tv;
    addDioLogger(
        PrettyDioLogger(requestHeader: true, requestBody: true, error: false));
    getIt<IAppService>().execute(DiscoverMovie());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => getIt<TVBloc>()
        ..add(
          TVEvent.detail(
            movieId: widget.tv.id,
          ),
        )
        ,
        child: BlocListener<TVBloc, TVState>(
          listenWhen: (previousState, state) {
            return state.maybeMap(detail: (_) => true, orElse: () => false);
          },
          listener: (context, state) {
            state.mapOrNull(detail: (detail) {
              tvDetail = detail.tv;
            });
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text('${tvDetail.name}'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  BlocBuilder<TVBloc, TVState>(
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
                                  context.read<TVBloc>().add(
                                      TVEvent.accountState(
                                          movieId: tvDetail.id));
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
                  CachedNetworkImage(
                      imageUrl:
                          ImageGlobalConfig.imageUrl(tvDetail.posterPath)),
                ],
              ),
            ),
          ),
        ));
  }
}