import 'package:dio/dio.dart' hide Headers;
import 'package:injectable/injectable.dart';
import 'package:movie_info/domain/model/account_state/account_state.dart';
import 'package:movie_info/domain/model/api_result/id_result.dart';
import 'package:movie_info/domain/model/code_response/code_response.dart';
import 'package:movie_info/domain/model/configuration/configuration.dart';
import 'package:movie_info/domain/model/find/find_result.dart';
import 'package:movie_info/domain/model/media/image.dart';
import 'package:movie_info/domain/model/movie/external_id.dart';
import 'package:movie_info/domain/model/movie/keyword.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/model/tv/tv.dart';

import 'package:movie_info/domain/model/change/change.dart';
import 'package:movie_info/domain/model/media/media_credit.dart';
import 'package:movie_info/domain/model/movie/movie_list.dart';
import 'package:movie_info/domain/model/api_result/page_result.dart';
import 'package:movie_info/domain/model/movie/rate_content.dart';
import 'package:movie_info/domain/model/recommendation/recommendation.dart';
import 'package:movie_info/domain/model/release_date/release_date.dart';
import 'package:movie_info/domain/model/review/review.dart';
import 'package:movie_info/domain/model/title/title.dart';
import 'package:movie_info/domain/model/translation/translatetion_list.dart';
import 'package:movie_info/domain/model/watch_provider/watch_provider_list.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_repository_part/watch_providers_repository.dart';
part 'remote_repository_part/movie_repository.dart';
part 'remote_repository_part/discover_repository.dart';
part 'remote_repository_part/genres_repository.dart';
part 'remote_repository_part/tv_repository.dart';
part 'remote_repository_part/tv_episode_groups_repository.dart';
part 'remote_repository_part/companies_repository.dart';

part 'remote_repository_part/networks_repository.dart';
part 'remote_repository_part/tv_episodes_repository.dart';
part 'remote_repository_part/tv_seasons_repository.dart';

part 'remote_repository_part/search_repository.dart';
part 'remote_repository_part/collections_repository.dart';

part 'remote_repository_part/people_repository.dart';
part 'remote_repository_part/certifications_repository.dart';
part 'remote_repository_part/configuration_repository.dart';
part 'remote_repository_part/lists_repository.dart';
part 'remote_repository_part/changes_repository.dart';
part 'remote_repository_part/credits_repository.dart';
part 'remote_repository_part/find_repository.dart';
part 'remote_repository_part/guest_sessions_repository.dart';
part 'remote_repository_part/reviews_repository.dart';
part 'remote_repository_part/trending_repository.dart';

part 'remote_repository.g.dart';

@RestApi()
@singleton
abstract class RemoteRepository
    with
        ConfigurationRepository,
        DiscoverRepository,
        FindRepository,
        MovieRepository,
        TrendingRepository,
        TVRepository {
  @factoryMethod
  factory RemoteRepository(Dio dio, {@Named("baseUrl") String baseUrl}) =
      _RemoteRepository;
}
