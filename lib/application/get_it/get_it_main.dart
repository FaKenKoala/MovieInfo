import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_info/application/route/movie_router.gr.dart';
import 'get_it_main.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: false,
  asExtension: false,
)
configureGetIt() async {
  await $initGetIt(getIt);
  getIt.registerSingleton(MovieRouter());
}
