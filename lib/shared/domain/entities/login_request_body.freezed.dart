// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_request_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginRequestBody {

 String? get username; String? get password;
/// Create a copy of LoginRequestBody
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginRequestBodyCopyWith<LoginRequestBody> get copyWith => _$LoginRequestBodyCopyWithImpl<LoginRequestBody>(this as LoginRequestBody, _$identity);

  /// Serializes this LoginRequestBody to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginRequestBody&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,password);

@override
String toString() {
  return 'LoginRequestBody(username: $username, password: $password)';
}


}

/// @nodoc
abstract mixin class $LoginRequestBodyCopyWith<$Res>  {
  factory $LoginRequestBodyCopyWith(LoginRequestBody value, $Res Function(LoginRequestBody) _then) = _$LoginRequestBodyCopyWithImpl;
@useResult
$Res call({
 String? username, String? password
});




}
/// @nodoc
class _$LoginRequestBodyCopyWithImpl<$Res>
    implements $LoginRequestBodyCopyWith<$Res> {
  _$LoginRequestBodyCopyWithImpl(this._self, this._then);

  final LoginRequestBody _self;
  final $Res Function(LoginRequestBody) _then;

/// Create a copy of LoginRequestBody
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = freezed,Object? password = freezed,}) {
  return _then(_self.copyWith(
username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginRequestBody].
extension LoginRequestBodyPatterns on LoginRequestBody {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginRequestBody value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginRequestBody() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginRequestBody value)  $default,){
final _that = this;
switch (_that) {
case _LoginRequestBody():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginRequestBody value)?  $default,){
final _that = this;
switch (_that) {
case _LoginRequestBody() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? username,  String? password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginRequestBody() when $default != null:
return $default(_that.username,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? username,  String? password)  $default,) {final _that = this;
switch (_that) {
case _LoginRequestBody():
return $default(_that.username,_that.password);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? username,  String? password)?  $default,) {final _that = this;
switch (_that) {
case _LoginRequestBody() when $default != null:
return $default(_that.username,_that.password);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginRequestBody implements LoginRequestBody {
  const _LoginRequestBody({this.username, this.password});
  factory _LoginRequestBody.fromJson(Map<String, dynamic> json) => _$LoginRequestBodyFromJson(json);

@override final  String? username;
@override final  String? password;

/// Create a copy of LoginRequestBody
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginRequestBodyCopyWith<_LoginRequestBody> get copyWith => __$LoginRequestBodyCopyWithImpl<_LoginRequestBody>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginRequestBodyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginRequestBody&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,password);

@override
String toString() {
  return 'LoginRequestBody(username: $username, password: $password)';
}


}

/// @nodoc
abstract mixin class _$LoginRequestBodyCopyWith<$Res> implements $LoginRequestBodyCopyWith<$Res> {
  factory _$LoginRequestBodyCopyWith(_LoginRequestBody value, $Res Function(_LoginRequestBody) _then) = __$LoginRequestBodyCopyWithImpl;
@override @useResult
$Res call({
 String? username, String? password
});




}
/// @nodoc
class __$LoginRequestBodyCopyWithImpl<$Res>
    implements _$LoginRequestBodyCopyWith<$Res> {
  __$LoginRequestBodyCopyWithImpl(this._self, this._then);

  final _LoginRequestBody _self;
  final $Res Function(_LoginRequestBody) _then;

/// Create a copy of LoginRequestBody
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = freezed,Object? password = freezed,}) {
  return _then(_LoginRequestBody(
username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
