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

part of 'attribute_uploader.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AttributeUploader {

@JsonKey(name: "uploader_id") int? get uploaderId; String? get name; String? get rank;
/// Create a copy of AttributeUploader
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttributeUploaderCopyWith<AttributeUploader> get copyWith => _$AttributeUploaderCopyWithImpl<AttributeUploader>(this as AttributeUploader, _$identity);

  /// Serializes this AttributeUploader to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttributeUploader&&(identical(other.uploaderId, uploaderId) || other.uploaderId == uploaderId)&&(identical(other.name, name) || other.name == name)&&(identical(other.rank, rank) || other.rank == rank));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uploaderId,name,rank);

@override
String toString() {
  return 'AttributeUploader(uploaderId: $uploaderId, name: $name, rank: $rank)';
}


}

/// @nodoc
abstract mixin class $AttributeUploaderCopyWith<$Res>  {
  factory $AttributeUploaderCopyWith(AttributeUploader value, $Res Function(AttributeUploader) _then) = _$AttributeUploaderCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "uploader_id") int? uploaderId, String? name, String? rank
});




}
/// @nodoc
class _$AttributeUploaderCopyWithImpl<$Res>
    implements $AttributeUploaderCopyWith<$Res> {
  _$AttributeUploaderCopyWithImpl(this._self, this._then);

  final AttributeUploader _self;
  final $Res Function(AttributeUploader) _then;

/// Create a copy of AttributeUploader
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uploaderId = freezed,Object? name = freezed,Object? rank = freezed,}) {
  return _then(_self.copyWith(
uploaderId: freezed == uploaderId ? _self.uploaderId : uploaderId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,rank: freezed == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AttributeUploader].
extension AttributeUploaderPatterns on AttributeUploader {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttributeUploader value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttributeUploader() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttributeUploader value)  $default,){
final _that = this;
switch (_that) {
case _AttributeUploader():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttributeUploader value)?  $default,){
final _that = this;
switch (_that) {
case _AttributeUploader() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "uploader_id")  int? uploaderId,  String? name,  String? rank)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttributeUploader() when $default != null:
return $default(_that.uploaderId,_that.name,_that.rank);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "uploader_id")  int? uploaderId,  String? name,  String? rank)  $default,) {final _that = this;
switch (_that) {
case _AttributeUploader():
return $default(_that.uploaderId,_that.name,_that.rank);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "uploader_id")  int? uploaderId,  String? name,  String? rank)?  $default,) {final _that = this;
switch (_that) {
case _AttributeUploader() when $default != null:
return $default(_that.uploaderId,_that.name,_that.rank);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttributeUploader implements AttributeUploader {
  const _AttributeUploader({@JsonKey(name: "uploader_id") this.uploaderId, this.name, this.rank});
  factory _AttributeUploader.fromJson(Map<String, dynamic> json) => _$AttributeUploaderFromJson(json);

@override@JsonKey(name: "uploader_id") final  int? uploaderId;
@override final  String? name;
@override final  String? rank;

/// Create a copy of AttributeUploader
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttributeUploaderCopyWith<_AttributeUploader> get copyWith => __$AttributeUploaderCopyWithImpl<_AttributeUploader>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttributeUploaderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttributeUploader&&(identical(other.uploaderId, uploaderId) || other.uploaderId == uploaderId)&&(identical(other.name, name) || other.name == name)&&(identical(other.rank, rank) || other.rank == rank));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uploaderId,name,rank);

@override
String toString() {
  return 'AttributeUploader(uploaderId: $uploaderId, name: $name, rank: $rank)';
}


}

/// @nodoc
abstract mixin class _$AttributeUploaderCopyWith<$Res> implements $AttributeUploaderCopyWith<$Res> {
  factory _$AttributeUploaderCopyWith(_AttributeUploader value, $Res Function(_AttributeUploader) _then) = __$AttributeUploaderCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "uploader_id") int? uploaderId, String? name, String? rank
});




}
/// @nodoc
class __$AttributeUploaderCopyWithImpl<$Res>
    implements _$AttributeUploaderCopyWith<$Res> {
  __$AttributeUploaderCopyWithImpl(this._self, this._then);

  final _AttributeUploader _self;
  final $Res Function(_AttributeUploader) _then;

/// Create a copy of AttributeUploader
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uploaderId = freezed,Object? name = freezed,Object? rank = freezed,}) {
  return _then(_AttributeUploader(
uploaderId: freezed == uploaderId ? _self.uploaderId : uploaderId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,rank: freezed == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
