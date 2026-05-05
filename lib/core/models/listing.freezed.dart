// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Listing {

 String get cid; String get title; int get priceCents; DateTime get createdAt; List<String> get categories; Set<String> get seenFromSources; String? get thumbnailUrl; String? get location;
/// Create a copy of Listing
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListingCopyWith<Listing> get copyWith => _$ListingCopyWithImpl<Listing>(this as Listing, _$identity);

  /// Serializes this Listing to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Listing&&(identical(other.cid, cid) || other.cid == cid)&&(identical(other.title, title) || other.title == title)&&(identical(other.priceCents, priceCents) || other.priceCents == priceCents)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.seenFromSources, seenFromSources)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cid,title,priceCents,createdAt,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(seenFromSources),thumbnailUrl,location);

@override
String toString() {
  return 'Listing(cid: $cid, title: $title, priceCents: $priceCents, createdAt: $createdAt, categories: $categories, seenFromSources: $seenFromSources, thumbnailUrl: $thumbnailUrl, location: $location)';
}


}

/// @nodoc
abstract mixin class $ListingCopyWith<$Res>  {
  factory $ListingCopyWith(Listing value, $Res Function(Listing) _then) = _$ListingCopyWithImpl;
@useResult
$Res call({
 String cid, String title, int priceCents, DateTime createdAt, List<String> categories, Set<String> seenFromSources, String? thumbnailUrl, String? location
});




}
/// @nodoc
class _$ListingCopyWithImpl<$Res>
    implements $ListingCopyWith<$Res> {
  _$ListingCopyWithImpl(this._self, this._then);

  final Listing _self;
  final $Res Function(Listing) _then;

/// Create a copy of Listing
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cid = null,Object? title = null,Object? priceCents = null,Object? createdAt = null,Object? categories = null,Object? seenFromSources = null,Object? thumbnailUrl = freezed,Object? location = freezed,}) {
  return _then(_self.copyWith(
cid: null == cid ? _self.cid : cid // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,priceCents: null == priceCents ? _self.priceCents : priceCents // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,seenFromSources: null == seenFromSources ? _self.seenFromSources : seenFromSources // ignore: cast_nullable_to_non_nullable
as Set<String>,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Listing].
extension ListingPatterns on Listing {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Listing value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Listing() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Listing value)  $default,){
final _that = this;
switch (_that) {
case _Listing():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Listing value)?  $default,){
final _that = this;
switch (_that) {
case _Listing() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String cid,  String title,  int priceCents,  DateTime createdAt,  List<String> categories,  Set<String> seenFromSources,  String? thumbnailUrl,  String? location)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Listing() when $default != null:
return $default(_that.cid,_that.title,_that.priceCents,_that.createdAt,_that.categories,_that.seenFromSources,_that.thumbnailUrl,_that.location);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String cid,  String title,  int priceCents,  DateTime createdAt,  List<String> categories,  Set<String> seenFromSources,  String? thumbnailUrl,  String? location)  $default,) {final _that = this;
switch (_that) {
case _Listing():
return $default(_that.cid,_that.title,_that.priceCents,_that.createdAt,_that.categories,_that.seenFromSources,_that.thumbnailUrl,_that.location);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String cid,  String title,  int priceCents,  DateTime createdAt,  List<String> categories,  Set<String> seenFromSources,  String? thumbnailUrl,  String? location)?  $default,) {final _that = this;
switch (_that) {
case _Listing() when $default != null:
return $default(_that.cid,_that.title,_that.priceCents,_that.createdAt,_that.categories,_that.seenFromSources,_that.thumbnailUrl,_that.location);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Listing extends Listing {
  const _Listing({required this.cid, required this.title, required this.priceCents, required this.createdAt, final  List<String> categories = const <String>[], final  Set<String> seenFromSources = const <String>{}, this.thumbnailUrl, this.location}): _categories = categories,_seenFromSources = seenFromSources,super._();
  factory _Listing.fromJson(Map<String, dynamic> json) => _$ListingFromJson(json);

@override final  String cid;
@override final  String title;
@override final  int priceCents;
@override final  DateTime createdAt;
 final  List<String> _categories;
@override@JsonKey() List<String> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  Set<String> _seenFromSources;
@override@JsonKey() Set<String> get seenFromSources {
  if (_seenFromSources is EqualUnmodifiableSetView) return _seenFromSources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_seenFromSources);
}

@override final  String? thumbnailUrl;
@override final  String? location;

/// Create a copy of Listing
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListingCopyWith<_Listing> get copyWith => __$ListingCopyWithImpl<_Listing>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Listing&&(identical(other.cid, cid) || other.cid == cid)&&(identical(other.title, title) || other.title == title)&&(identical(other.priceCents, priceCents) || other.priceCents == priceCents)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._seenFromSources, _seenFromSources)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cid,title,priceCents,createdAt,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_seenFromSources),thumbnailUrl,location);

@override
String toString() {
  return 'Listing(cid: $cid, title: $title, priceCents: $priceCents, createdAt: $createdAt, categories: $categories, seenFromSources: $seenFromSources, thumbnailUrl: $thumbnailUrl, location: $location)';
}


}

/// @nodoc
abstract mixin class _$ListingCopyWith<$Res> implements $ListingCopyWith<$Res> {
  factory _$ListingCopyWith(_Listing value, $Res Function(_Listing) _then) = __$ListingCopyWithImpl;
@override @useResult
$Res call({
 String cid, String title, int priceCents, DateTime createdAt, List<String> categories, Set<String> seenFromSources, String? thumbnailUrl, String? location
});




}
/// @nodoc
class __$ListingCopyWithImpl<$Res>
    implements _$ListingCopyWith<$Res> {
  __$ListingCopyWithImpl(this._self, this._then);

  final _Listing _self;
  final $Res Function(_Listing) _then;

/// Create a copy of Listing
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cid = null,Object? title = null,Object? priceCents = null,Object? createdAt = null,Object? categories = null,Object? seenFromSources = null,Object? thumbnailUrl = freezed,Object? location = freezed,}) {
  return _then(_Listing(
cid: null == cid ? _self.cid : cid // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,priceCents: null == priceCents ? _self.priceCents : priceCents // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,seenFromSources: null == seenFromSources ? _self._seenFromSources : seenFromSources // ignore: cast_nullable_to_non_nullable
as Set<String>,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
