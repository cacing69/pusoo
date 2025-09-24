// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_details_query_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieDetailsQueryParams {

 String? get language;@JsonKey(name: "append_to_response") String? get appendToResponse;
/// Create a copy of MovieDetailsQueryParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieDetailsQueryParamsCopyWith<MovieDetailsQueryParams> get copyWith => _$MovieDetailsQueryParamsCopyWithImpl<MovieDetailsQueryParams>(this as MovieDetailsQueryParams, _$identity);

  /// Serializes this MovieDetailsQueryParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDetailsQueryParams&&(identical(other.language, language) || other.language == language)&&(identical(other.appendToResponse, appendToResponse) || other.appendToResponse == appendToResponse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,language,appendToResponse);

@override
String toString() {
  return 'MovieDetailsQueryParams(language: $language, appendToResponse: $appendToResponse)';
}


}

/// @nodoc
abstract mixin class $MovieDetailsQueryParamsCopyWith<$Res>  {
  factory $MovieDetailsQueryParamsCopyWith(MovieDetailsQueryParams value, $Res Function(MovieDetailsQueryParams) _then) = _$MovieDetailsQueryParamsCopyWithImpl;
@useResult
$Res call({
 String? language,@JsonKey(name: "append_to_response") String? appendToResponse
});




}
/// @nodoc
class _$MovieDetailsQueryParamsCopyWithImpl<$Res>
    implements $MovieDetailsQueryParamsCopyWith<$Res> {
  _$MovieDetailsQueryParamsCopyWithImpl(this._self, this._then);

  final MovieDetailsQueryParams _self;
  final $Res Function(MovieDetailsQueryParams) _then;

/// Create a copy of MovieDetailsQueryParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? language = freezed,Object? appendToResponse = freezed,}) {
  return _then(_self.copyWith(
language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,appendToResponse: freezed == appendToResponse ? _self.appendToResponse : appendToResponse // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieDetailsQueryParams].
extension MovieDetailsQueryParamsPatterns on MovieDetailsQueryParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieDetailsQueryParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieDetailsQueryParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieDetailsQueryParams value)  $default,){
final _that = this;
switch (_that) {
case _MovieDetailsQueryParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieDetailsQueryParams value)?  $default,){
final _that = this;
switch (_that) {
case _MovieDetailsQueryParams() when $default != null:
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
case _MovieDetailsQueryParams() when $default != null:
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
case _MovieDetailsQueryParams():
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
case _MovieDetailsQueryParams() when $default != null:
return $default(_that.language,_that.appendToResponse);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MovieDetailsQueryParams implements MovieDetailsQueryParams {
  const _MovieDetailsQueryParams({this.language = "en-US", @JsonKey(name: "append_to_response") this.appendToResponse = null});
  factory _MovieDetailsQueryParams.fromJson(Map<String, dynamic> json) => _$MovieDetailsQueryParamsFromJson(json);

@override@JsonKey() final  String? language;
@override@JsonKey(name: "append_to_response") final  String? appendToResponse;

/// Create a copy of MovieDetailsQueryParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieDetailsQueryParamsCopyWith<_MovieDetailsQueryParams> get copyWith => __$MovieDetailsQueryParamsCopyWithImpl<_MovieDetailsQueryParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieDetailsQueryParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieDetailsQueryParams&&(identical(other.language, language) || other.language == language)&&(identical(other.appendToResponse, appendToResponse) || other.appendToResponse == appendToResponse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,language,appendToResponse);

@override
String toString() {
  return 'MovieDetailsQueryParams(language: $language, appendToResponse: $appendToResponse)';
}


}

/// @nodoc
abstract mixin class _$MovieDetailsQueryParamsCopyWith<$Res> implements $MovieDetailsQueryParamsCopyWith<$Res> {
  factory _$MovieDetailsQueryParamsCopyWith(_MovieDetailsQueryParams value, $Res Function(_MovieDetailsQueryParams) _then) = __$MovieDetailsQueryParamsCopyWithImpl;
@override @useResult
$Res call({
 String? language,@JsonKey(name: "append_to_response") String? appendToResponse
});




}
/// @nodoc
class __$MovieDetailsQueryParamsCopyWithImpl<$Res>
    implements _$MovieDetailsQueryParamsCopyWith<$Res> {
  __$MovieDetailsQueryParamsCopyWithImpl(this._self, this._then);

  final _MovieDetailsQueryParams _self;
  final $Res Function(_MovieDetailsQueryParams) _then;

/// Create a copy of MovieDetailsQueryParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? language = freezed,Object? appendToResponse = freezed,}) {
  return _then(_MovieDetailsQueryParams(
language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,appendToResponse: freezed == appendToResponse ? _self.appendToResponse : appendToResponse // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
