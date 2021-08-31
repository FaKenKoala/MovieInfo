import 'package:dartz/dartz.dart';
import 'package:movie_info/domain/model/code_response/app_exception.dart';

typedef AppExceptionEither<T> = Either<AppException, T>;

abstract class IAppService {
  Future<AppExceptionEither<T>> execute<T>(covariant IAppMethod method);
}

abstract class IAppMethod {}