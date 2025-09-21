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

part of 'movie_crew.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieCrew {

 bool get adult; int get gender; int get id;@JsonKey(name: "known_for_department") String? get knownForDepartment; String? get name;@JsonKey(name: "original_name") String? get originalName; double get popularity;@JsonKey(name: "profile_path") String? get profilePath;@JsonKey(name: "credit_id") String? get creditId; String? get department; String? get job;
/// Create a copy of MovieCrew
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieCrewCopyWith<MovieCrew> get copyWith => _$MovieCrewCopyWithImpl<MovieCrew>(this as MovieCrew, _$identity);

  /// Serializes this MovieCrew to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieCrew&&(identical(other.adult, adult) || other.adult == adult)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.id, id) || other.id == id)&&(identical(other.knownForDepartment, knownForDepartment) || other.knownForDepartment == knownForDepartment)&&(identical(other.name, name) || other.name == name)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.profilePath, profilePath) || other.profilePath == profilePath)&&(identical(other.creditId, creditId) || other.creditId == creditId)&&(identical(other.department, department) || other.department == department)&&(identical(other.job, job) || other.job == job));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,adult,gender,id,knownForDepartment,name,originalName,popularity,profilePath,creditId,department,job);

@override
String toString() {
  return 'MovieCrew(adult: $adult, gender: $gender, id: $id, knownForDepartment: $knownForDepartment, name: $name, originalName: $originalName, popularity: $popularity, profilePath: $profilePath, creditId: $creditId, department: $department, job: $job)';
}


}

/// @nodoc
abstract mixin class $MovieCrewCopyWith<$Res>  {
  factory $MovieCrewCopyWith(MovieCrew value, $Res Function(MovieCrew) _then) = _$MovieCrewCopyWithImpl;
@useResult
$Res call({
 bool adult, int gender, int id,@JsonKey(name: "known_for_department") String? knownForDepartment, String? name,@JsonKey(name: "original_name") String? originalName, double popularity,@JsonKey(name: "profile_path") String? profilePath,@JsonKey(name: "credit_id") String? creditId, String? department, String? job
});




}
/// @nodoc
class _$MovieCrewCopyWithImpl<$Res>
    implements $MovieCrewCopyWith<$Res> {
  _$MovieCrewCopyWithImpl(this._self, this._then);

  final MovieCrew _self;
  final $Res Function(MovieCrew) _then;

/// Create a copy of MovieCrew
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? adult = null,Object? gender = null,Object? id = null,Object? knownForDepartment = freezed,Object? name = freezed,Object? originalName = freezed,Object? popularity = null,Object? profilePath = freezed,Object? creditId = freezed,Object? department = freezed,Object? job = freezed,}) {
  return _then(_self.copyWith(
adult: null == adult ? _self.adult : adult // ignore: cast_nullable_to_non_nullable
as bool,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,knownForDepartment: freezed == knownForDepartment ? _self.knownForDepartment : knownForDepartment // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,originalName: freezed == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String?,popularity: null == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as double,profilePath: freezed == profilePath ? _self.profilePath : profilePath // ignore: cast_nullable_to_non_nullable
as String?,creditId: freezed == creditId ? _self.creditId : creditId // ignore: cast_nullable_to_non_nullable
as String?,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,job: freezed == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieCrew].
extension MovieCrewPatterns on MovieCrew {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieCrew value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieCrew() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieCrew value)  $default,){
final _that = this;
switch (_that) {
case _MovieCrew():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieCrew value)?  $default,){
final _that = this;
switch (_that) {
case _MovieCrew() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool adult,  int gender,  int id, @JsonKey(name: "known_for_department")  String? knownForDepartment,  String? name, @JsonKey(name: "original_name")  String? originalName,  double popularity, @JsonKey(name: "profile_path")  String? profilePath, @JsonKey(name: "credit_id")  String? creditId,  String? department,  String? job)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieCrew() when $default != null:
return $default(_that.adult,_that.gender,_that.id,_that.knownForDepartment,_that.name,_that.originalName,_that.popularity,_that.profilePath,_that.creditId,_that.department,_that.job);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool adult,  int gender,  int id, @JsonKey(name: "known_for_department")  String? knownForDepartment,  String? name, @JsonKey(name: "original_name")  String? originalName,  double popularity, @JsonKey(name: "profile_path")  String? profilePath, @JsonKey(name: "credit_id")  String? creditId,  String? department,  String? job)  $default,) {final _that = this;
switch (_that) {
case _MovieCrew():
return $default(_that.adult,_that.gender,_that.id,_that.knownForDepartment,_that.name,_that.originalName,_that.popularity,_that.profilePath,_that.creditId,_that.department,_that.job);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool adult,  int gender,  int id, @JsonKey(name: "known_for_department")  String? knownForDepartment,  String? name, @JsonKey(name: "original_name")  String? originalName,  double popularity, @JsonKey(name: "profile_path")  String? profilePath, @JsonKey(name: "credit_id")  String? creditId,  String? department,  String? job)?  $default,) {final _that = this;
switch (_that) {
case _MovieCrew() when $default != null:
return $default(_that.adult,_that.gender,_that.id,_that.knownForDepartment,_that.name,_that.originalName,_that.popularity,_that.profilePath,_that.creditId,_that.department,_that.job);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MovieCrew implements MovieCrew {
  const _MovieCrew({this.adult = true, this.gender = 0, this.id = 0, @JsonKey(name: "known_for_department") this.knownForDepartment = null, this.name = null, @JsonKey(name: "original_name") this.originalName, this.popularity = 0, @JsonKey(name: "profile_path") this.profilePath, @JsonKey(name: "credit_id") this.creditId, this.department = null, this.job = null});
  factory _MovieCrew.fromJson(Map<String, dynamic> json) => _$MovieCrewFromJson(json);

@override@JsonKey() final  bool adult;
@override@JsonKey() final  int gender;
@override@JsonKey() final  int id;
@override@JsonKey(name: "known_for_department") final  String? knownForDepartment;
@override@JsonKey() final  String? name;
@override@JsonKey(name: "original_name") final  String? originalName;
@override@JsonKey() final  double popularity;
@override@JsonKey(name: "profile_path") final  String? profilePath;
@override@JsonKey(name: "credit_id") final  String? creditId;
@override@JsonKey() final  String? department;
@override@JsonKey() final  String? job;

/// Create a copy of MovieCrew
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieCrewCopyWith<_MovieCrew> get copyWith => __$MovieCrewCopyWithImpl<_MovieCrew>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieCrewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieCrew&&(identical(other.adult, adult) || other.adult == adult)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.id, id) || other.id == id)&&(identical(other.knownForDepartment, knownForDepartment) || other.knownForDepartment == knownForDepartment)&&(identical(other.name, name) || other.name == name)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.profilePath, profilePath) || other.profilePath == profilePath)&&(identical(other.creditId, creditId) || other.creditId == creditId)&&(identical(other.department, department) || other.department == department)&&(identical(other.job, job) || other.job == job));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,adult,gender,id,knownForDepartment,name,originalName,popularity,profilePath,creditId,department,job);

