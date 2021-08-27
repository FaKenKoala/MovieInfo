import 'package:dio/dio.dart' hide Headers;
import 'package:injectable/injectable.dart';
import 'package:movie_info/domain/model/account_state/account_state.dart';
import 'package:movie_info/domain/model/api_result/id_result.dart';
import 'package:movie_info/domain/model/api_result/list_result.dart';
import 'package:movie_info/domain/model/api_result/page_result.dart';
import 'package:movie_info/domain/model/change/change_list.dart';
import 'package:movie_info/domain/model/code_response/code_response.dart';
import 'package:movie_info/domain/model/company/company.dart';
import 'package:movie_info/domain/model/configuration/configuration.dart';
import 'package:movie_info/domain/model/content_rating/content_rating.dart';
import 'package:movie_info/domain/model/find/find_result.dart';
import 'package:movie_info/domain/model/genre/genre_list.dart';
import 'package:movie_info/domain/model/person/credit.dart';
import 'package:movie_info/domain/model/person/credit_list.dart';
import 'package:movie_info/domain/model/media/image.dart';
import 'package:movie_info/domain/model/media/keyword.dart';
import 'package:movie_info/domain/model/media/video.dart';
import 'package:movie_info/domain/model/movie/external_id.dart';
import 'package:movie_info/domain/model/movie/movie_list.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/model/movie/rate_content.dart';
import 'package:movie_info/domain/model/media/name.dart';
import 'package:movie_info/domain/model/network/network.dart';
import 'package:movie_info/domain/model/person/person.dart';
import 'package:movie_info/domain/model/release_date/release_date.dart';
import 'package:movie_info/domain/model/review/review.dart';
import 'package:movie_info/domain/model/title/title.dart';
import 'package:movie_info/domain/model/translation/translatetion_list.dart';
import 'package:movie_info/domain/model/tv/episode_group.dart';
import 'package:movie_info/domain/model/tv/episode.dart';
import 'package:movie_info/domain/model/tv/tv.dart';
import 'package:movie_info/domain/model/watch_provider/flatrate.dart';
import 'package:movie_info/domain/model/watch_provider/region.dart';
import 'package:movie_info/domain/model/watch_provider/watch_provider_list.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_repository_part/certification_repository.dart';
part 'remote_repository_part/change_repository.dart';
part 'remote_repository_part/collection_repository.dart';
part 'remote_repository_part/company_repository.dart';
part 'remote_repository_part/configuration_repository.dart';
part 'remote_repository_part/credit_repository.dart';
part 'remote_repository_part/discover_repository.dart';
part 'remote_repository_part/find_repository.dart';
part 'remote_repository_part/genre_repository.dart';
part 'remote_repository_part/guest_sessions_repository.dart';
part 'remote_repository_part/keyword_repository.dart';
part 'remote_repository_part/lists_repository.dart';
part 'remote_repository_part/movie_repository.dart';
part 'remote_repository_part/network_repository.dart';
part 'remote_repository_part/people_repository.dart';
part 'remote_repository_part/reviews_repository.dart';
part 'remote_repository_part/search_repository.dart';
part 'remote_repository_part/trending_repository.dart';
part 'remote_repository_part/tv_episode_groups_repository.dart';
part 'remote_repository_part/tv_episodes_repository.dart';
part 'remote_repository_part/tv_repository.dart';
part 'remote_repository_part/tv_seasons_repository.dart';
part 'remote_repository_part/watch_provider_repository.dart';

part 'remote_repository.g.dart';

@RestApi()
@singleton
abstract class RemoteRepository
    with
        ChangeRepository,
        CompanyRepository,
        CollectionRepository,
        ConfigurationRepository,
        CreditRepository,
        DiscoverRepository,
        FindRepository,
        GenreRepository,
        KeywordRepository,
        MovieRepository,
        NetworkRepository,
        TrendingRepository,
        TVEpisodeGroupsRepository,
        TVRepository,
        WatchProvidersRepository {
  @factoryMethod
  factory RemoteRepository(Dio dio, {@Named("baseUrl") String baseUrl}) =
      _RemoteRepository;
}
