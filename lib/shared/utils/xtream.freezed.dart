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

part of 'xtream.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Xtream {

 String get host; String get username; String get password; int get port; String get type; String get output; bool get isValid;
/// Create a copy of Xtream
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$XtreamCopyWith<Xtream> get copyWith => _$XtreamCopyWithImpl<Xtream>(this as Xtream, _$identity);

  /// Serializes this Xtream to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Xtream&&(identical(other.host, host) || other.host == host)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.port, port) || other.port == port)&&(identical(other.type, type) || other.type == type)&&(identical(other.output, output) || other.output == output)&&(identical(other.isValid, isValid) || other.isValid == isValid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,host,username,password,port,type,output,isValid);

@override
String toString() {
  return 'Xtream(host: $host, username: $username, password: $password, port: $port, type: $type, output: $output, isValid: $isValid)';
}


}

/// @nodoc
abstract mixin class $XtreamCopyWith<$Res>  {
  factory $XtreamCopyWith(Xtream value, $Res Function(Xtream) _then) = _$XtreamCopyWithImpl;
@useResult
$Res call({
 String host, String username, String password, int port, String type, String output, bool isValid
});




}
/// @nodoc
class _$XtreamCopyWithImpl<$Res>
    implements $XtreamCopyWith<$Res> {
  _$XtreamCopyWithImpl(this._self, this._then);

  final Xtream _self;
  final $Res Function(Xtream) _then;

/// Create a copy of Xtream
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? host = null,Object? username = null,Object? password = null,Object? port = null,Object? type = null,Object? output = null,Object? isValid = null,}) {
  return _then(_self.copyWith(
host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,output: null == output ? _self.output : output // ignore: cast_nullable_to_non_nullable
as String,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Xtream].
extension XtreamPatterns on Xtream {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Xtream value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Xtream() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Xtream value)  $default,){
final _that = this;
switch (_that) {
case _Xtream():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Xtream value)?  $default,){
final _that = this;
switch (_that) {
case _Xtream() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String host,  String username,  String password,  int port,  String type,  String output,  bool isValid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Xtream() when $default != null:
return $default(_that.host,_that.username,_that.password,_that.port,_that.type,_that.output,_that.isValid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String host,  String username,  String password,  int port,  String type,  String output,  bool isValid)  $default,) {final _that = this;
switch (_that) {
case _Xtream():
return $default(_that.host,_that.username,_that.password,_that.port,_that.type,_that.output,_that.isValid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String host,  String username,  String password,  int port,  String type,  String output,  bool isValid)?  $default,) {final _that = this;
switch (_that) {
case _Xtream() when $default != null:
return $default(_that.host,_that.username,_that.password,_that.port,_that.type,_that.output,_that.isValid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Xtream implements Xtream {
  const _Xtream({this.host = "", this.username = "", this.password = "", this.port = 0, this.type = "", this.output = "", this.isValid = false});
  factory _Xtream.fromJson(Map<String, dynamic> json) => _$XtreamFromJson(json);

@override@JsonKey() final  String host;
@override@JsonKey() final  String username;
@override@JsonKey() final  String password;
@override@JsonKey() final  int port;
@override@JsonKey() final  String type;
@override@JsonKey() final  String output;
@override@JsonKey() final  bool isValid;

/// Create a copy of Xtream
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$XtreamCopyWith<_Xtream> get copyWith => __$XtreamCopyWithImpl<_Xtream>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$XtreamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Xtream&&(identical(other.host, host) || other.host == host)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.port, port) || other.port == port)&&(identical(other.type, type) || other.type == type)&&(identical(other.output, output) || other.output == output)&&(identical(other.isValid, isValid) || other.isValid == isValid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,host,username,password,port,type,output,isValid);

@override
String toString() {
  return 'Xtream(host: $host, username: $username, password: $password, port: $port, type: $type, output: $output, isValid: $isValid)';
}


}

/// @nodoc
abstract mixin class _$XtreamCopyWith<$Res> implements $XtreamCopyWith<$Res> {
  factory _$XtreamCopyWith(_Xtream value, $Res Function(_Xtream) _then) = __$XtreamCopyWithImpl;
@override @useResult
$Res call({
 String host, String username, String password, int port, String type, String output, bool isValid
});




}
/// @nodoc
class __$XtreamCopyWithImpl<$Res>
    implements _$XtreamCopyWith<$Res> {
  __$XtreamCopyWithImpl(this._self, this._then);

  final _Xtream _self;
  final $Res Function(_Xtream) _then;

/// Create a copy of Xtream
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? host = null,Object? username = null,Object? password = null,Object? port = null,Object? type = null,Object? output = null,Object? isValid = null,}) {
  return _then(_Xtream(
host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,output: null == output ? _self.output : output // ignore: cast_nullable_to_non_nullable
as String,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