@override
String toString() {
  return 'MovieCrew(adult: $adult, gender: $gender, id: $id, knownForDepartment: $knownForDepartment, name: $name, originalName: $originalName, popularity: $popularity, profilePath: $profilePath, creditId: $creditId, department: $department, job: $job)';
}


}

/// @nodoc
abstract mixin class _$MovieCrewCopyWith<$Res> implements $MovieCrewCopyWith<$Res> {
  factory _$MovieCrewCopyWith(_MovieCrew value, $Res Function(_MovieCrew) _then) = __$MovieCrewCopyWithImpl;
@override @useResult
$Res call({
 bool adult, int gender, int id,@JsonKey(name: "known_for_department") String? knownForDepartment, String? name,@JsonKey(name: "original_name") String? originalName, double popularity,@JsonKey(name: "profile_path") String? profilePath,@JsonKey(name: "credit_id") String? creditId, String? department, String? job
});




}
/// @nodoc
class __$MovieCrewCopyWithImpl<$Res>
    implements _$MovieCrewCopyWith<$Res> {
  __$MovieCrewCopyWithImpl(this._self, this._then);

  final _MovieCrew _self;
  final $Res Function(_MovieCrew) _then;

/// Create a copy of MovieCrew
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? adult = null,Object? gender = null,Object? id = null,Object? knownForDepartment = freezed,Object? name = freezed,Object? originalName = freezed,Object? popularity = null,Object? profilePath = freezed,Object? creditId = freezed,Object? department = freezed,Object? job = freezed,}) {
  return _then(_MovieCrew(
adult: null == adult ? _self.adult : adult // ignore: cast_nullable_to_non_nullable
as bool,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,knownForDepartment: freezed == knownForDepartment ? _self.knownForDepartment : knownForDepartment // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,originalName: freezed == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String?,popularity: null == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as double,profilePath: freezed == profilePath ? _self.profilePath : profilePath // ignore: cast_nullable_to_non_nullable
as String?,creditId: freezed == creditId ? _self.creditId : creditId // ignore: cast_nullable_to_non_nullable
as String?,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,job: freezed == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
