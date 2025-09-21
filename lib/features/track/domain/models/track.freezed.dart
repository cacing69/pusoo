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

part of 'track.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Track {

 int get id; String get title; String get contentType; List<String> get links; String get groupTitle; String get imdbId; String get tvgId; String get tvgName; String get desc; String get tvgLogo; Source? get source; int get duration; bool get isNsfw; List<ExtXMedia> get extXMedias; bool get isMovie; bool get isLiveTv; bool get isTvSerie; Map<String, String> get attributes; List<Map<String, String>> get extVlcOpts; List<Map<String, String>> get kodiProps; List<Map<String, String>> get httpHeaders;
/// Create a copy of Track
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackCopyWith<Track> get copyWith => _$TrackCopyWithImpl<Track>(this as Track, _$identity);

  /// Serializes this Track to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Track&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&const DeepCollectionEquality().equals(other.links, links)&&(identical(other.groupTitle, groupTitle) || other.groupTitle == groupTitle)&&(identical(other.imdbId, imdbId) || other.imdbId == imdbId)&&(identical(other.tvgId, tvgId) || other.tvgId == tvgId)&&(identical(other.tvgName, tvgName) || other.tvgName == tvgName)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.tvgLogo, tvgLogo) || other.tvgLogo == tvgLogo)&&(identical(other.source, source) || other.source == source)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.isNsfw, isNsfw) || other.isNsfw == isNsfw)&&const DeepCollectionEquality().equals(other.extXMedias, extXMedias)&&(identical(other.isMovie, isMovie) || other.isMovie == isMovie)&&(identical(other.isLiveTv, isLiveTv) || other.isLiveTv == isLiveTv)&&(identical(other.isTvSerie, isTvSerie) || other.isTvSerie == isTvSerie)&&const DeepCollectionEquality().equals(other.attributes, attributes)&&const DeepCollectionEquality().equals(other.extVlcOpts, extVlcOpts)&&const DeepCollectionEquality().equals(other.kodiProps, kodiProps)&&const DeepCollectionEquality().equals(other.httpHeaders, httpHeaders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,contentType,const DeepCollectionEquality().hash(links),groupTitle,imdbId,tvgId,tvgName,desc,tvgLogo,source,duration,isNsfw,const DeepCollectionEquality().hash(extXMedias),isMovie,isLiveTv,isTvSerie,const DeepCollectionEquality().hash(attributes),const DeepCollectionEquality().hash(extVlcOpts),const DeepCollectionEquality().hash(kodiProps),const DeepCollectionEquality().hash(httpHeaders)]);

@override
String toString() {
  return 'Track(id: $id, title: $title, contentType: $contentType, links: $links, groupTitle: $groupTitle, imdbId: $imdbId, tvgId: $tvgId, tvgName: $tvgName, desc: $desc, tvgLogo: $tvgLogo, source: $source, duration: $duration, isNsfw: $isNsfw, extXMedias: $extXMedias, isMovie: $isMovie, isLiveTv: $isLiveTv, isTvSerie: $isTvSerie, attributes: $attributes, extVlcOpts: $extVlcOpts, kodiProps: $kodiProps, httpHeaders: $httpHeaders)';
}


}

