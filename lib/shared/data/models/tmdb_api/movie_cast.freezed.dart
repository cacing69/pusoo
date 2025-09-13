// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_cast.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieCast {

 bool get adult; int get gender; int get id;@JsonKey(name: "known_for_department") String? get knownForDepartment; String? get name;@JsonKey(name: "original_name") String? get originalName; double get popularity;@JsonKey(name: "profile_path") String? get profilePath;@JsonKey(name: "cast_id") int get castId; String? get character;@JsonKey(name: "credit_id") String? get creditId; int get order;
/// Create a copy of MovieCast
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieCastCopyWith<MovieCast> get copyWith => _$MovieCastCopyWithImpl<MovieCast>(this as MovieCast, _$identity);

  /// Serializes this MovieCast to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieCast&&(identical(other.adult, adult) || other.adult == adult)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.id, id) || other.id == id)&&(identical(other.knownForDepartment, knownForDepartment) || other.knownForDepartment == knownForDepartment)&&(identical(other.name, name) || other.name == name)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.profilePath, profilePath) || other.profilePath == profilePath)&&(identical(other.castId, castId) || other.castId == castId)&&(identical(other.character, character) || other.character == character)&&(identical(other.creditId, creditId) || other.creditId == creditId)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,adult,gender,id,knownForDepartment,name,originalName,popularity,profilePath,castId,character,creditId,order);

@override
String toString() {
  return 'MovieCast(adult: $adult, gender: $gender, id: $id, knownForDepartment: $knownForDepartment, name: $name, originalName: $originalName, popularity: $popularity, profilePath: $profilePath, castId: $castId, character: $character, creditId: $creditId, order: $order)';
}


}

/// @nodoc
abstract mixin class $MovieCastCopyWith<$Res>  {
  factory $MovieCastCopyWith(MovieCast value, $Res Function(MovieCast) _then) = _$MovieCastCopyWithImpl;
@useResult
$Res call({
 bool adult, int gender, int id,@JsonKey(name: "known_for_department") String? knownForDepartment, String? name,@JsonKey(name: "original_name") String? originalName, double popularity,@JsonKey(name: "profile_path") String? profilePath,@JsonKey(name: "cast_id") int castId, String? character,@JsonKey(name: "credit_id") String? creditId, int order
});




}
/// @nodoc
class _$MovieCastCopyWithImpl<$Res>
    implements $MovieCastCopyWith<$Res> {
  _$MovieCastCopyWithImpl(this._self, this._then);

  final MovieCast _self;
  final $Res Function(MovieCast) _then;

/// Create a copy of MovieCast
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? adult = null,Object? gender = null,Object? id = null,Object? knownForDepartment = freezed,Object? name = freezed,Object? originalName = freezed,Object? popularity = null,Object? profilePath = freezed,Object? castId = null,Object? character = freezed,Object? creditId = freezed,Object? order = null,}) {
  return _then(_self.copyWith(
adult: null == adult ? _self.adult : adult // ignore: cast_nullable_to_non_nullable
as bool,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,knownForDepartment: freezed == knownForDepartment ? _self.knownForDepartment : knownForDepartment // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,originalName: freezed == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String?,popularity: null == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as double,profilePath: freezed == profilePath ? _self.profilePath : profilePath // ignore: cast_nullable_to_non_nullable
as String?,castId: null == castId ? _self.castId : castId // ignore: cast_nullable_to_non_nullable
as int,character: freezed == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as String?,creditId: freezed == creditId ? _self.creditId : creditId // ignore: cast_nullable_to_non_nullable
as String?,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieCast].
extension MovieCastPatterns on MovieCast {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieCast value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieCast() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieCast value)  $default,){
final _that = this;
switch (_that) {
case _MovieCast():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieCast value)?  $default,){
final _that = this;
switch (_that) {
case _MovieCast() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool adult,  int gender,  int id, @JsonKey(name: "known_for_department")  String? knownForDepartment,  String? name, @JsonKey(name: "original_name")  String? originalName,  double popularity, @JsonKey(name: "profile_path")  String? profilePath, @JsonKey(name: "cast_id")  int castId,  String? character, @JsonKey(name: "credit_id")  String? creditId,  int order)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieCast() when $default != null:
return $default(_that.adult,_that.gender,_that.id,_that.knownForDepartment,_that.name,_that.originalName,_that.popularity,_that.profilePath,_that.castId,_that.character,_that.creditId,_that.order);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool adult,  int gender,  int id, @JsonKey(name: "known_for_department")  String? knownForDepartment,  String? name, @JsonKey(name: "original_name")  String? originalName,  double popularity, @JsonKey(name: "profile_path")  String? profilePath, @JsonKey(name: "cast_id")  int castId,  String? character, @JsonKey(name: "credit_id")  String? creditId,  int order)  $default,) {final _that = this;
switch (_that) {
case _MovieCast():
return $default(_that.adult,_that.gender,_that.id,_that.knownForDepartment,_that.name,_that.originalName,_that.popularity,_that.profilePath,_that.castId,_that.character,_that.creditId,_that.order);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool adult,  int gender,  int id, @JsonKey(name: "known_for_department")  String? knownForDepartment,  String? name, @JsonKey(name: "original_name")  String? originalName,  double popularity, @JsonKey(name: "profile_path")  String? profilePath, @JsonKey(name: "cast_id")  int castId,  String? character, @JsonKey(name: "credit_id")  String? creditId,  int order)?  $default,) {final _that = this;
switch (_that) {
case _MovieCast() when $default != null:
return $default(_that.adult,_that.gender,_that.id,_that.knownForDepartment,_that.name,_that.originalName,_that.popularity,_that.profilePath,_that.castId,_that.character,_that.creditId,_that.order);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MovieCast implements MovieCast {
  const _MovieCast({this.adult = true, this.gender = 0, this.id = 0, @JsonKey(name: "known_for_department") this.knownForDepartment = null, this.name = null, @JsonKey(name: "original_name") this.originalName = null, this.popularity = 0, @JsonKey(name: "profile_path") this.profilePath = null, @JsonKey(name: "cast_id") this.castId = 0, this.character = null, @JsonKey(name: "credit_id") this.creditId = null, this.order = 0});
  factory _MovieCast.fromJson(Map<String, dynamic> json) => _$MovieCastFromJson(json);

@override@JsonKey() final  bool adult;
@override@JsonKey() final  int gender;
@override@JsonKey() final  int id;
@override@JsonKey(name: "known_for_department") final  String? knownForDepartment;
@override@JsonKey() final  String? name;
@override@JsonKey(name: "original_name") final  String? originalName;
@override@JsonKey() final  double popularity;
@override@JsonKey(name: "profile_path") final  String? profilePath;
@override@JsonKey(name: "cast_id") final  int castId;
@override@JsonKey() final  String? character;
@override@JsonKey(name: "credit_id") final  String? creditId;
@override@JsonKey() final  int order;

/// Create a copy of MovieCast
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieCastCopyWith<_MovieCast> get copyWith => __$MovieCastCopyWithImpl<_MovieCast>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieCastToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieCast&&(identical(other.adult, adult) || other.adult == adult)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.id, id) || other.id == id)&&(identical(other.knownForDepartment, knownForDepartment) || other.knownForDepartment == knownForDepartment)&&(identical(other.name, name) || other.name == name)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.profilePath, profilePath) || other.profilePath == profilePath)&&(identical(other.castId, castId) || other.castId == castId)&&(identical(other.character, character) || other.character == character)&&(identical(other.creditId, creditId) || other.creditId == creditId)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,adult,gender,id,knownForDepartment,name,originalName,popularity,profilePath,castId,character,creditId,order);

