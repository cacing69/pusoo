// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm3u_track.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$M3UTrack {

 String get title; List<String> get links; String get category; Map<String, String> get attributes; List<Map<String, String>> get extVlcOpt; List<Map<String, String>> get kodiProp; List<Map<String, String>> get httpHeaders;
/// Create a copy of M3UTrack
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$M3UTrackCopyWith<M3UTrack> get copyWith => _$M3UTrackCopyWithImpl<M3UTrack>(this as M3UTrack, _$identity);

  /// Serializes this M3UTrack to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is M3UTrack&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.links, links)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other.attributes, attributes)&&const DeepCollectionEquality().equals(other.extVlcOpt, extVlcOpt)&&const DeepCollectionEquality().equals(other.kodiProp, kodiProp)&&const DeepCollectionEquality().equals(other.httpHeaders, httpHeaders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(links),category,const DeepCollectionEquality().hash(attributes),const DeepCollectionEquality().hash(extVlcOpt),const DeepCollectionEquality().hash(kodiProp),const DeepCollectionEquality().hash(httpHeaders));

@override
String toString() {
  return 'M3UTrack(title: $title, links: $links, category: $category, attributes: $attributes, extVlcOpt: $extVlcOpt, kodiProp: $kodiProp, httpHeaders: $httpHeaders)';
}


}

/// @nodoc
abstract mixin class $M3UTrackCopyWith<$Res>  {
  factory $M3UTrackCopyWith(M3UTrack value, $Res Function(M3UTrack) _then) = _$M3UTrackCopyWithImpl;
@useResult
$Res call({
 String title, List<String> links, String category, Map<String, String> attributes, List<Map<String, String>> extVlcOpt, List<Map<String, String>> kodiProp, List<Map<String, String>> httpHeaders
});




}
/// @nodoc
class _$M3UTrackCopyWithImpl<$Res>
    implements $M3UTrackCopyWith<$Res> {
  _$M3UTrackCopyWithImpl(this._self, this._then);

  final M3UTrack _self;
  final $Res Function(M3UTrack) _then;

/// Create a copy of M3UTrack
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? links = null,Object? category = null,Object? attributes = null,Object? extVlcOpt = null,Object? kodiProp = null,Object? httpHeaders = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as List<String>,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,attributes: null == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, String>,extVlcOpt: null == extVlcOpt ? _self.extVlcOpt : extVlcOpt // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,kodiProp: null == kodiProp ? _self.kodiProp : kodiProp // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,httpHeaders: null == httpHeaders ? _self.httpHeaders : httpHeaders // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,
  ));
}

}


/// Adds pattern-matching-related methods to [M3UTrack].
extension M3UTrackPatterns on M3UTrack {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _M3UTrack value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _M3UTrack() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _M3UTrack value)  $default,){
final _that = this;
switch (_that) {
case _M3UTrack():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _M3UTrack value)?  $default,){
final _that = this;
switch (_that) {
case _M3UTrack() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  List<String> links,  String category,  Map<String, String> attributes,  List<Map<String, String>> extVlcOpt,  List<Map<String, String>> kodiProp,  List<Map<String, String>> httpHeaders)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _M3UTrack() when $default != null:
return $default(_that.title,_that.links,_that.category,_that.attributes,_that.extVlcOpt,_that.kodiProp,_that.httpHeaders);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  List<String> links,  String category,  Map<String, String> attributes,  List<Map<String, String>> extVlcOpt,  List<Map<String, String>> kodiProp,  List<Map<String, String>> httpHeaders)  $default,) {final _that = this;
switch (_that) {
case _M3UTrack():
return $default(_that.title,_that.links,_that.category,_that.attributes,_that.extVlcOpt,_that.kodiProp,_that.httpHeaders);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  List<String> links,  String category,  Map<String, String> attributes,  List<Map<String, String>> extVlcOpt,  List<Map<String, String>> kodiProp,  List<Map<String, String>> httpHeaders)?  $default,) {final _that = this;
switch (_that) {
case _M3UTrack() when $default != null:
return $default(_that.title,_that.links,_that.category,_that.attributes,_that.extVlcOpt,_that.kodiProp,_that.httpHeaders);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _M3UTrack implements M3UTrack {
  const _M3UTrack({this.title = "", final  List<String> links = const [], this.category = "", final  Map<String, String> attributes = const {}, final  List<Map<String, String>> extVlcOpt = const [], final  List<Map<String, String>> kodiProp = const [], final  List<Map<String, String>> httpHeaders = const []}): _links = links,_attributes = attributes,_extVlcOpt = extVlcOpt,_kodiProp = kodiProp,_httpHeaders = httpHeaders;
  factory _M3UTrack.fromJson(Map<String, dynamic> json) => _$M3UTrackFromJson(json);

@override@JsonKey() final  String title;
 final  List<String> _links;
@override@JsonKey() List<String> get links {
  if (_links is EqualUnmodifiableListView) return _links;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_links);
}

@override@JsonKey() final  String category;
 final  Map<String, String> _attributes;
@override@JsonKey() Map<String, String> get attributes {
  if (_attributes is EqualUnmodifiableMapView) return _attributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_attributes);
}

 final  List<Map<String, String>> _extVlcOpt;
@override@JsonKey() List<Map<String, String>> get extVlcOpt {
  if (_extVlcOpt is EqualUnmodifiableListView) return _extVlcOpt;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_extVlcOpt);
}

 final  List<Map<String, String>> _kodiProp;