/// @nodoc
abstract mixin class $TrackCopyWith<$Res>  {
  factory $TrackCopyWith(Track value, $Res Function(Track) _then) = _$TrackCopyWithImpl;
@useResult
$Res call({
 int id, String title, String contentType, List<String> links, String groupTitle, String imdbId, String tvgId, String tvgName, String desc, String tvgLogo, Source? source, int duration, bool isNsfw, List<ExtXMedia> extXMedias, bool isMovie, bool isLiveTv, bool isTvSerie, Map<String, String> attributes, List<Map<String, String>> extVlcOpts, List<Map<String, String>> kodiProps, List<Map<String, String>> httpHeaders
});


$SourceCopyWith<$Res>? get source;

}
/// @nodoc
class _$TrackCopyWithImpl<$Res>
    implements $TrackCopyWith<$Res> {
  _$TrackCopyWithImpl(this._self, this._then);

  final Track _self;
  final $Res Function(Track) _then;

/// Create a copy of Track
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? contentType = null,Object? links = null,Object? groupTitle = null,Object? imdbId = null,Object? tvgId = null,Object? tvgName = null,Object? desc = null,Object? tvgLogo = null,Object? source = freezed,Object? duration = null,Object? isNsfw = null,Object? extXMedias = null,Object? isMovie = null,Object? isLiveTv = null,Object? isTvSerie = null,Object? attributes = null,Object? extVlcOpts = null,Object? kodiProps = null,Object? httpHeaders = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as List<String>,groupTitle: null == groupTitle ? _self.groupTitle : groupTitle // ignore: cast_nullable_to_non_nullable
as String,imdbId: null == imdbId ? _self.imdbId : imdbId // ignore: cast_nullable_to_non_nullable
as String,tvgId: null == tvgId ? _self.tvgId : tvgId // ignore: cast_nullable_to_non_nullable
as String,tvgName: null == tvgName ? _self.tvgName : tvgName // ignore: cast_nullable_to_non_nullable
as String,desc: null == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String,tvgLogo: null == tvgLogo ? _self.tvgLogo : tvgLogo // ignore: cast_nullable_to_non_nullable
as String,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as Source?,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,isNsfw: null == isNsfw ? _self.isNsfw : isNsfw // ignore: cast_nullable_to_non_nullable
as bool,extXMedias: null == extXMedias ? _self.extXMedias : extXMedias // ignore: cast_nullable_to_non_nullable
as List<ExtXMedia>,isMovie: null == isMovie ? _self.isMovie : isMovie // ignore: cast_nullable_to_non_nullable
as bool,isLiveTv: null == isLiveTv ? _self.isLiveTv : isLiveTv // ignore: cast_nullable_to_non_nullable
as bool,isTvSerie: null == isTvSerie ? _self.isTvSerie : isTvSerie // ignore: cast_nullable_to_non_nullable
as bool,attributes: null == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, String>,extVlcOpts: null == extVlcOpts ? _self.extVlcOpts : extVlcOpts // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,kodiProps: null == kodiProps ? _self.kodiProps : kodiProps // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,httpHeaders: null == httpHeaders ? _self.httpHeaders : httpHeaders // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,
  ));
}
/// Create a copy of Track
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SourceCopyWith<$Res>? get source {
    if (_self.source == null) {
    return null;
  }

  return $SourceCopyWith<$Res>(_self.source!, (value) {
    return _then(_self.copyWith(source: value));
  });
}
}


/// Adds pattern-matching-related methods to [Track].
extension TrackPatterns on Track {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Track value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Track() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Track value)  $default,){
final _that = this;
switch (_that) {
case _Track():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Track value)?  $default,){
final _that = this;
switch (_that) {
case _Track() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String contentType,  List<String> links,  String groupTitle,  String imdbId,  String tvgId,  String tvgName,  String desc,  String tvgLogo,  Source? source,  int duration,  bool isNsfw,  List<ExtXMedia> extXMedias,  bool isMovie,  bool isLiveTv,  bool isTvSerie,  Map<String, String> attributes,  List<Map<String, String>> extVlcOpts,  List<Map<String, String>> kodiProps,  List<Map<String, String>> httpHeaders)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Track() when $default != null:
return $default(_that.id,_that.title,_that.contentType,_that.links,_that.groupTitle,_that.imdbId,_that.tvgId,_that.tvgName,_that.desc,_that.tvgLogo,_that.source,_that.duration,_that.isNsfw,_that.extXMedias,_that.isMovie,_that.isLiveTv,_that.isTvSerie,_that.attributes,_that.extVlcOpts,_that.kodiProps,_that.httpHeaders);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String contentType,  List<String> links,  String groupTitle,  String imdbId,  String tvgId,  String tvgName,  String desc,  String tvgLogo,  Source? source,  int duration,  bool isNsfw,  List<ExtXMedia> extXMedias,  bool isMovie,  bool isLiveTv,  bool isTvSerie,  Map<String, String> attributes,  List<Map<String, String>> extVlcOpts,  List<Map<String, String>> kodiProps,  List<Map<String, String>> httpHeaders)  $default,) {final _that = this;
switch (_that) {
case _Track():
return $default(_that.id,_that.title,_that.contentType,_that.links,_that.groupTitle,_that.imdbId,_that.tvgId,_that.tvgName,_that.desc,_that.tvgLogo,_that.source,_that.duration,_that.isNsfw,_that.extXMedias,_that.isMovie,_that.isLiveTv,_that.isTvSerie,_that.attributes,_that.extVlcOpts,_that.kodiProps,_that.httpHeaders);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String contentType,  List<String> links,  String groupTitle,  String imdbId,  String tvgId,  String tvgName,  String desc,  String tvgLogo,  Source? source,  int duration,  bool isNsfw,  List<ExtXMedia> extXMedias,  bool isMovie,  bool isLiveTv,  bool isTvSerie,  Map<String, String> attributes,  List<Map<String, String>> extVlcOpts,  List<Map<String, String>> kodiProps,  List<Map<String, String>> httpHeaders)?  $default,) {final _that = this;
switch (_that) {
case _Track() when $default != null:
return $default(_that.id,_that.title,_that.contentType,_that.links,_that.groupTitle,_that.imdbId,_that.tvgId,_that.tvgName,_that.desc,_that.tvgLogo,_that.source,_that.duration,_that.isNsfw,_that.extXMedias,_that.isMovie,_that.isLiveTv,_that.isTvSerie,_that.attributes,_that.extVlcOpts,_that.kodiProps,_that.httpHeaders);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Track implements Track {
  const _Track({this.id = 0, this.title = "", this.contentType = "unknown", final  List<String> links = const [], this.groupTitle = "", this.imdbId = "", this.tvgId = "", this.tvgName = "", this.desc = "", this.tvgLogo = "", this.source = null, this.duration = 0, this.isNsfw = false, final  List<ExtXMedia> extXMedias = const [], this.isMovie = false, this.isLiveTv = false, this.isTvSerie = false, final  Map<String, String> attributes = const {}, final  List<Map<String, String>> extVlcOpts = const [], final  List<Map<String, String>> kodiProps = const [], final  List<Map<String, String>> httpHeaders = const []}): _links = links,_extXMedias = extXMedias,_attributes = attributes,_extVlcOpts = extVlcOpts,_kodiProps = kodiProps,_httpHeaders = httpHeaders;
  factory _Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  String title;
@override@JsonKey() final  String contentType;
 final  List<String> _links;
@override@JsonKey() List<String> get links {
  if (_links is EqualUnmodifiableListView) return _links;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_links);
}

@override@JsonKey() final  String groupTitle;
@override@JsonKey() final  String imdbId;
@override@JsonKey() final  String tvgId;
@override@JsonKey() final  String tvgName;
@override@JsonKey() final  String desc;
@override@JsonKey() final  String tvgLogo;
@override@JsonKey() final  Source? source;
@override@JsonKey() final  int duration;
@override@JsonKey() final  bool isNsfw;
 final  List<ExtXMedia> _extXMedias;
@override@JsonKey() List<ExtXMedia> get extXMedias {
  if (_extXMedias is EqualUnmodifiableListView) return _extXMedias;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_extXMedias);
}

@override@JsonKey() final  bool isMovie;
@override@JsonKey() final  bool isLiveTv;
@override@JsonKey() final  bool isTvSerie;
 final  Map<String, String> _attributes;
@override@JsonKey() Map<String, String> get attributes {
  if (_attributes is EqualUnmodifiableMapView) return _attributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_attributes);
}

 final  List<Map<String, String>> _extVlcOpts;
