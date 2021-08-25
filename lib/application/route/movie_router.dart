import 'package:auto_route/annotations.dart';
import 'package:movie_info/presentation/page/home/home_page.dart';
import 'package:movie_info/presentation/page/movie/movie_detail.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: MyHomePage, initial: true),
  AutoRoute(page: MovieDetail),
])
class $MovieRouter {}
