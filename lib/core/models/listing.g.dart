// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Listing _$ListingFromJson(Map<String, dynamic> json) => _Listing(
  cid: json['cid'] as String,
  title: json['title'] as String,
  priceCents: (json['priceCents'] as num).toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  seenFromSources:
      (json['seenFromSources'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toSet() ??
      const <String>{},
  thumbnailUrl: json['thumbnailUrl'] as String?,
  location: json['location'] as String?,
);

Map<String, dynamic> _$ListingToJson(_Listing instance) => <String, dynamic>{
  'cid': instance.cid,
  'title': instance.title,
  'priceCents': instance.priceCents,
  'createdAt': instance.createdAt.toIso8601String(),
  'categories': instance.categories,
  'seenFromSources': instance.seenFromSources.toList(),
  'thumbnailUrl': instance.thumbnailUrl,
  'location': instance.location,
};
