import 'package:dio/dio.dart' hide Headers;
import 'package:injectable/injectable.dart';
import 'package:movie_info/domain/model/account_state/account_state.dart';
import 'package:movie_info/domain/model/api_result/id_result.dart';
import 'package:movie_info/domain/model/api_result/list_result.dart';
import 'package:movie_info/domain/model/api_result/page_result.dart';
import 'package:movie_info/domain/model/authentication/guest_session.dart';
import 'package:movie_info/domain/model/certification/certification.dart';
import 'package:movie_info/domain/model/change/change.dart';
import 'package:movie_info/domain/model/code_response/code_response.dart';
import 'package:movie_info/domain/model/collection/collection.dart';
import 'package:movie_info/domain/model/company/company.dart';
import 'package:movie_info/domain/model/configuration/configuration.dart';
import 'package:movie_info/domain/model/content_rating/content_rating.dart';
import 'package:movie_info/domain/model/country/country.dart';
import 'package:movie_info/domain/model/enum_values/enum_values.dart';
import 'package:movie_info/domain/model/find/find_result.dart';
import 'package:movie_info/domain/model/genre/genre_list.dart';
import 'package:movie_info/domain/model/language/language.dart';
import 'package:movie_info/domain/model/language/timezone.dart';
import 'package:movie_info/domain/model/list/add_list_item.dart';
import 'package:movie_info/domain/model/list/media_item_status.dart';
import 'package:movie_info/domain/model/list/media_list.dart';
import 'package:movie_info/domain/model/list/new_list_content.dart';
import 'package:movie_info/domain/model/list/new_list_response.dart';
import 'package:movie_info/domain/model/person/tv_credit_list.dart';
import 'package:movie_info/domain/model/person/credit.dart';
import 'package:movie_info/domain/model/person/credit_list.dart';
import 'package:movie_info/domain/model/media/image.dart';
import 'package:movie_info/domain/model/media/keyword.dart';
import 'package:movie_info/domain/model/media/video.dart';
import 'package:movie_info/domain/model/media/external_id.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/model/media/rate_content.dart';
import 'package:movie_info/domain/model/media/name.dart';
import 'package:movie_info/domain/model/network/network.dart';
import 'package:movie_info/domain/model/person/person.dart';
import 'package:movie_info/domain/model/person/profile_image.dart';
import 'package:movie_info/domain/model/release_date/release_date.dart';
import 'package:movie_info/domain/model/review/review.dart';
import 'package:movie_info/domain/model/title/title.dart';
import 'package:movie_info/domain/model/translation/translatetion_list.dart';
import 'package:movie_info/domain/model/tv/episode_group.dart';
import 'package:movie_info/domain/model/tv/episode.dart';
import 'package:movie_info/domain/model/tv/season.dart';
import 'package:movie_info/domain/model/tv/tv.dart';
import 'package:movie_info/domain/model/watch_provider/region.dart';
import 'package:movie_info/domain/model/watch_provider/watch_provider.dart';
import 'package:movie_info/infrastructure/util/constant.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_repository_part/authentication_repository.dart';
part 'remote_repository_part/certification_repository.dart';
part 'remote_repository_part/change_repository.dart';
part 'remote_repository_part/collection_repository.dart';
part 'remote_repository_part/company_repository.dart';
part 'remote_repository_part/configuration_repository.dart';
part 'remote_repository_part/credit_repository.dart';
part 'remote_repository_part/discover_repository.dart';
part 'remote_repository_part/find_repository.dart';
part 'remote_repository_part/genre_repository.dart';
part 'remote_repository_part/guest_session_repository.dart';
part 'remote_repository_part/keyword_repository.dart';
part 'remote_repository_part/list_repository.dart';
part 'remote_repository_part/movie_repository.dart';
part 'remote_repository_part/network_repository.dart';
part 'remote_repository_part/person_repository.dart';
part 'remote_repository_part/reviews_repository.dart';
part 'remote_repository_part/search_repository.dart';
part 'remote_repository_part/trending_repository.dart';
part 'remote_repository_part/tv_episode_groups_repository.dart';
part 'remote_repository_part/tv_episode_repository.dart';
part 'remote_repository_part/tv_repository.dart';
part 'remote_repository_part/tv_season_repository.dart';
part 'remote_repository_part/watch_provider_repository.dart';

part 'remote_repository.g.dart';

@RestApi()
@singleton
abstract class RemoteRepository
    with
        AuthenticationRepository,
        CertificationRepository,
        ChangeRepository,
        CompanyRepository,
        CollectionRepository,
        ConfigurationRepository,
        CreditRepository,
        DiscoverRepository,
        FindRepository,
        GuestSessionRepository,
        GenreRepository,
        KeywordRepository,
        MovieRepository,
        ListRepository,
        NetworkRepository,
        PersonRepository,
        ReviewRepository,
        SearchRepository,
        TrendingRepository,
        TVEpisodeGroupsRepository,
        TVSeasonRepository,
        TVEpisodeRepository,
        TVRepository,
        WatchProvidersRepository {
  @factoryMethod
  factory RemoteRepository(Dio dio, {@Named("baseUrl") String baseUrl}) =
      _RemoteRepository;
}
