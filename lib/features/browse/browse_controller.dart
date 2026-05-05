// TODO: @riverpod. Watches listings stream from repo + AppSettings.activeFilters/defaultSort. Returns sorted, filtered List<Listing>.
//
// Currently reads from `seed_listings.dart` and applies a case-insensitive
// title contains-match against `searchQueryProvider`. Swap the source list
// to `listingsRepositoryProvider.watch(...)` once the real repo lands.

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/models/listing.dart';
import 'seed_listings.dart';

part 'browse_controller.g.dart';

@riverpod
class SearchQuery extends _$SearchQuery {
  @override
  String build() => '';

  void update(String value) => state = value;
  void clear() => state = '';
}

@riverpod
List<Listing> browseListings(Ref ref) {
  final query = ref.watch(searchQueryProvider).trim().toLowerCase();
  if (query.isEmpty) return kSeedListings;
  return kSeedListings
      .where((l) => l.title.toLowerCase().contains(query))
      .toList(growable: false);
}
