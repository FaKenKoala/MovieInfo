import 'package:movie_info/domain/model/authentication/account.dart';
import 'package:movie_info/domain/service/i_app_service.dart';

import 'app_method_part/authentication_method.dart';
import 'app_method_part/certification_method.dart';
import 'app_method_part/change_method.dart';
import 'app_method_part/collection_method.dart';
import 'app_method_part/company_method.dart';
import 'app_method_part/configuration_method.dart';
import 'app_method_part/credit_method.dart';
import 'app_method_part/discover_method.dart';
import 'app_method_part/find_method.dart';
import 'app_method_part/genre_method.dart';
import 'app_method_part/guest_session_method.dart';
import 'app_method_part/keyword_method.dart';
import 'app_method_part/list_method.dart';
import 'app_method_part/movie_method.dart';
import 'app_method_part/network_method.dart';
import 'app_method_part/person_method.dart';
import 'app_method_part/review_method.dart';
import 'app_method_part/search_method.dart';
import 'app_method_part/trending_method.dart';
import 'app_method_part/tv_episode_group_method.dart';
import 'app_method_part/tv_episode_method.dart';
import 'app_method_part/tv_method.dart';
import 'app_method_part/tv_season_method.dart';
import 'app_method_part/watch_provider_method.dart';

export 'app_method_part/certification_method.dart';
export 'app_method_part/change_method.dart';
export 'app_method_part/collection_method.dart';
export 'app_method_part/company_method.dart';
export 'app_method_part/configuration_method.dart';
export 'app_method_part/credit_method.dart';
export 'app_method_part/discover_method.dart';
export 'app_method_part/find_method.dart';
export 'app_method_part/genre_method.dart';
export 'app_method_part/guest_session_method.dart';
export 'app_method_part/keyword_method.dart';
export 'app_method_part/list_method.dart';
export 'app_method_part/movie_method.dart';
export 'app_method_part/network_method.dart';
export 'app_method_part/person_method.dart';
export 'app_method_part/review_method.dart';
export 'app_method_part/search_method.dart';
export 'app_method_part/trending_method.dart';
export 'app_method_part/tv_episode_group_method.dart';
export 'app_method_part/tv_episode_method.dart';
export 'app_method_part/tv_method.dart';
export 'app_method_part/tv_season_method.dart';
export 'app_method_part/watch_provider_method.dart';

class AppMethod implements IAppMethod {}

extension AppMethodX on AppMethod {
  AppMethodType get methodType {
    if (this is Account) return AppMethodType.Account;

    if (this is AuthenticationMethod) return AppMethodType.Authentication;

    if (this is CertificationMethod) return AppMethodType.Certification;

    if (this is ChangeMethod) return AppMethodType.Change;

    if (this is CollectionMethod) return AppMethodType.Collection;

    if (this is CompanyMethod) return AppMethodType.Company;

    if (this is ConfigurationMethod) return AppMethodType.Configuration;

    if (this is CreditMethod) return AppMethodType.Credit;

    if (this is DiscoverMethod) return AppMethodType.Discover;

    if (this is FindMethod) return AppMethodType.Find;

    if (this is GenreMethod) return AppMethodType.Genre;

    if (this is GuestSessionMethod) return AppMethodType.GuestSession;

    if (this is KeywordMethod) return AppMethodType.Keyword;

    if (this is ListMethod) return AppMethodType.List;

    if (this is MovieMethod) return AppMethodType.Movie;

    if (this is NetworkMethod) return AppMethodType.Network;

    if (this is PersonMethod) return AppMethodType.Person;

    if (this is ReviewMethod) return AppMethodType.Review;

    if (this is SearchMethod) return AppMethodType.Search;

    if (this is TrendingMethod) return AppMethodType.Trending;

    if (this is TVEpisodeGroupMethod) return AppMethodType.TVEpisodeGroup;

    if (this is TVEpisodeMethod) return AppMethodType.TVEpisode;

    if (this is TVMethod) return AppMethodType.TV;

    if (this is TVSeasonMethod) return AppMethodType.TVSeason;

    if (this is WatchProviderMethod) return AppMethodType.WatchProvider;

    return AppMethodType.Unknow;
  }
}

enum AppMethodType {
  Account,
  Authentication,
  Certification,
  Change,
  Collection,
  Company,
  Configuration,
  Credit,
  Discover,
  Find,
  Genre,
  GuestSession,
  Keyword,
  List,
  Movie,
  Network,
  Person,
  Review,
  Search,
  Trending,
  TV,
  TVEpisode,
  TVEpisodeGroup,
  TVSeason,
  Unknow,
  WatchProvider,
}
