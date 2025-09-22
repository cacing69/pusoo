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

part of 'movie_credits_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieCreditsResponse {

 int? get id; List<MovieCast>? get casts; List<MovieCrew>? get crew;
/// Create a copy of MovieCreditsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieCreditsResponseCopyWith<MovieCreditsResponse> get copyWith => _$MovieCreditsResponseCopyWithImpl<MovieCreditsResponse>(this as MovieCreditsResponse, _$identity);

  /// Serializes this MovieCreditsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieCreditsResponse&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.casts, casts)&&const DeepCollectionEquality().equals(other.crew, crew));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(casts),const DeepCollectionEquality().hash(crew));

@override
String toString() {
  return 'MovieCreditsResponse(id: $id, casts: $casts, crew: $crew)';
}


}

/// @nodoc
abstract mixin class $MovieCreditsResponseCopyWith<$Res>  {
  factory $MovieCreditsResponseCopyWith(MovieCreditsResponse value, $Res Function(MovieCreditsResponse) _then) = _$MovieCreditsResponseCopyWithImpl;
@useResult
$Res call({
 int? id, List<MovieCast>? casts, List<MovieCrew>? crew
});




}
/// @nodoc
class _$MovieCreditsResponseCopyWithImpl<$Res>
    implements $MovieCreditsResponseCopyWith<$Res> {
  _$MovieCreditsResponseCopyWithImpl(this._self, this._then);

  final MovieCreditsResponse _self;
  final $Res Function(MovieCreditsResponse) _then;

/// Create a copy of MovieCreditsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? casts = freezed,Object? crew = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,casts: freezed == casts ? _self.casts : casts // ignore: cast_nullable_to_non_nullable
as List<MovieCast>?,crew: freezed == crew ? _self.crew : crew // ignore: cast_nullable_to_non_nullable
as List<MovieCrew>?,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieCreditsResponse].
extension MovieCreditsResponsePatterns on MovieCreditsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieCreditsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieCreditsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieCreditsResponse value)  $default,){
final _that = this;
switch (_that) {
case _MovieCreditsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieCreditsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MovieCreditsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  List<MovieCast>? casts,  List<MovieCrew>? crew)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieCreditsResponse() when $default != null:
return $default(_that.id,_that.casts,_that.crew);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  List<MovieCast>? casts,  List<MovieCrew>? crew)  $default,) {final _that = this;
switch (_that) {
case _MovieCreditsResponse():
return $default(_that.id,_that.casts,_that.crew);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  List<MovieCast>? casts,  List<MovieCrew>? crew)?  $default,) {final _that = this;
switch (_that) {
case _MovieCreditsResponse() when $default != null:
return $default(_that.id,_that.casts,_that.crew);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MovieCreditsResponse implements MovieCreditsResponse {
  const _MovieCreditsResponse({this.id = 0, final  List<MovieCast>? casts = null, final  List<MovieCrew>? crew = null}): _casts = casts,_crew = crew;
  factory _MovieCreditsResponse.fromJson(Map<String, dynamic> json) => _$MovieCreditsResponseFromJson(json);

@override@JsonKey() final  int? id;
 final  List<MovieCast>? _casts;
@override@JsonKey() List<MovieCast>? get casts {
  final value = _casts;
  if (value == null) return null;
  if (_casts is EqualUnmodifiableListView) return _casts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<MovieCrew>? _crew;
@override@JsonKey() List<MovieCrew>? get crew {
  final value = _crew;
  if (value == null) return null;
  if (_crew is EqualUnmodifiableListView) return _crew;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of MovieCreditsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieCreditsResponseCopyWith<_MovieCreditsResponse> get copyWith => __$MovieCreditsResponseCopyWithImpl<_MovieCreditsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieCreditsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieCreditsResponse&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._casts, _casts)&&const DeepCollectionEquality().equals(other._crew, _crew));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_casts),const DeepCollectionEquality().hash(_crew));

@override
String toString() {
  return 'MovieCreditsResponse(id: $id, casts: $casts, crew: $crew)';
}


}

/// @nodoc
abstract mixin class _$MovieCreditsResponseCopyWith<$Res> implements $MovieCreditsResponseCopyWith<$Res> {
  factory _$MovieCreditsResponseCopyWith(_MovieCreditsResponse value, $Res Function(_MovieCreditsResponse) _then) = __$MovieCreditsResponseCopyWithImpl;
@override @useResult
$Res call({
 int? id, List<MovieCast>? casts, List<MovieCrew>? crew
});




}
/// @nodoc
class __$MovieCreditsResponseCopyWithImpl<$Res>
    implements _$MovieCreditsResponseCopyWith<$Res> {
  __$MovieCreditsResponseCopyWithImpl(this._self, this._then);

  final _MovieCreditsResponse _self;
  final $Res Function(_MovieCreditsResponse) _then;

/// Create a copy of MovieCreditsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? casts = freezed,Object? crew = freezed,}) {
  return _then(_MovieCreditsResponse(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,casts: freezed == casts ? _self._casts : casts // ignore: cast_nullable_to_non_nullable
as List<MovieCast>?,crew: freezed == crew ? _self._crew : crew // ignore: cast_nullable_to_non_nullable
as List<MovieCrew>?,
  ));
}


}

// dart format on
