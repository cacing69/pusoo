// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_videos_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieVideosResponse {

 int? get id; List<MovieVideo>? get results;
/// Create a copy of MovieVideosResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieVideosResponseCopyWith<MovieVideosResponse> get copyWith => _$MovieVideosResponseCopyWithImpl<MovieVideosResponse>(this as MovieVideosResponse, _$identity);

  /// Serializes this MovieVideosResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieVideosResponse&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'MovieVideosResponse(id: $id, results: $results)';
}


}

/// @nodoc
abstract mixin class $MovieVideosResponseCopyWith<$Res>  {
  factory $MovieVideosResponseCopyWith(MovieVideosResponse value, $Res Function(MovieVideosResponse) _then) = _$MovieVideosResponseCopyWithImpl;
@useResult
$Res call({
 int? id, List<MovieVideo>? results
});




}
/// @nodoc
class _$MovieVideosResponseCopyWithImpl<$Res>
    implements $MovieVideosResponseCopyWith<$Res> {
  _$MovieVideosResponseCopyWithImpl(this._self, this._then);

  final MovieVideosResponse _self;
  final $Res Function(MovieVideosResponse) _then;

/// Create a copy of MovieVideosResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? results = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,results: freezed == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<MovieVideo>?,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieVideosResponse].
extension MovieVideosResponsePatterns on MovieVideosResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieVideosResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieVideosResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieVideosResponse value)  $default,){
final _that = this;
switch (_that) {
case _MovieVideosResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieVideosResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MovieVideosResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  List<MovieVideo>? results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieVideosResponse() when $default != null:
return $default(_that.id,_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  List<MovieVideo>? results)  $default,) {final _that = this;
switch (_that) {
case _MovieVideosResponse():
return $default(_that.id,_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  List<MovieVideo>? results)?  $default,) {final _that = this;
switch (_that) {
case _MovieVideosResponse() when $default != null:
return $default(_that.id,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MovieVideosResponse implements MovieVideosResponse {
  const _MovieVideosResponse({this.id = 0, final  List<MovieVideo>? results = null}): _results = results;
  factory _MovieVideosResponse.fromJson(Map<String, dynamic> json) => _$MovieVideosResponseFromJson(json);

@override@JsonKey() final  int? id;
 final  List<MovieVideo>? _results;
@override@JsonKey() List<MovieVideo>? get results {
  final value = _results;
  if (value == null) return null;
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of MovieVideosResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieVideosResponseCopyWith<_MovieVideosResponse> get copyWith => __$MovieVideosResponseCopyWithImpl<_MovieVideosResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieVideosResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieVideosResponse&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'MovieVideosResponse(id: $id, results: $results)';
}


}

/// @nodoc
abstract mixin class _$MovieVideosResponseCopyWith<$Res> implements $MovieVideosResponseCopyWith<$Res> {
  factory _$MovieVideosResponseCopyWith(_MovieVideosResponse value, $Res Function(_MovieVideosResponse) _then) = __$MovieVideosResponseCopyWithImpl;
@override @useResult
$Res call({
 int? id, List<MovieVideo>? results
});




}
/// @nodoc
class __$MovieVideosResponseCopyWithImpl<$Res>
    implements _$MovieVideosResponseCopyWith<$Res> {
  __$MovieVideosResponseCopyWithImpl(this._self, this._then);

  final _MovieVideosResponse _self;
  final $Res Function(_MovieVideosResponse) _then;

/// Create a copy of MovieVideosResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? results = freezed,}) {
  return _then(_MovieVideosResponse(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,results: freezed == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<MovieVideo>?,
  ));
}


}

// dart format on
