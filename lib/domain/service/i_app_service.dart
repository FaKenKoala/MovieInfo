
import 'package:movie_info/infrastructure/app_method/app_method.dart';

abstract class IAppService {
  Future<AppExceptionEither<T>> execute<T>(AppMethod method);
}
