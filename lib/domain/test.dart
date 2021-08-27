import 'package:freezed_annotation/freezed_annotation.dart';

part 'test.freezed.dart';

class BaseMethod {}

@freezed
@Implements(BaseMethod)
class MovieMethod with _$MovieMethod {
  const factory MovieMethod.getMovieDetail({required String movieId}) =
      GetMovieDetail;
  const factory MovieMethod.getMovieCast({required String movieId}) =
      GetMovieCast;
}

@freezed
@Implements(BaseMethod)
class TVMethod with _$TVMethod {
  const factory TVMethod.getTVDetail({required String tvId}) = GetTVDetail;
  const factory TVMethod.getTVCast({required String tvId}) = GetTVCast;
}

void test(BaseMethod method, MovieMethod movieMethod) {
  
  switch (method.runtimeType) {
    case MovieMethod:
      final aa = method as MovieMethod;
      
      break;
    case TVMethod:
      break;
  }
}