@override
String toString() {
  return 'MovieCast(adult: $adult, gender: $gender, id: $id, knownForDepartment: $knownForDepartment, name: $name, originalName: $originalName, popularity: $popularity, profilePath: $profilePath, castId: $castId, character: $character, creditId: $creditId, order: $order)';
}


}

/// @nodoc
abstract mixin class _$MovieCastCopyWith<$Res> implements $MovieCastCopyWith<$Res> {
  factory _$MovieCastCopyWith(_MovieCast value, $Res Function(_MovieCast) _then) = __$MovieCastCopyWithImpl;
@override @useResult
$Res call({
 bool adult, int gender, int id,@JsonKey(name: "known_for_department") String? knownForDepartment, String? name,@JsonKey(name: "original_name") String? originalName, double popularity,@JsonKey(name: "profile_path") String? profilePath,@JsonKey(name: "cast_id") int castId, String? character,@JsonKey(name: "credit_id") String? creditId, int order
});




}
/// @nodoc
class __$MovieCastCopyWithImpl<$Res>
    implements _$MovieCastCopyWith<$Res> {
  __$MovieCastCopyWithImpl(this._self, this._then);

  final _MovieCast _self;
  final $Res Function(_MovieCast) _then;

/// Create a copy of MovieCast
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? adult = null,Object? gender = null,Object? id = null,Object? knownForDepartment = freezed,Object? name = freezed,Object? originalName = freezed,Object? popularity = null,Object? profilePath = freezed,Object? castId = null,Object? character = freezed,Object? creditId = freezed,Object? order = null,}) {
  return _then(_MovieCast(
adult: null == adult ? _self.adult : adult // ignore: cast_nullable_to_non_nullable
as bool,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,knownForDepartment: freezed == knownForDepartment ? _self.knownForDepartment : knownForDepartment // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,originalName: freezed == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String?,popularity: null == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as double,profilePath: freezed == profilePath ? _self.profilePath : profilePath // ignore: cast_nullable_to_non_nullable
as String?,castId: null == castId ? _self.castId : castId // ignore: cast_nullable_to_non_nullable
as int,character: freezed == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as String?,creditId: freezed == creditId ? _self.creditId : creditId // ignore: cast_nullable_to_non_nullable
as String?,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