@override@JsonKey() List<Map<String, String>> get kodiProp {
  if (_kodiProp is EqualUnmodifiableListView) return _kodiProp;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_kodiProp);
}

 final  List<Map<String, String>> _httpHeaders;
@override@JsonKey() List<Map<String, String>> get httpHeaders {
  if (_httpHeaders is EqualUnmodifiableListView) return _httpHeaders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_httpHeaders);
}


/// Create a copy of M3UTrack
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$M3UTrackCopyWith<_M3UTrack> get copyWith => __$M3UTrackCopyWithImpl<_M3UTrack>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$M3UTrackToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _M3UTrack&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._links, _links)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._attributes, _attributes)&&const DeepCollectionEquality().equals(other._extVlcOpt, _extVlcOpt)&&const DeepCollectionEquality().equals(other._kodiProp, _kodiProp)&&const DeepCollectionEquality().equals(other._httpHeaders, _httpHeaders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(_links),category,const DeepCollectionEquality().hash(_attributes),const DeepCollectionEquality().hash(_extVlcOpt),const DeepCollectionEquality().hash(_kodiProp),const DeepCollectionEquality().hash(_httpHeaders));

@override
String toString() {
  return 'M3UTrack(title: $title, links: $links, category: $category, attributes: $attributes, extVlcOpt: $extVlcOpt, kodiProp: $kodiProp, httpHeaders: $httpHeaders)';
}


}

/// @nodoc
abstract mixin class _$M3UTrackCopyWith<$Res> implements $M3UTrackCopyWith<$Res> {
  factory _$M3UTrackCopyWith(_M3UTrack value, $Res Function(_M3UTrack) _then) = __$M3UTrackCopyWithImpl;
@override @useResult
$Res call({
 String title, List<String> links, String category, Map<String, String> attributes, List<Map<String, String>> extVlcOpt, List<Map<String, String>> kodiProp, List<Map<String, String>> httpHeaders
});




}
/// @nodoc
class __$M3UTrackCopyWithImpl<$Res>
    implements _$M3UTrackCopyWith<$Res> {
  __$M3UTrackCopyWithImpl(this._self, this._then);

  final _M3UTrack _self;
  final $Res Function(_M3UTrack) _then;

/// Create a copy of M3UTrack
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? links = null,Object? category = null,Object? attributes = null,Object? extVlcOpt = null,Object? kodiProp = null,Object? httpHeaders = null,}) {
  return _then(_M3UTrack(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,links: null == links ? _self._links : links // ignore: cast_nullable_to_non_nullable
as List<String>,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,attributes: null == attributes ? _self._attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, String>,extVlcOpt: null == extVlcOpt ? _self._extVlcOpt : extVlcOpt // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,kodiProp: null == kodiProp ? _self._kodiProp : kodiProp // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,httpHeaders: null == httpHeaders ? _self._httpHeaders : httpHeaders // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,
  ));
}


}

// dart format on
