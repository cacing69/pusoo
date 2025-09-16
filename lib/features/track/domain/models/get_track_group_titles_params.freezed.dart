// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_track_group_titles_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetTrackGroupTitlesParams {

 List<int>? get playlistIds; bool? get isMovie; bool? get isLiveTv; bool? get isTvSerie;
/// Create a copy of GetTrackGroupTitlesParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetTrackGroupTitlesParamsCopyWith<GetTrackGroupTitlesParams> get copyWith => _$GetTrackGroupTitlesParamsCopyWithImpl<GetTrackGroupTitlesParams>(this as GetTrackGroupTitlesParams, _$identity);

  /// Serializes this GetTrackGroupTitlesParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetTrackGroupTitlesParams&&const DeepCollectionEquality().equals(other.playlistIds, playlistIds)&&(identical(other.isMovie, isMovie) || other.isMovie == isMovie)&&(identical(other.isLiveTv, isLiveTv) || other.isLiveTv == isLiveTv)&&(identical(other.isTvSerie, isTvSerie) || other.isTvSerie == isTvSerie));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(playlistIds),isMovie,isLiveTv,isTvSerie);

@override
String toString() {
  return 'GetTrackGroupTitlesParams(playlistIds: $playlistIds, isMovie: $isMovie, isLiveTv: $isLiveTv, isTvSerie: $isTvSerie)';
}


}

