import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/domain/model/enum_values/enum_values.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';
part 'discover_method.freezed.dart';

@freezed
class DiscoverMethod with _$DiscoverMethod implements AppMethod {
  /// Discover Movie
  const factory DiscoverMethod.discoverMovie({
    String? region,
    // String? sortBy,
    @Default(SortByKeyword.Popularity) SortByKeyword sortByKeyword,
    @Default(SortByDirection.DESC) SortByDirection sortByDirection,
    String? certificationCountry,
    String? certification,
    String? certificationLte,
    String? certificationGte,
    bool? includeAdult,
    bool? includeVideo,
    int? page,
    int? primaryReleaseYear,
    String? primaryReleaseDateGte,
    String? primaryReleaseDateLte,
    String? releaseDateGte,
    String? releaseDateLte,
    int? withReleaseType,
    int? year,
    int? voteCountGte,
    int? voteCountLte,
    num? voteAverageGte,
    num? voteAverageLte,
    String? withCast,
    String? withCrew,
    String? withPeople,
    String? withCompanies,
    String? withGenres,
    String? withoutGenres,
    String? withKeywords,
    String? withoutKeywords,
    int? withRuntimeGte,
    int? withRuntimeLte,
    String? withOriginalLanguage,
    String? withWatchProviders,
    String? watchRegion,
    @Default(MonetizationType.FlatRate)
        MonetizationType withWatchMonetizationTypes,
  }) = DiscoverMovie;

  /// Discover TV
  const factory DiscoverMethod.discoverTV({
    // String? sortBy,
    @Default(SortByKeyword.Popularity) SortByKeyword sortByKeyword,
    @Default(SortByDirection.DESC) SortByDirection sortByDirection,
    String? airDateGte,
    String? airDateLte,
    String? firstAirDateGte,
    String? firstAirDateLte,
    int? firstAirDateYear,
    int? page,
    String? timezone,
    num? voteAverageGte,
    int? voteCountGte,
    String? withGenres,
    String? withNetworks,
    String? withoutGenres,
    int? withRuntimeGte,
    int? withRuntimeLte,
    bool? includeNullFirstAirDates,
    String? withOriginalLanguage,
    String? withoutKeywords,
    bool? screenedTheatrically,
    String? withCompanies,
    String? withKeywords,
    String? withWatchProviders,
    String? watchRegion,
    @Default(MonetizationType.FlatRate)
        MonetizationType withWatchMonetizationTypes,
  }) = DiscoverTV;
}
