// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_detail_query_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieDetailQueryParams {

 String? get language;@JsonKey(name: "append_to_response") String? get appendToResponse;
/// Create a copy of MovieDetailQueryParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieDetailQueryParamsCopyWith<MovieDetailQueryParams> get copyWith => _$MovieDetailQueryParamsCopyWithImpl<MovieDetailQueryParams>(this as MovieDetailQueryParams, _$identity);

  /// Serializes this MovieDetailQueryParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDetailQueryParams&&(identical(other.language, language) || other.language == language)&&(identical(other.appendToResponse, appendToResponse) || other.appendToResponse == appendToResponse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,language,appendToResponse);

@override
String toString() {
  return 'MovieDetailQueryParams(language: $language, appendToResponse: $appendToResponse)';
}


}

/// @nodoc
abstract mixin class $MovieDetailQueryParamsCopyWith<$Res>  {
  factory $MovieDetailQueryParamsCopyWith(MovieDetailQueryParams value, $Res Function(MovieDetailQueryParams) _then) = _$MovieDetailQueryParamsCopyWithImpl;
@useResult
$Res call({
 String? language,@JsonKey(name: "append_to_response") String? appendToResponse
});




}
/// @nodoc
class _$MovieDetailQueryParamsCopyWithImpl<$Res>
    implements $MovieDetailQueryParamsCopyWith<$Res> {
  _$MovieDetailQueryParamsCopyWithImpl(this._self, this._then);

  final MovieDetailQueryParams _self;
  final $Res Function(MovieDetailQueryParams) _then;

/// Create a copy of MovieDetailQueryParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? language = freezed,Object? appendToResponse = freezed,}) {
  return _then(_self.copyWith(
language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,appendToResponse: freezed == appendToResponse ? _self.appendToResponse : appendToResponse // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieDetailQueryParams].
extension MovieDetailQueryParamsPatterns on MovieDetailQueryParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieDetailQueryParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieDetailQueryParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieDetailQueryParams value)  $default,){
final _that = this;
switch (_that) {
case _MovieDetailQueryParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieDetailQueryParams value)?  $default,){
final _that = this;
switch (_that) {
case _MovieDetailQueryParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? language, @JsonKey(name: "append_to_response")  String? appendToResponse)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieDetailQueryParams() when $default != null:
return $default(_that.language,_that.appendToResponse);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? language, @JsonKey(name: "append_to_response")  String? appendToResponse)  $default,) {final _that = this;
switch (_that) {
case _MovieDetailQueryParams():
return $default(_that.language,_that.appendToResponse);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? language, @JsonKey(name: "append_to_response")  String? appendToResponse)?  $default,) {final _that = this;
switch (_that) {
case _MovieDetailQueryParams() when $default != null:
return $default(_that.language,_that.appendToResponse);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MovieDetailQueryParams implements MovieDetailQueryParams {
  const _MovieDetailQueryParams({this.language = "en-US", @JsonKey(name: "append_to_response") this.appendToResponse = null});
  factory _MovieDetailQueryParams.fromJson(Map<String, dynamic> json) => _$MovieDetailQueryParamsFromJson(json);

@override@JsonKey() final  String? language;
@override@JsonKey(name: "append_to_response") final  String? appendToResponse;

/// Create a copy of MovieDetailQueryParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieDetailQueryParamsCopyWith<_MovieDetailQueryParams> get copyWith => __$MovieDetailQueryParamsCopyWithImpl<_MovieDetailQueryParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieDetailQueryParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieDetailQueryParams&&(identical(other.language, language) || other.language == language)&&(identical(other.appendToResponse, appendToResponse) || other.appendToResponse == appendToResponse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,language,appendToResponse);

@override
String toString() {
  return 'MovieDetailQueryParams(language: $language, appendToResponse: $appendToResponse)';
}


}

/// @nodoc
abstract mixin class _$MovieDetailQueryParamsCopyWith<$Res> implements $MovieDetailQueryParamsCopyWith<$Res> {
  factory _$MovieDetailQueryParamsCopyWith(_MovieDetailQueryParams value, $Res Function(_MovieDetailQueryParams) _then) = __$MovieDetailQueryParamsCopyWithImpl;
@override @useResult
$Res call({
 String? language,@JsonKey(name: "append_to_response") String? appendToResponse
});




}
/// @nodoc
class __$MovieDetailQueryParamsCopyWithImpl<$Res>
    implements _$MovieDetailQueryParamsCopyWith<$Res> {
  __$MovieDetailQueryParamsCopyWithImpl(this._self, this._then);

  final _MovieDetailQueryParams _self;
  final $Res Function(_MovieDetailQueryParams) _then;

/// Create a copy of MovieDetailQueryParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? language = freezed,Object? appendToResponse = freezed,}) {
  return _then(_MovieDetailQueryParams(
language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,appendToResponse: freezed == appendToResponse ? _self.appendToResponse : appendToResponse // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
