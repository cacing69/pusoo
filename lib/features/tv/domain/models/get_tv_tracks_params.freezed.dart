// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_tv_tracks_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetTvTracksParams {

 List<int>? get playlistIds; String? get category; String? get title; int? get limit; int? get offset; int? get cursor;
/// Create a copy of GetTvTracksParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetTvTracksParamsCopyWith<GetTvTracksParams> get copyWith => _$GetTvTracksParamsCopyWithImpl<GetTvTracksParams>(this as GetTvTracksParams, _$identity);

  /// Serializes this GetTvTracksParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetTvTracksParams&&const DeepCollectionEquality().equals(other.playlistIds, playlistIds)&&(identical(other.category, category) || other.category == category)&&(identical(other.title, title) || other.title == title)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.cursor, cursor) || other.cursor == cursor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(playlistIds),category,title,limit,offset,cursor);

@override
String toString() {
  return 'GetTvTracksParams(playlistIds: $playlistIds, category: $category, title: $title, limit: $limit, offset: $offset, cursor: $cursor)';
}


}

/// @nodoc
abstract mixin class $GetTvTracksParamsCopyWith<$Res>  {
  factory $GetTvTracksParamsCopyWith(GetTvTracksParams value, $Res Function(GetTvTracksParams) _then) = _$GetTvTracksParamsCopyWithImpl;
@useResult
$Res call({
 List<int>? playlistIds, String? category, String? title, int? limit, int? offset, int? cursor
});




}
/// @nodoc
class _$GetTvTracksParamsCopyWithImpl<$Res>
    implements $GetTvTracksParamsCopyWith<$Res> {
  _$GetTvTracksParamsCopyWithImpl(this._self, this._then);

  final GetTvTracksParams _self;
  final $Res Function(GetTvTracksParams) _then;

/// Create a copy of GetTvTracksParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? playlistIds = freezed,Object? category = freezed,Object? title = freezed,Object? limit = freezed,Object? offset = freezed,Object? cursor = freezed,}) {
  return _then(_self.copyWith(
playlistIds: freezed == playlistIds ? _self.playlistIds : playlistIds // ignore: cast_nullable_to_non_nullable
as List<int>?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,offset: freezed == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int?,cursor: freezed == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [GetTvTracksParams].
extension GetTvTracksParamsPatterns on GetTvTracksParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetTvTracksParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetTvTracksParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetTvTracksParams value)  $default,){
final _that = this;
switch (_that) {
case _GetTvTracksParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetTvTracksParams value)?  $default,){
final _that = this;
switch (_that) {
case _GetTvTracksParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<int>? playlistIds,  String? category,  String? title,  int? limit,  int? offset,  int? cursor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetTvTracksParams() when $default != null:
return $default(_that.playlistIds,_that.category,_that.title,_that.limit,_that.offset,_that.cursor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<int>? playlistIds,  String? category,  String? title,  int? limit,  int? offset,  int? cursor)  $default,) {final _that = this;
switch (_that) {
case _GetTvTracksParams():
return $default(_that.playlistIds,_that.category,_that.title,_that.limit,_that.offset,_that.cursor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<int>? playlistIds,  String? category,  String? title,  int? limit,  int? offset,  int? cursor)?  $default,) {final _that = this;
switch (_that) {
case _GetTvTracksParams() when $default != null:
return $default(_that.playlistIds,_that.category,_that.title,_that.limit,_that.offset,_that.cursor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetTvTracksParams implements GetTvTracksParams {
  const _GetTvTracksParams({final  List<int>? playlistIds, this.category, this.title, this.limit, this.offset, this.cursor}): _playlistIds = playlistIds;
  factory _GetTvTracksParams.fromJson(Map<String, dynamic> json) => _$GetTvTracksParamsFromJson(json);

 final  List<int>? _playlistIds;
@override List<int>? get playlistIds {
  final value = _playlistIds;
  if (value == null) return null;
  if (_playlistIds is EqualUnmodifiableListView) return _playlistIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? category;
@override final  String? title;
@override final  int? limit;
@override final  int? offset;
@override final  int? cursor;

/// Create a copy of GetTvTracksParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetTvTracksParamsCopyWith<_GetTvTracksParams> get copyWith => __$GetTvTracksParamsCopyWithImpl<_GetTvTracksParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetTvTracksParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetTvTracksParams&&const DeepCollectionEquality().equals(other._playlistIds, _playlistIds)&&(identical(other.category, category) || other.category == category)&&(identical(other.title, title) || other.title == title)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.cursor, cursor) || other.cursor == cursor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_playlistIds),category,title,limit,offset,cursor);

@override
String toString() {
  return 'GetTvTracksParams(playlistIds: $playlistIds, category: $category, title: $title, limit: $limit, offset: $offset, cursor: $cursor)';
}


}

/// @nodoc
abstract mixin class _$GetTvTracksParamsCopyWith<$Res> implements $GetTvTracksParamsCopyWith<$Res> {
  factory _$GetTvTracksParamsCopyWith(_GetTvTracksParams value, $Res Function(_GetTvTracksParams) _then) = __$GetTvTracksParamsCopyWithImpl;
@override @useResult
$Res call({
 List<int>? playlistIds, String? category, String? title, int? limit, int? offset, int? cursor
});




}
/// @nodoc
class __$GetTvTracksParamsCopyWithImpl<$Res>
    implements _$GetTvTracksParamsCopyWith<$Res> {
  __$GetTvTracksParamsCopyWithImpl(this._self, this._then);

  final _GetTvTracksParams _self;
  final $Res Function(_GetTvTracksParams) _then;

/// Create a copy of GetTvTracksParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? playlistIds = freezed,Object? category = freezed,Object? title = freezed,Object? limit = freezed,Object? offset = freezed,Object? cursor = freezed,}) {
  return _then(_GetTvTracksParams(
playlistIds: freezed == playlistIds ? _self._playlistIds : playlistIds // ignore: cast_nullable_to_non_nullable
as List<int>?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,offset: freezed == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int?,cursor: freezed == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
