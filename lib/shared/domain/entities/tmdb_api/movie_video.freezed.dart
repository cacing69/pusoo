// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieVideo {

@JsonKey(name: "iso_639_1") String? get iso6391;@JsonKey(name: "iso_3166_1") String? get iso31661; String? get name; String? get key; String? get site; int? get size; String? get type; bool? get oficial;@JsonKey(name: "published_at") String? get publishedAt;
/// Create a copy of MovieVideo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieVideoCopyWith<MovieVideo> get copyWith => _$MovieVideoCopyWithImpl<MovieVideo>(this as MovieVideo, _$identity);

  /// Serializes this MovieVideo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieVideo&&(identical(other.iso6391, iso6391) || other.iso6391 == iso6391)&&(identical(other.iso31661, iso31661) || other.iso31661 == iso31661)&&(identical(other.name, name) || other.name == name)&&(identical(other.key, key) || other.key == key)&&(identical(other.site, site) || other.site == site)&&(identical(other.size, size) || other.size == size)&&(identical(other.type, type) || other.type == type)&&(identical(other.oficial, oficial) || other.oficial == oficial)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,iso6391,iso31661,name,key,site,size,type,oficial,publishedAt);

@override
String toString() {
  return 'MovieVideo(iso6391: $iso6391, iso31661: $iso31661, name: $name, key: $key, site: $site, size: $size, type: $type, oficial: $oficial, publishedAt: $publishedAt)';
}


}

