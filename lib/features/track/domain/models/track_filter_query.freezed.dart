/*
 * Pusoo - IPTV Player
 * Copyright (C) 2025 Ibnul Mutaki <ibnuul@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */


// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'track_filter_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrackFilterQuery {

 List<int>? get playlistIds; String? get groupTitle; String? get title; String? get titleOrGroupTitle; int? get limit; int? get offset; int? get cursor; bool? get isMovie; bool? get isLiveTv; bool? get isTvSerie;
/// Create a copy of TrackFilterQuery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackFilterQueryCopyWith<TrackFilterQuery> get copyWith => _$TrackFilterQueryCopyWithImpl<TrackFilterQuery>(this as TrackFilterQuery, _$identity);

  /// Serializes this TrackFilterQuery to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackFilterQuery&&const DeepCollectionEquality().equals(other.playlistIds, playlistIds)&&(identical(other.groupTitle, groupTitle) || other.groupTitle == groupTitle)&&(identical(other.title, title) || other.title == title)&&(identical(other.titleOrGroupTitle, titleOrGroupTitle) || other.titleOrGroupTitle == titleOrGroupTitle)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.cursor, cursor) || other.cursor == cursor)&&(identical(other.isMovie, isMovie) || other.isMovie == isMovie)&&(identical(other.isLiveTv, isLiveTv) || other.isLiveTv == isLiveTv)&&(identical(other.isTvSerie, isTvSerie) || other.isTvSerie == isTvSerie));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(playlistIds),groupTitle,title,titleOrGroupTitle,limit,offset,cursor,isMovie,isLiveTv,isTvSerie);

@override
String toString() {
  return 'TrackFilterQuery(playlistIds: $playlistIds, groupTitle: $groupTitle, title: $title, titleOrGroupTitle: $titleOrGroupTitle, limit: $limit, offset: $offset, cursor: $cursor, isMovie: $isMovie, isLiveTv: $isLiveTv, isTvSerie: $isTvSerie)';
}


}

