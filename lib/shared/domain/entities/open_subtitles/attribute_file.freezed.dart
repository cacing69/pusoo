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

part of 'attribute_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AttributeFile {

@JsonKey(name: "file_id") int? get fileId;@JsonKey(name: "cd_number") int? get cdNumber;@JsonKey(name: "file_name") String? get fileName;
/// Create a copy of AttributeFile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttributeFileCopyWith<AttributeFile> get copyWith => _$AttributeFileCopyWithImpl<AttributeFile>(this as AttributeFile, _$identity);

  /// Serializes this AttributeFile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttributeFile&&(identical(other.fileId, fileId) || other.fileId == fileId)&&(identical(other.cdNumber, cdNumber) || other.cdNumber == cdNumber)&&(identical(other.fileName, fileName) || other.fileName == fileName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fileId,cdNumber,fileName);

@override
String toString() {
  return 'AttributeFile(fileId: $fileId, cdNumber: $cdNumber, fileName: $fileName)';
}


}

/// @nodoc
abstract mixin class $AttributeFileCopyWith<$Res>  {
  factory $AttributeFileCopyWith(AttributeFile value, $Res Function(AttributeFile) _then) = _$AttributeFileCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "file_id") int? fileId,@JsonKey(name: "cd_number") int? cdNumber,@JsonKey(name: "file_name") String? fileName
});




}
/// @nodoc
class _$AttributeFileCopyWithImpl<$Res>
    implements $AttributeFileCopyWith<$Res> {
  _$AttributeFileCopyWithImpl(this._self, this._then);

  final AttributeFile _self;
  final $Res Function(AttributeFile) _then;

/// Create a copy of AttributeFile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fileId = freezed,Object? cdNumber = freezed,Object? fileName = freezed,}) {
  return _then(_self.copyWith(
fileId: freezed == fileId ? _self.fileId : fileId // ignore: cast_nullable_to_non_nullable
as int?,cdNumber: freezed == cdNumber ? _self.cdNumber : cdNumber // ignore: cast_nullable_to_non_nullable
as int?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AttributeFile].
extension AttributeFilePatterns on AttributeFile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttributeFile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttributeFile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttributeFile value)  $default,){
final _that = this;
switch (_that) {
case _AttributeFile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttributeFile value)?  $default,){
final _that = this;
switch (_that) {
case _AttributeFile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "file_id")  int? fileId, @JsonKey(name: "cd_number")  int? cdNumber, @JsonKey(name: "file_name")  String? fileName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttributeFile() when $default != null:
return $default(_that.fileId,_that.cdNumber,_that.fileName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "file_id")  int? fileId, @JsonKey(name: "cd_number")  int? cdNumber, @JsonKey(name: "file_name")  String? fileName)  $default,) {final _that = this;
switch (_that) {
case _AttributeFile():
return $default(_that.fileId,_that.cdNumber,_that.fileName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "file_id")  int? fileId, @JsonKey(name: "cd_number")  int? cdNumber, @JsonKey(name: "file_name")  String? fileName)?  $default,) {final _that = this;
switch (_that) {
case _AttributeFile() when $default != null:
return $default(_that.fileId,_that.cdNumber,_that.fileName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttributeFile implements AttributeFile {
  const _AttributeFile({@JsonKey(name: "file_id") this.fileId, @JsonKey(name: "cd_number") this.cdNumber, @JsonKey(name: "file_name") this.fileName});
  factory _AttributeFile.fromJson(Map<String, dynamic> json) => _$AttributeFileFromJson(json);

@override@JsonKey(name: "file_id") final  int? fileId;
@override@JsonKey(name: "cd_number") final  int? cdNumber;
@override@JsonKey(name: "file_name") final  String? fileName;

/// Create a copy of AttributeFile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttributeFileCopyWith<_AttributeFile> get copyWith => __$AttributeFileCopyWithImpl<_AttributeFile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttributeFileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttributeFile&&(identical(other.fileId, fileId) || other.fileId == fileId)&&(identical(other.cdNumber, cdNumber) || other.cdNumber == cdNumber)&&(identical(other.fileName, fileName) || other.fileName == fileName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fileId,cdNumber,fileName);

@override
String toString() {
  return 'AttributeFile(fileId: $fileId, cdNumber: $cdNumber, fileName: $fileName)';
}


}

/// @nodoc
abstract mixin class _$AttributeFileCopyWith<$Res> implements $AttributeFileCopyWith<$Res> {
  factory _$AttributeFileCopyWith(_AttributeFile value, $Res Function(_AttributeFile) _then) = __$AttributeFileCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "file_id") int? fileId,@JsonKey(name: "cd_number") int? cdNumber,@JsonKey(name: "file_name") String? fileName
});




}
/// @nodoc
class __$AttributeFileCopyWithImpl<$Res>
    implements _$AttributeFileCopyWith<$Res> {
  __$AttributeFileCopyWithImpl(this._self, this._then);

  final _AttributeFile _self;
  final $Res Function(_AttributeFile) _then;

/// Create a copy of AttributeFile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fileId = freezed,Object? cdNumber = freezed,Object? fileName = freezed,}) {
  return _then(_AttributeFile(
fileId: freezed == fileId ? _self.fileId : fileId // ignore: cast_nullable_to_non_nullable
as int?,cdNumber: freezed == cdNumber ? _self.cdNumber : cdNumber // ignore: cast_nullable_to_non_nullable
as int?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