/// @nodoc
abstract mixin class $MovieVideoCopyWith<$Res>  {
  factory $MovieVideoCopyWith(MovieVideo value, $Res Function(MovieVideo) _then) = _$MovieVideoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "iso_639_1") String? iso6391,@JsonKey(name: "iso_3166_1") String? iso31661, String? name, String? key, String? site, int? size, String? type, bool? oficial,@JsonKey(name: "published_at") String? publishedAt
});




}
/// @nodoc
class _$MovieVideoCopyWithImpl<$Res>
    implements $MovieVideoCopyWith<$Res> {
  _$MovieVideoCopyWithImpl(this._self, this._then);

  final MovieVideo _self;
  final $Res Function(MovieVideo) _then;

/// Create a copy of MovieVideo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? iso6391 = freezed,Object? iso31661 = freezed,Object? name = freezed,Object? key = freezed,Object? site = freezed,Object? size = freezed,Object? type = freezed,Object? oficial = freezed,Object? publishedAt = freezed,}) {
  return _then(_self.copyWith(
iso6391: freezed == iso6391 ? _self.iso6391 : iso6391 // ignore: cast_nullable_to_non_nullable
as String?,iso31661: freezed == iso31661 ? _self.iso31661 : iso31661 // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,site: freezed == site ? _self.site : site // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,oficial: freezed == oficial ? _self.oficial : oficial // ignore: cast_nullable_to_non_nullable
as bool?,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieVideo].
extension MovieVideoPatterns on MovieVideo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieVideo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieVideo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieVideo value)  $default,){
final _that = this;
switch (_that) {
case _MovieVideo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieVideo value)?  $default,){
final _that = this;
switch (_that) {
case _MovieVideo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "iso_639_1")  String? iso6391, @JsonKey(name: "iso_3166_1")  String? iso31661,  String? name,  String? key,  String? site,  int? size,  String? type,  bool? oficial, @JsonKey(name: "published_at")  String? publishedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieVideo() when $default != null:
return $default(_that.iso6391,_that.iso31661,_that.name,_that.key,_that.site,_that.size,_that.type,_that.oficial,_that.publishedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "iso_639_1")  String? iso6391, @JsonKey(name: "iso_3166_1")  String? iso31661,  String? name,  String? key,  String? site,  int? size,  String? type,  bool? oficial, @JsonKey(name: "published_at")  String? publishedAt)  $default,) {final _that = this;
switch (_that) {
case _MovieVideo():
return $default(_that.iso6391,_that.iso31661,_that.name,_that.key,_that.site,_that.size,_that.type,_that.oficial,_that.publishedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "iso_639_1")  String? iso6391, @JsonKey(name: "iso_3166_1")  String? iso31661,  String? name,  String? key,  String? site,  int? size,  String? type,  bool? oficial, @JsonKey(name: "published_at")  String? publishedAt)?  $default,) {final _that = this;
switch (_that) {
case _MovieVideo() when $default != null:
return $default(_that.iso6391,_that.iso31661,_that.name,_that.key,_that.site,_that.size,_that.type,_that.oficial,_that.publishedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MovieVideo implements MovieVideo {
  const _MovieVideo({@JsonKey(name: "iso_639_1") this.iso6391, @JsonKey(name: "iso_3166_1") this.iso31661, this.name = null, this.key = null, this.site = null, this.size = null, this.type = null, this.oficial = false, @JsonKey(name: "published_at") this.publishedAt});
  factory _MovieVideo.fromJson(Map<String, dynamic> json) => _$MovieVideoFromJson(json);

@override@JsonKey(name: "iso_639_1") final  String? iso6391;
@override@JsonKey(name: "iso_3166_1") final  String? iso31661;
@override@JsonKey() final  String? name;
@override@JsonKey() final  String? key;
@override@JsonKey() final  String? site;
@override@JsonKey() final  int? size;
@override@JsonKey() final  String? type;
@override@JsonKey() final  bool? oficial;
@override@JsonKey(name: "published_at") final  String? publishedAt;

/// Create a copy of MovieVideo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieVideoCopyWith<_MovieVideo> get copyWith => __$MovieVideoCopyWithImpl<_MovieVideo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieVideoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieVideo&&(identical(other.iso6391, iso6391) || other.iso6391 == iso6391)&&(identical(other.iso31661, iso31661) || other.iso31661 == iso31661)&&(identical(other.name, name) || other.name == name)&&(identical(other.key, key) || other.key == key)&&(identical(other.site, site) || other.site == site)&&(identical(other.size, size) || other.size == size)&&(identical(other.type, type) || other.type == type)&&(identical(other.oficial, oficial) || other.oficial == oficial)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,iso6391,iso31661,name,key,site,size,type,oficial,publishedAt);

@override
String toString() {
  return 'MovieVideo(iso6391: $iso6391, iso31661: $iso31661, name: $name, key: $key, site: $site, size: $size, type: $type, oficial: $oficial, publishedAt: $publishedAt)';
}


}

/// @nodoc
abstract mixin class _$MovieVideoCopyWith<$Res> implements $MovieVideoCopyWith<$Res> {
  factory _$MovieVideoCopyWith(_MovieVideo value, $Res Function(_MovieVideo) _then) = __$MovieVideoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "iso_639_1") String? iso6391,@JsonKey(name: "iso_3166_1") String? iso31661, String? name, String? key, String? site, int? size, String? type, bool? oficial,@JsonKey(name: "published_at") String? publishedAt
});




}
/// @nodoc
class __$MovieVideoCopyWithImpl<$Res>
    implements _$MovieVideoCopyWith<$Res> {
  __$MovieVideoCopyWithImpl(this._self, this._then);

  final _MovieVideo _self;
  final $Res Function(_MovieVideo) _then;

/// Create a copy of MovieVideo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? iso6391 = freezed,Object? iso31661 = freezed,Object? name = freezed,Object? key = freezed,Object? site = freezed,Object? size = freezed,Object? type = freezed,Object? oficial = freezed,Object? publishedAt = freezed,}) {
  return _then(_MovieVideo(
iso6391: freezed == iso6391 ? _self.iso6391 : iso6391 // ignore: cast_nullable_to_non_nullable
as String?,iso31661: freezed == iso31661 ? _self.iso31661 : iso31661 // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,site: freezed == site ? _self.site : site // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,oficial: freezed == oficial ? _self.oficial : oficial // ignore: cast_nullable_to_non_nullable
as bool?,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