/// @nodoc
abstract mixin class $GetTrackGroupTitlesParamsCopyWith<$Res>  {
  factory $GetTrackGroupTitlesParamsCopyWith(GetTrackGroupTitlesParams value, $Res Function(GetTrackGroupTitlesParams) _then) = _$GetTrackGroupTitlesParamsCopyWithImpl;
@useResult
$Res call({
 List<int>? playlistIds, bool? isMovie, bool? isLiveTv, bool? isTvSerie
});




}
/// @nodoc
class _$GetTrackGroupTitlesParamsCopyWithImpl<$Res>
    implements $GetTrackGroupTitlesParamsCopyWith<$Res> {
  _$GetTrackGroupTitlesParamsCopyWithImpl(this._self, this._then);

  final GetTrackGroupTitlesParams _self;
  final $Res Function(GetTrackGroupTitlesParams) _then;

/// Create a copy of GetTrackGroupTitlesParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? playlistIds = freezed,Object? isMovie = freezed,Object? isLiveTv = freezed,Object? isTvSerie = freezed,}) {
  return _then(_self.copyWith(
playlistIds: freezed == playlistIds ? _self.playlistIds : playlistIds // ignore: cast_nullable_to_non_nullable
as List<int>?,isMovie: freezed == isMovie ? _self.isMovie : isMovie // ignore: cast_nullable_to_non_nullable
as bool?,isLiveTv: freezed == isLiveTv ? _self.isLiveTv : isLiveTv // ignore: cast_nullable_to_non_nullable
as bool?,isTvSerie: freezed == isTvSerie ? _self.isTvSerie : isTvSerie // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [GetTrackGroupTitlesParams].
extension GetTrackGroupTitlesParamsPatterns on GetTrackGroupTitlesParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetTrackGroupTitlesParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetTrackGroupTitlesParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetTrackGroupTitlesParams value)  $default,){
final _that = this;
switch (_that) {
case _GetTrackGroupTitlesParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetTrackGroupTitlesParams value)?  $default,){
final _that = this;
switch (_that) {
case _GetTrackGroupTitlesParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<int>? playlistIds,  bool? isMovie,  bool? isLiveTv,  bool? isTvSerie)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetTrackGroupTitlesParams() when $default != null:
return $default(_that.playlistIds,_that.isMovie,_that.isLiveTv,_that.isTvSerie);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<int>? playlistIds,  bool? isMovie,  bool? isLiveTv,  bool? isTvSerie)  $default,) {final _that = this;
switch (_that) {
case _GetTrackGroupTitlesParams():
return $default(_that.playlistIds,_that.isMovie,_that.isLiveTv,_that.isTvSerie);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<int>? playlistIds,  bool? isMovie,  bool? isLiveTv,  bool? isTvSerie)?  $default,) {final _that = this;
switch (_that) {
case _GetTrackGroupTitlesParams() when $default != null:
return $default(_that.playlistIds,_that.isMovie,_that.isLiveTv,_that.isTvSerie);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetTrackGroupTitlesParams implements GetTrackGroupTitlesParams {
  const _GetTrackGroupTitlesParams({final  List<int>? playlistIds, this.isMovie, this.isLiveTv, this.isTvSerie}): _playlistIds = playlistIds;
  factory _GetTrackGroupTitlesParams.fromJson(Map<String, dynamic> json) => _$GetTrackGroupTitlesParamsFromJson(json);

 final  List<int>? _playlistIds;
@override List<int>? get playlistIds {
  final value = _playlistIds;
  if (value == null) return null;
  if (_playlistIds is EqualUnmodifiableListView) return _playlistIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  bool? isMovie;
@override final  bool? isLiveTv;
@override final  bool? isTvSerie;

/// Create a copy of GetTrackGroupTitlesParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetTrackGroupTitlesParamsCopyWith<_GetTrackGroupTitlesParams> get copyWith => __$GetTrackGroupTitlesParamsCopyWithImpl<_GetTrackGroupTitlesParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetTrackGroupTitlesParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetTrackGroupTitlesParams&&const DeepCollectionEquality().equals(other._playlistIds, _playlistIds)&&(identical(other.isMovie, isMovie) || other.isMovie == isMovie)&&(identical(other.isLiveTv, isLiveTv) || other.isLiveTv == isLiveTv)&&(identical(other.isTvSerie, isTvSerie) || other.isTvSerie == isTvSerie));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_playlistIds),isMovie,isLiveTv,isTvSerie);

@override
String toString() {
  return 'GetTrackGroupTitlesParams(playlistIds: $playlistIds, isMovie: $isMovie, isLiveTv: $isLiveTv, isTvSerie: $isTvSerie)';
}


}

/// @nodoc
abstract mixin class _$GetTrackGroupTitlesParamsCopyWith<$Res> implements $GetTrackGroupTitlesParamsCopyWith<$Res> {
  factory _$GetTrackGroupTitlesParamsCopyWith(_GetTrackGroupTitlesParams value, $Res Function(_GetTrackGroupTitlesParams) _then) = __$GetTrackGroupTitlesParamsCopyWithImpl;
@override @useResult
$Res call({
 List<int>? playlistIds, bool? isMovie, bool? isLiveTv, bool? isTvSerie
});




}
/// @nodoc
class __$GetTrackGroupTitlesParamsCopyWithImpl<$Res>
    implements _$GetTrackGroupTitlesParamsCopyWith<$Res> {
  __$GetTrackGroupTitlesParamsCopyWithImpl(this._self, this._then);

  final _GetTrackGroupTitlesParams _self;
  final $Res Function(_GetTrackGroupTitlesParams) _then;

/// Create a copy of GetTrackGroupTitlesParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? playlistIds = freezed,Object? isMovie = freezed,Object? isLiveTv = freezed,Object? isTvSerie = freezed,}) {
  return _then(_GetTrackGroupTitlesParams(
playlistIds: freezed == playlistIds ? _self._playlistIds : playlistIds // ignore: cast_nullable_to_non_nullable
as List<int>?,isMovie: freezed == isMovie ? _self.isMovie : isMovie // ignore: cast_nullable_to_non_nullable
as bool?,isLiveTv: freezed == isLiveTv ? _self.isLiveTv : isLiveTv // ignore: cast_nullable_to_non_nullable
as bool?,isTvSerie: freezed == isTvSerie ? _self.isTvSerie : isTvSerie // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