/// @nodoc
abstract mixin class $TrackFilterQueryCopyWith<$Res>  {
  factory $TrackFilterQueryCopyWith(TrackFilterQuery value, $Res Function(TrackFilterQuery) _then) = _$TrackFilterQueryCopyWithImpl;
@useResult
$Res call({
 List<int>? playlistIds, String? groupTitle, String? title, String? titleOrGroupTitle, int? limit, int? offset, int? cursor, bool? isMovie, bool? isLiveTv, bool? isTvSerie
});




}
/// @nodoc
class _$TrackFilterQueryCopyWithImpl<$Res>
    implements $TrackFilterQueryCopyWith<$Res> {
  _$TrackFilterQueryCopyWithImpl(this._self, this._then);

  final TrackFilterQuery _self;
  final $Res Function(TrackFilterQuery) _then;

/// Create a copy of TrackFilterQuery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? playlistIds = freezed,Object? groupTitle = freezed,Object? title = freezed,Object? titleOrGroupTitle = freezed,Object? limit = freezed,Object? offset = freezed,Object? cursor = freezed,Object? isMovie = freezed,Object? isLiveTv = freezed,Object? isTvSerie = freezed,}) {
  return _then(_self.copyWith(
playlistIds: freezed == playlistIds ? _self.playlistIds : playlistIds // ignore: cast_nullable_to_non_nullable
as List<int>?,groupTitle: freezed == groupTitle ? _self.groupTitle : groupTitle // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,titleOrGroupTitle: freezed == titleOrGroupTitle ? _self.titleOrGroupTitle : titleOrGroupTitle // ignore: cast_nullable_to_non_nullable
as String?,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,offset: freezed == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int?,cursor: freezed == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as int?,isMovie: freezed == isMovie ? _self.isMovie : isMovie // ignore: cast_nullable_to_non_nullable
as bool?,isLiveTv: freezed == isLiveTv ? _self.isLiveTv : isLiveTv // ignore: cast_nullable_to_non_nullable
as bool?,isTvSerie: freezed == isTvSerie ? _self.isTvSerie : isTvSerie // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrackFilterQuery].
extension TrackFilterQueryPatterns on TrackFilterQuery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrackFilterQuery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrackFilterQuery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrackFilterQuery value)  $default,){
final _that = this;
switch (_that) {
case _TrackFilterQuery():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrackFilterQuery value)?  $default,){
final _that = this;
switch (_that) {
case _TrackFilterQuery() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<int>? playlistIds,  String? groupTitle,  String? title,  String? titleOrGroupTitle,  int? limit,  int? offset,  int? cursor,  bool? isMovie,  bool? isLiveTv,  bool? isTvSerie)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrackFilterQuery() when $default != null:
return $default(_that.playlistIds,_that.groupTitle,_that.title,_that.titleOrGroupTitle,_that.limit,_that.offset,_that.cursor,_that.isMovie,_that.isLiveTv,_that.isTvSerie);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<int>? playlistIds,  String? groupTitle,  String? title,  String? titleOrGroupTitle,  int? limit,  int? offset,  int? cursor,  bool? isMovie,  bool? isLiveTv,  bool? isTvSerie)  $default,) {final _that = this;
switch (_that) {
case _TrackFilterQuery():
return $default(_that.playlistIds,_that.groupTitle,_that.title,_that.titleOrGroupTitle,_that.limit,_that.offset,_that.cursor,_that.isMovie,_that.isLiveTv,_that.isTvSerie);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<int>? playlistIds,  String? groupTitle,  String? title,  String? titleOrGroupTitle,  int? limit,  int? offset,  int? cursor,  bool? isMovie,  bool? isLiveTv,  bool? isTvSerie)?  $default,) {final _that = this;
switch (_that) {
case _TrackFilterQuery() when $default != null:
return $default(_that.playlistIds,_that.groupTitle,_that.title,_that.titleOrGroupTitle,_that.limit,_that.offset,_that.cursor,_that.isMovie,_that.isLiveTv,_that.isTvSerie);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrackFilterQuery implements TrackFilterQuery {
  const _TrackFilterQuery({final  List<int>? playlistIds, this.groupTitle, this.title, this.titleOrGroupTitle, this.limit, this.offset, this.cursor, this.isMovie, this.isLiveTv, this.isTvSerie}): _playlistIds = playlistIds;
  factory _TrackFilterQuery.fromJson(Map<String, dynamic> json) => _$TrackFilterQueryFromJson(json);

 final  List<int>? _playlistIds;
@override List<int>? get playlistIds {
  final value = _playlistIds;
  if (value == null) return null;
  if (_playlistIds is EqualUnmodifiableListView) return _playlistIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? groupTitle;
@override final  String? title;
@override final  String? titleOrGroupTitle;
@override final  int? limit;
@override final  int? offset;
@override final  int? cursor;
@override final  bool? isMovie;
@override final  bool? isLiveTv;
@override final  bool? isTvSerie;

/// Create a copy of TrackFilterQuery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackFilterQueryCopyWith<_TrackFilterQuery> get copyWith => __$TrackFilterQueryCopyWithImpl<_TrackFilterQuery>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrackFilterQueryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrackFilterQuery&&const DeepCollectionEquality().equals(other._playlistIds, _playlistIds)&&(identical(other.groupTitle, groupTitle) || other.groupTitle == groupTitle)&&(identical(other.title, title) || other.title == title)&&(identical(other.titleOrGroupTitle, titleOrGroupTitle) || other.titleOrGroupTitle == titleOrGroupTitle)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.cursor, cursor) || other.cursor == cursor)&&(identical(other.isMovie, isMovie) || other.isMovie == isMovie)&&(identical(other.isLiveTv, isLiveTv) || other.isLiveTv == isLiveTv)&&(identical(other.isTvSerie, isTvSerie) || other.isTvSerie == isTvSerie));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_playlistIds),groupTitle,title,titleOrGroupTitle,limit,offset,cursor,isMovie,isLiveTv,isTvSerie);

@override
String toString() {
  return 'TrackFilterQuery(playlistIds: $playlistIds, groupTitle: $groupTitle, title: $title, titleOrGroupTitle: $titleOrGroupTitle, limit: $limit, offset: $offset, cursor: $cursor, isMovie: $isMovie, isLiveTv: $isLiveTv, isTvSerie: $isTvSerie)';
}


}

/// @nodoc
abstract mixin class _$TrackFilterQueryCopyWith<$Res> implements $TrackFilterQueryCopyWith<$Res> {
  factory _$TrackFilterQueryCopyWith(_TrackFilterQuery value, $Res Function(_TrackFilterQuery) _then) = __$TrackFilterQueryCopyWithImpl;
@override @useResult
$Res call({
 List<int>? playlistIds, String? groupTitle, String? title, String? titleOrGroupTitle, int? limit, int? offset, int? cursor, bool? isMovie, bool? isLiveTv, bool? isTvSerie
});




}
/// @nodoc
class __$TrackFilterQueryCopyWithImpl<$Res>
    implements _$TrackFilterQueryCopyWith<$Res> {
  __$TrackFilterQueryCopyWithImpl(this._self, this._then);

  final _TrackFilterQuery _self;
  final $Res Function(_TrackFilterQuery) _then;

/// Create a copy of TrackFilterQuery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? playlistIds = freezed,Object? groupTitle = freezed,Object? title = freezed,Object? titleOrGroupTitle = freezed,Object? limit = freezed,Object? offset = freezed,Object? cursor = freezed,Object? isMovie = freezed,Object? isLiveTv = freezed,Object? isTvSerie = freezed,}) {
  return _then(_TrackFilterQuery(
playlistIds: freezed == playlistIds ? _self._playlistIds : playlistIds // ignore: cast_nullable_to_non_nullable
as List<int>?,groupTitle: freezed == groupTitle ? _self.groupTitle : groupTitle // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,titleOrGroupTitle: freezed == titleOrGroupTitle ? _self.titleOrGroupTitle : titleOrGroupTitle // ignore: cast_nullable_to_non_nullable
as String?,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,offset: freezed == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int?,cursor: freezed == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as int?,isMovie: freezed == isMovie ? _self.isMovie : isMovie // ignore: cast_nullable_to_non_nullable
as bool?,isLiveTv: freezed == isLiveTv ? _self.isLiveTv : isLiveTv // ignore: cast_nullable_to_non_nullable
as bool?,isTvSerie: freezed == isTvSerie ? _self.isTvSerie : isTvSerie // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
