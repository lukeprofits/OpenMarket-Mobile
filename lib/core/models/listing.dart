// TODO: @freezed Listing { cid (primary key), title, description, priceCents, imageRefs, createdAt, seenFromSources: Set<String>, categories: List<String>, meta: Map<String, dynamic>? }
//
// Current shape below is the local DB-row subset (filterable fields only).
// description / full imageRefs / meta live in the IPFS document, read directly
// from the local pin when item-detail is built.

import 'package:freezed_annotation/freezed_annotation.dart';

part 'listing.freezed.dart';
part 'listing.g.dart';

@freezed
abstract class Listing with _$Listing {
  const Listing._();

  const factory Listing({
    required String cid,
    required String title,
    required int priceCents,
    required DateTime createdAt,
    @Default(<String>[]) List<String> categories,
    @Default(<String>{}) Set<String> seenFromSources,
    String? thumbnailUrl,
    String? location,
  }) = _Listing;

  factory Listing.fromJson(Map<String, dynamic> json) => _$ListingFromJson(json);

  String get formattedPrice {
    final dollars = priceCents ~/ 100;
    final cents = priceCents.remainder(100).abs();
    if (cents == 0) return '\$$dollars';
    return '\$$dollars.${cents.toString().padLeft(2, '0')}';
  }
}
