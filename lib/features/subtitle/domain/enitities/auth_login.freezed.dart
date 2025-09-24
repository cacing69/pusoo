// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_login.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthLogin {

 AuthUser? get user;@JsonKey(name: "base_url") String? get baseUrl; String? get token; int? get status;
/// Create a copy of AuthLogin
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthLoginCopyWith<AuthLogin> get copyWith => _$AuthLoginCopyWithImpl<AuthLogin>(this as AuthLogin, _$identity);

  /// Serializes this AuthLogin to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLogin&&(identical(other.user, user) || other.user == user)&&(identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl)&&(identical(other.token, token) || other.token == token)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,baseUrl,token,status);

@override
String toString() {
  return 'AuthLogin(user: $user, baseUrl: $baseUrl, token: $token, status: $status)';
}


}

/// @nodoc
abstract mixin class $AuthLoginCopyWith<$Res>  {
  factory $AuthLoginCopyWith(AuthLogin value, $Res Function(AuthLogin) _then) = _$AuthLoginCopyWithImpl;
@useResult
$Res call({
 AuthUser? user,@JsonKey(name: "base_url") String? baseUrl, String? token, int? status
});


$AuthUserCopyWith<$Res>? get user;

}
/// @nodoc
class _$AuthLoginCopyWithImpl<$Res>
    implements $AuthLoginCopyWith<$Res> {
  _$AuthLoginCopyWithImpl(this._self, this._then);

  final AuthLogin _self;
  final $Res Function(AuthLogin) _then;

/// Create a copy of AuthLogin
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = freezed,Object? baseUrl = freezed,Object? token = freezed,Object? status = freezed,}) {
  return _then(_self.copyWith(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as AuthUser?,baseUrl: freezed == baseUrl ? _self.baseUrl : baseUrl // ignore: cast_nullable_to_non_nullable
as String?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of AuthLogin
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $AuthUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthLogin].
extension AuthLoginPatterns on AuthLogin {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthLogin value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthLogin() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthLogin value)  $default,){
final _that = this;
switch (_that) {
case _AuthLogin():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthLogin value)?  $default,){
final _that = this;
switch (_that) {
case _AuthLogin() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AuthUser? user, @JsonKey(name: "base_url")  String? baseUrl,  String? token,  int? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthLogin() when $default != null:
return $default(_that.user,_that.baseUrl,_that.token,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AuthUser? user, @JsonKey(name: "base_url")  String? baseUrl,  String? token,  int? status)  $default,) {final _that = this;
switch (_that) {
case _AuthLogin():
return $default(_that.user,_that.baseUrl,_that.token,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AuthUser? user, @JsonKey(name: "base_url")  String? baseUrl,  String? token,  int? status)?  $default,) {final _that = this;
switch (_that) {
case _AuthLogin() when $default != null:
return $default(_that.user,_that.baseUrl,_that.token,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthLogin implements AuthLogin {
  const _AuthLogin({this.user, @JsonKey(name: "base_url") this.baseUrl, this.token, this.status});
  factory _AuthLogin.fromJson(Map<String, dynamic> json) => _$AuthLoginFromJson(json);

@override final  AuthUser? user;
@override@JsonKey(name: "base_url") final  String? baseUrl;
@override final  String? token;
@override final  int? status;

/// Create a copy of AuthLogin
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthLoginCopyWith<_AuthLogin> get copyWith => __$AuthLoginCopyWithImpl<_AuthLogin>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthLoginToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthLogin&&(identical(other.user, user) || other.user == user)&&(identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl)&&(identical(other.token, token) || other.token == token)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,baseUrl,token,status);

@override
String toString() {
  return 'AuthLogin(user: $user, baseUrl: $baseUrl, token: $token, status: $status)';
}


}

/// @nodoc
abstract mixin class _$AuthLoginCopyWith<$Res> implements $AuthLoginCopyWith<$Res> {
  factory _$AuthLoginCopyWith(_AuthLogin value, $Res Function(_AuthLogin) _then) = __$AuthLoginCopyWithImpl;
@override @useResult
$Res call({
 AuthUser? user,@JsonKey(name: "base_url") String? baseUrl, String? token, int? status
});


@override $AuthUserCopyWith<$Res>? get user;

}
/// @nodoc
class __$AuthLoginCopyWithImpl<$Res>
    implements _$AuthLoginCopyWith<$Res> {
  __$AuthLoginCopyWithImpl(this._self, this._then);

  final _AuthLogin _self;
  final $Res Function(_AuthLogin) _then;

/// Create a copy of AuthLogin
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = freezed,Object? baseUrl = freezed,Object? token = freezed,Object? status = freezed,}) {
  return _then(_AuthLogin(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as AuthUser?,baseUrl: freezed == baseUrl ? _self.baseUrl : baseUrl // ignore: cast_nullable_to_non_nullable
as String?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of AuthLogin
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $AuthUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
