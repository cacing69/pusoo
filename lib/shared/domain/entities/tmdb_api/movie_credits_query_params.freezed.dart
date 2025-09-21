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

part of 'movie_credits_query_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieCreditsQueryParams {

 String? get language;
/// Create a copy of MovieCreditsQueryParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieCreditsQueryParamsCopyWith<MovieCreditsQueryParams> get copyWith => _$MovieCreditsQueryParamsCopyWithImpl<MovieCreditsQueryParams>(this as MovieCreditsQueryParams, _$identity);

  /// Serializes this MovieCreditsQueryParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieCreditsQueryParams&&(identical(other.language, language) || other.language == language));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,language);

@override
String toString() {
  return 'MovieCreditsQueryParams(language: $language)';
}


}

/// @nodoc
abstract mixin class $MovieCreditsQueryParamsCopyWith<$Res>  {
  factory $MovieCreditsQueryParamsCopyWith(MovieCreditsQueryParams value, $Res Function(MovieCreditsQueryParams) _then) = _$MovieCreditsQueryParamsCopyWithImpl;
@useResult
$Res call({
 String? language
});




}
/// @nodoc
class _$MovieCreditsQueryParamsCopyWithImpl<$Res>
    implements $MovieCreditsQueryParamsCopyWith<$Res> {
  _$MovieCreditsQueryParamsCopyWithImpl(this._self, this._then);

  final MovieCreditsQueryParams _self;
  final $Res Function(MovieCreditsQueryParams) _then;

/// Create a copy of MovieCreditsQueryParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? language = freezed,}) {
  return _then(_self.copyWith(
language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieCreditsQueryParams].
extension MovieCreditsQueryParamsPatterns on MovieCreditsQueryParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieCreditsQueryParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieCreditsQueryParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieCreditsQueryParams value)  $default,){
final _that = this;
switch (_that) {
case _MovieCreditsQueryParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieCreditsQueryParams value)?  $default,){
final _that = this;
switch (_that) {
case _MovieCreditsQueryParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? language)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieCreditsQueryParams() when $default != null:
return $default(_that.language);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? language)  $default,) {final _that = this;
switch (_that) {
case _MovieCreditsQueryParams():
return $default(_that.language);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? language)?  $default,) {final _that = this;
switch (_that) {
case _MovieCreditsQueryParams() when $default != null:
return $default(_that.language);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MovieCreditsQueryParams implements MovieCreditsQueryParams {
  const _MovieCreditsQueryParams({this.language = "en-US"});
  factory _MovieCreditsQueryParams.fromJson(Map<String, dynamic> json) => _$MovieCreditsQueryParamsFromJson(json);

@override@JsonKey() final  String? language;

/// Create a copy of MovieCreditsQueryParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieCreditsQueryParamsCopyWith<_MovieCreditsQueryParams> get copyWith => __$MovieCreditsQueryParamsCopyWithImpl<_MovieCreditsQueryParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieCreditsQueryParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieCreditsQueryParams&&(identical(other.language, language) || other.language == language));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,language);

@override
String toString() {
  return 'MovieCreditsQueryParams(language: $language)';
}


}

/// @nodoc
abstract mixin class _$MovieCreditsQueryParamsCopyWith<$Res> implements $MovieCreditsQueryParamsCopyWith<$Res> {
  factory _$MovieCreditsQueryParamsCopyWith(_MovieCreditsQueryParams value, $Res Function(_MovieCreditsQueryParams) _then) = __$MovieCreditsQueryParamsCopyWithImpl;
@override @useResult
$Res call({
 String? language
});




}
/// @nodoc
class __$MovieCreditsQueryParamsCopyWithImpl<$Res>
    implements _$MovieCreditsQueryParamsCopyWith<$Res> {
  __$MovieCreditsQueryParamsCopyWithImpl(this._self, this._then);

  final _MovieCreditsQueryParams _self;
  final $Res Function(_MovieCreditsQueryParams) _then;

/// Create a copy of MovieCreditsQueryParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? language = freezed,}) {
  return _then(_MovieCreditsQueryParams(
language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
