// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browse_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SearchQuery)
final searchQueryProvider = SearchQueryProvider._();

final class SearchQueryProvider extends $NotifierProvider<SearchQuery, String> {
  SearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchQueryHash();

  @$internal
  @override
  SearchQuery create() => SearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$searchQueryHash() => r'1f7487578a481f855770a91719d9d7f2792ac37e';

abstract class _$SearchQuery extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(browseListings)
final browseListingsProvider = BrowseListingsProvider._();

final class BrowseListingsProvider
    extends $FunctionalProvider<List<Listing>, List<Listing>, List<Listing>>
    with $Provider<List<Listing>> {
  BrowseListingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'browseListingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$browseListingsHash();

  @$internal
  @override
  $ProviderElement<List<Listing>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Listing> create(Ref ref) {
    return browseListings(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Listing> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Listing>>(value),
    );
  }
}

String _$browseListingsHash() => r'4aba0b91091c4a1bfda475598dea6e7706bd2881';