@override@JsonKey() List<Map<String, String>> get extVlcOpts {
  if (_extVlcOpts is EqualUnmodifiableListView) return _extVlcOpts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_extVlcOpts);
}

 final  List<Map<String, String>> _kodiProps;
@override@JsonKey() List<Map<String, String>> get kodiProps {
  if (_kodiProps is EqualUnmodifiableListView) return _kodiProps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_kodiProps);
}

 final  List<Map<String, String>> _httpHeaders;
@override@JsonKey() List<Map<String, String>> get httpHeaders {
  if (_httpHeaders is EqualUnmodifiableListView) return _httpHeaders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_httpHeaders);
}


/// Create a copy of Track
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackCopyWith<_Track> get copyWith => __$TrackCopyWithImpl<_Track>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrackToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Track&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&const DeepCollectionEquality().equals(other._links, _links)&&(identical(other.groupTitle, groupTitle) || other.groupTitle == groupTitle)&&(identical(other.imdbId, imdbId) || other.imdbId == imdbId)&&(identical(other.tvgId, tvgId) || other.tvgId == tvgId)&&(identical(other.tvgName, tvgName) || other.tvgName == tvgName)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.tvgLogo, tvgLogo) || other.tvgLogo == tvgLogo)&&(identical(other.source, source) || other.source == source)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.isNsfw, isNsfw) || other.isNsfw == isNsfw)&&const DeepCollectionEquality().equals(other._extXMedias, _extXMedias)&&(identical(other.isMovie, isMovie) || other.isMovie == isMovie)&&(identical(other.isLiveTv, isLiveTv) || other.isLiveTv == isLiveTv)&&(identical(other.isTvSerie, isTvSerie) || other.isTvSerie == isTvSerie)&&const DeepCollectionEquality().equals(other._attributes, _attributes)&&const DeepCollectionEquality().equals(other._extVlcOpts, _extVlcOpts)&&const DeepCollectionEquality().equals(other._kodiProps, _kodiProps)&&const DeepCollectionEquality().equals(other._httpHeaders, _httpHeaders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,contentType,const DeepCollectionEquality().hash(_links),groupTitle,imdbId,tvgId,tvgName,desc,tvgLogo,source,duration,isNsfw,const DeepCollectionEquality().hash(_extXMedias),isMovie,isLiveTv,isTvSerie,const DeepCollectionEquality().hash(_attributes),const DeepCollectionEquality().hash(_extVlcOpts),const DeepCollectionEquality().hash(_kodiProps),const DeepCollectionEquality().hash(_httpHeaders)]);

