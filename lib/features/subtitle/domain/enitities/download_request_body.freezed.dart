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

part of 'download_request_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DownloadRequestBody {

@JsonKey(name: "file_id") String get fileId;
/// Create a copy of DownloadRequestBody
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DownloadRequestBodyCopyWith<DownloadRequestBody> get copyWith => _$DownloadRequestBodyCopyWithImpl<DownloadRequestBody>(this as DownloadRequestBody, _$identity);

  /// Serializes this DownloadRequestBody to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadRequestBody&&(identical(other.fileId, fileId) || other.fileId == fileId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fileId);

@override
String toString() {
  return 'DownloadRequestBody(fileId: $fileId)';
}


}

/// @nodoc
abstract mixin class $DownloadRequestBodyCopyWith<$Res>  {
  factory $DownloadRequestBodyCopyWith(DownloadRequestBody value, $Res Function(DownloadRequestBody) _then) = _$DownloadRequestBodyCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "file_id") String fileId
});




}
/// @nodoc
class _$DownloadRequestBodyCopyWithImpl<$Res>
    implements $DownloadRequestBodyCopyWith<$Res> {
  _$DownloadRequestBodyCopyWithImpl(this._self, this._then);

  final DownloadRequestBody _self;
  final $Res Function(DownloadRequestBody) _then;

/// Create a copy of DownloadRequestBody
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fileId = null,}) {
  return _then(_self.copyWith(
fileId: null == fileId ? _self.fileId : fileId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DownloadRequestBody].
extension DownloadRequestBodyPatterns on DownloadRequestBody {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DownloadRequestBody value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DownloadRequestBody() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DownloadRequestBody value)  $default,){
final _that = this;
switch (_that) {
case _DownloadRequestBody():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DownloadRequestBody value)?  $default,){
final _that = this;
switch (_that) {
case _DownloadRequestBody() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "file_id")  String fileId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DownloadRequestBody() when $default != null:
return $default(_that.fileId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "file_id")  String fileId)  $default,) {final _that = this;
switch (_that) {
case _DownloadRequestBody():
return $default(_that.fileId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "file_id")  String fileId)?  $default,) {final _that = this;
switch (_that) {
case _DownloadRequestBody() when $default != null:
return $default(_that.fileId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DownloadRequestBody implements DownloadRequestBody {
  const _DownloadRequestBody({@JsonKey(name: "file_id") required this.fileId});
  factory _DownloadRequestBody.fromJson(Map<String, dynamic> json) => _$DownloadRequestBodyFromJson(json);

@override@JsonKey(name: "file_id") final  String fileId;

/// Create a copy of DownloadRequestBody
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DownloadRequestBodyCopyWith<_DownloadRequestBody> get copyWith => __$DownloadRequestBodyCopyWithImpl<_DownloadRequestBody>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DownloadRequestBodyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DownloadRequestBody&&(identical(other.fileId, fileId) || other.fileId == fileId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fileId);

@override
String toString() {
  return 'DownloadRequestBody(fileId: $fileId)';
}


}

/// @nodoc
abstract mixin class _$DownloadRequestBodyCopyWith<$Res> implements $DownloadRequestBodyCopyWith<$Res> {
  factory _$DownloadRequestBodyCopyWith(_DownloadRequestBody value, $Res Function(_DownloadRequestBody) _then) = __$DownloadRequestBodyCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "file_id") String fileId
});




}
/// @nodoc
class __$DownloadRequestBodyCopyWithImpl<$Res>
    implements _$DownloadRequestBodyCopyWith<$Res> {
  __$DownloadRequestBodyCopyWithImpl(this._self, this._then);

  final _DownloadRequestBody _self;
  final $Res Function(_DownloadRequestBody) _then;

/// Create a copy of DownloadRequestBody
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fileId = null,}) {
  return _then(_DownloadRequestBody(
fileId: null == fileId ? _self.fileId : fileId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
