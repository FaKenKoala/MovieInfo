// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_info/application/get_it/get_it_main.dart';
import 'package:movie_info/domain/model/enum_values/enum_values.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/model/api_result/page_result.dart';
import 'package:movie_info/domain/service/i_app_service.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';
import 'package:movie_info/presentation/page/app/app.dart';

void main() {
  late IAppService service;
  late Movie globalMovie;
  setUp(() async {
    // await configureGetIt();
    service = getIt<IAppService>();
  });

  _getMovieDetail() async {
    await service.execute(GetMovieDetail(movieId: globalMovie.id));
  }

  _getAlternativeTitles() async {
    await service.execute(GetMovieAlternativeTitles(movieId: globalMovie.id));
  }

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);

    AppExceptionEither<PageResult<Movie>> movies = await service.execute(
        GetTrending(mediaType: MediaType.MOVIE, timeWindow: TimeWindow.DAY));
    movies.toOption().flatMap<Movie>((movies) {
      if (movies.results.isNotEmpty) {
        return some(movies.results.first);
      }
      return none();
    }).flatMap((movie) {
      globalMovie = movie;
      _getMovieDetail();

      _getAlternativeTitles();

      return some(movie);
    });
  });
}