@override
String toString() {
  return 'Track(id: $id, title: $title, contentType: $contentType, links: $links, groupTitle: $groupTitle, imdbId: $imdbId, tvgId: $tvgId, tvgName: $tvgName, desc: $desc, tvgLogo: $tvgLogo, source: $source, duration: $duration, isNsfw: $isNsfw, extXMedias: $extXMedias, isMovie: $isMovie, isLiveTv: $isLiveTv, isTvSerie: $isTvSerie, attributes: $attributes, extVlcOpts: $extVlcOpts, kodiProps: $kodiProps, httpHeaders: $httpHeaders)';
}


}

/// @nodoc
abstract mixin class _$TrackCopyWith<$Res> implements $TrackCopyWith<$Res> {
  factory _$TrackCopyWith(_Track value, $Res Function(_Track) _then) = __$TrackCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String contentType, List<String> links, String groupTitle, String imdbId, String tvgId, String tvgName, String desc, String tvgLogo, Source? source, int duration, bool isNsfw, List<ExtXMedia> extXMedias, bool isMovie, bool isLiveTv, bool isTvSerie, Map<String, String> attributes, List<Map<String, String>> extVlcOpts, List<Map<String, String>> kodiProps, List<Map<String, String>> httpHeaders
});


@override $SourceCopyWith<$Res>? get source;

}
/// @nodoc
class __$TrackCopyWithImpl<$Res>
    implements _$TrackCopyWith<$Res> {
  __$TrackCopyWithImpl(this._self, this._then);

  final _Track _self;
  final $Res Function(_Track) _then;

/// Create a copy of Track
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? contentType = null,Object? links = null,Object? groupTitle = null,Object? imdbId = null,Object? tvgId = null,Object? tvgName = null,Object? desc = null,Object? tvgLogo = null,Object? source = freezed,Object? duration = null,Object? isNsfw = null,Object? extXMedias = null,Object? isMovie = null,Object? isLiveTv = null,Object? isTvSerie = null,Object? attributes = null,Object? extVlcOpts = null,Object? kodiProps = null,Object? httpHeaders = null,}) {
  return _then(_Track(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String,links: null == links ? _self._links : links // ignore: cast_nullable_to_non_nullable
as List<String>,groupTitle: null == groupTitle ? _self.groupTitle : groupTitle // ignore: cast_nullable_to_non_nullable
as String,imdbId: null == imdbId ? _self.imdbId : imdbId // ignore: cast_nullable_to_non_nullable
as String,tvgId: null == tvgId ? _self.tvgId : tvgId // ignore: cast_nullable_to_non_nullable
as String,tvgName: null == tvgName ? _self.tvgName : tvgName // ignore: cast_nullable_to_non_nullable
as String,desc: null == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String,tvgLogo: null == tvgLogo ? _self.tvgLogo : tvgLogo // ignore: cast_nullable_to_non_nullable
as String,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as Source?,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,isNsfw: null == isNsfw ? _self.isNsfw : isNsfw // ignore: cast_nullable_to_non_nullable
as bool,extXMedias: null == extXMedias ? _self._extXMedias : extXMedias // ignore: cast_nullable_to_non_nullable
as List<ExtXMedia>,isMovie: null == isMovie ? _self.isMovie : isMovie // ignore: cast_nullable_to_non_nullable
as bool,isLiveTv: null == isLiveTv ? _self.isLiveTv : isLiveTv // ignore: cast_nullable_to_non_nullable
as bool,isTvSerie: null == isTvSerie ? _self.isTvSerie : isTvSerie // ignore: cast_nullable_to_non_nullable
as bool,attributes: null == attributes ? _self._attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, String>,extVlcOpts: null == extVlcOpts ? _self._extVlcOpts : extVlcOpts // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,kodiProps: null == kodiProps ? _self._kodiProps : kodiProps // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,httpHeaders: null == httpHeaders ? _self._httpHeaders : httpHeaders // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,
  ));
}

/// Create a copy of Track
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SourceCopyWith<$Res>? get source {
    if (_self.source == null) {
    return null;
  }

  return $SourceCopyWith<$Res>(_self.source!, (value) {
    return _then(_self.copyWith(source: value));
  });
}
}

// dart format on
