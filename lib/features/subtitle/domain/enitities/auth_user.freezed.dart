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

part of 'auth_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthUser {

@JsonKey(name: "allowed_downloads") int? get allowedDownloads;@JsonKey(name: "allowed_translations") int? get allowedTranslations; String? get level;@JsonKey(name: "user_id") int? get userId;@JsonKey(name: "ext_installed") bool? get extInstalled; bool? get vip;
/// Create a copy of AuthUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthUserCopyWith<AuthUser> get copyWith => _$AuthUserCopyWithImpl<AuthUser>(this as AuthUser, _$identity);

  /// Serializes this AuthUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthUser&&(identical(other.allowedDownloads, allowedDownloads) || other.allowedDownloads == allowedDownloads)&&(identical(other.allowedTranslations, allowedTranslations) || other.allowedTranslations == allowedTranslations)&&(identical(other.level, level) || other.level == level)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.extInstalled, extInstalled) || other.extInstalled == extInstalled)&&(identical(other.vip, vip) || other.vip == vip));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,allowedDownloads,allowedTranslations,level,userId,extInstalled,vip);

@override
String toString() {
  return 'AuthUser(allowedDownloads: $allowedDownloads, allowedTranslations: $allowedTranslations, level: $level, userId: $userId, extInstalled: $extInstalled, vip: $vip)';
}


}

/// @nodoc
abstract mixin class $AuthUserCopyWith<$Res>  {
  factory $AuthUserCopyWith(AuthUser value, $Res Function(AuthUser) _then) = _$AuthUserCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "allowed_downloads") int? allowedDownloads,@JsonKey(name: "allowed_translations") int? allowedTranslations, String? level,@JsonKey(name: "user_id") int? userId,@JsonKey(name: "ext_installed") bool? extInstalled, bool? vip
});




}
/// @nodoc
class _$AuthUserCopyWithImpl<$Res>
    implements $AuthUserCopyWith<$Res> {
  _$AuthUserCopyWithImpl(this._self, this._then);

  final AuthUser _self;
  final $Res Function(AuthUser) _then;

/// Create a copy of AuthUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? allowedDownloads = freezed,Object? allowedTranslations = freezed,Object? level = freezed,Object? userId = freezed,Object? extInstalled = freezed,Object? vip = freezed,}) {
  return _then(_self.copyWith(
allowedDownloads: freezed == allowedDownloads ? _self.allowedDownloads : allowedDownloads // ignore: cast_nullable_to_non_nullable
as int?,allowedTranslations: freezed == allowedTranslations ? _self.allowedTranslations : allowedTranslations // ignore: cast_nullable_to_non_nullable
as int?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,extInstalled: freezed == extInstalled ? _self.extInstalled : extInstalled // ignore: cast_nullable_to_non_nullable
as bool?,vip: freezed == vip ? _self.vip : vip // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthUser].
extension AuthUserPatterns on AuthUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthUser value)  $default,){
final _that = this;
switch (_that) {
case _AuthUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthUser value)?  $default,){
final _that = this;
switch (_that) {
case _AuthUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "allowed_downloads")  int? allowedDownloads, @JsonKey(name: "allowed_translations")  int? allowedTranslations,  String? level, @JsonKey(name: "user_id")  int? userId, @JsonKey(name: "ext_installed")  bool? extInstalled,  bool? vip)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthUser() when $default != null:
return $default(_that.allowedDownloads,_that.allowedTranslations,_that.level,_that.userId,_that.extInstalled,_that.vip);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "allowed_downloads")  int? allowedDownloads, @JsonKey(name: "allowed_translations")  int? allowedTranslations,  String? level, @JsonKey(name: "user_id")  int? userId, @JsonKey(name: "ext_installed")  bool? extInstalled,  bool? vip)  $default,) {final _that = this;
switch (_that) {
case _AuthUser():
return $default(_that.allowedDownloads,_that.allowedTranslations,_that.level,_that.userId,_that.extInstalled,_that.vip);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "allowed_downloads")  int? allowedDownloads, @JsonKey(name: "allowed_translations")  int? allowedTranslations,  String? level, @JsonKey(name: "user_id")  int? userId, @JsonKey(name: "ext_installed")  bool? extInstalled,  bool? vip)?  $default,) {final _that = this;
switch (_that) {
case _AuthUser() when $default != null:
return $default(_that.allowedDownloads,_that.allowedTranslations,_that.level,_that.userId,_that.extInstalled,_that.vip);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthUser implements AuthUser {
  const _AuthUser({@JsonKey(name: "allowed_downloads") this.allowedDownloads, @JsonKey(name: "allowed_translations") this.allowedTranslations, this.level, @JsonKey(name: "user_id") this.userId, @JsonKey(name: "ext_installed") this.extInstalled, this.vip});
  factory _AuthUser.fromJson(Map<String, dynamic> json) => _$AuthUserFromJson(json);

@override@JsonKey(name: "allowed_downloads") final  int? allowedDownloads;
@override@JsonKey(name: "allowed_translations") final  int? allowedTranslations;
@override final  String? level;
@override@JsonKey(name: "user_id") final  int? userId;
@override@JsonKey(name: "ext_installed") final  bool? extInstalled;
@override final  bool? vip;

/// Create a copy of AuthUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthUserCopyWith<_AuthUser> get copyWith => __$AuthUserCopyWithImpl<_AuthUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthUser&&(identical(other.allowedDownloads, allowedDownloads) || other.allowedDownloads == allowedDownloads)&&(identical(other.allowedTranslations, allowedTranslations) || other.allowedTranslations == allowedTranslations)&&(identical(other.level, level) || other.level == level)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.extInstalled, extInstalled) || other.extInstalled == extInstalled)&&(identical(other.vip, vip) || other.vip == vip));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,allowedDownloads,allowedTranslations,level,userId,extInstalled,vip);

@override
String toString() {
  return 'AuthUser(allowedDownloads: $allowedDownloads, allowedTranslations: $allowedTranslations, level: $level, userId: $userId, extInstalled: $extInstalled, vip: $vip)';
}


}

/// @nodoc
abstract mixin class _$AuthUserCopyWith<$Res> implements $AuthUserCopyWith<$Res> {
  factory _$AuthUserCopyWith(_AuthUser value, $Res Function(_AuthUser) _then) = __$AuthUserCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "allowed_downloads") int? allowedDownloads,@JsonKey(name: "allowed_translations") int? allowedTranslations, String? level,@JsonKey(name: "user_id") int? userId,@JsonKey(name: "ext_installed") bool? extInstalled, bool? vip
});




}
/// @nodoc
class __$AuthUserCopyWithImpl<$Res>
    implements _$AuthUserCopyWith<$Res> {
  __$AuthUserCopyWithImpl(this._self, this._then);

  final _AuthUser _self;
  final $Res Function(_AuthUser) _then;

/// Create a copy of AuthUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? allowedDownloads = freezed,Object? allowedTranslations = freezed,Object? level = freezed,Object? userId = freezed,Object? extInstalled = freezed,Object? vip = freezed,}) {
  return _then(_AuthUser(
allowedDownloads: freezed == allowedDownloads ? _self.allowedDownloads : allowedDownloads // ignore: cast_nullable_to_non_nullable
as int?,allowedTranslations: freezed == allowedTranslations ? _self.allowedTranslations : allowedTranslations // ignore: cast_nullable_to_non_nullable
as int?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,extInstalled: freezed == extInstalled ? _self.extInstalled : extInstalled // ignore: cast_nullable_to_non_nullable
as bool?,vip: freezed == vip ? _self.vip : vip // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
