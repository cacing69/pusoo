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

part of 'ext_x_media.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExtXMedia {

 String get type; String get groupId; String get language; String get name; bool get isDefault; bool get autoSelect; String get uri;
/// Create a copy of ExtXMedia
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExtXMediaCopyWith<ExtXMedia> get copyWith => _$ExtXMediaCopyWithImpl<ExtXMedia>(this as ExtXMedia, _$identity);

  /// Serializes this ExtXMedia to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExtXMedia&&(identical(other.type, type) || other.type == type)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.language, language) || other.language == language)&&(identical(other.name, name) || other.name == name)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault)&&(identical(other.autoSelect, autoSelect) || other.autoSelect == autoSelect)&&(identical(other.uri, uri) || other.uri == uri));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,groupId,language,name,isDefault,autoSelect,uri);

@override
String toString() {
  return 'ExtXMedia(type: $type, groupId: $groupId, language: $language, name: $name, isDefault: $isDefault, autoSelect: $autoSelect, uri: $uri)';
}


}

/// @nodoc
abstract mixin class $ExtXMediaCopyWith<$Res>  {
  factory $ExtXMediaCopyWith(ExtXMedia value, $Res Function(ExtXMedia) _then) = _$ExtXMediaCopyWithImpl;
@useResult
$Res call({
 String type, String groupId, String language, String name, bool isDefault, bool autoSelect, String uri
});




}
/// @nodoc
class _$ExtXMediaCopyWithImpl<$Res>
    implements $ExtXMediaCopyWith<$Res> {
  _$ExtXMediaCopyWithImpl(this._self, this._then);

  final ExtXMedia _self;
  final $Res Function(ExtXMedia) _then;

/// Create a copy of ExtXMedia
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? groupId = null,Object? language = null,Object? name = null,Object? isDefault = null,Object? autoSelect = null,Object? uri = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,autoSelect: null == autoSelect ? _self.autoSelect : autoSelect // ignore: cast_nullable_to_non_nullable
as bool,uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ExtXMedia].
extension ExtXMediaPatterns on ExtXMedia {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExtXMedia value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExtXMedia() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExtXMedia value)  $default,){
final _that = this;
switch (_that) {
case _ExtXMedia():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExtXMedia value)?  $default,){
final _that = this;
switch (_that) {
case _ExtXMedia() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  String groupId,  String language,  String name,  bool isDefault,  bool autoSelect,  String uri)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExtXMedia() when $default != null:
return $default(_that.type,_that.groupId,_that.language,_that.name,_that.isDefault,_that.autoSelect,_that.uri);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  String groupId,  String language,  String name,  bool isDefault,  bool autoSelect,  String uri)  $default,) {final _that = this;
switch (_that) {
case _ExtXMedia():
return $default(_that.type,_that.groupId,_that.language,_that.name,_that.isDefault,_that.autoSelect,_that.uri);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  String groupId,  String language,  String name,  bool isDefault,  bool autoSelect,  String uri)?  $default,) {final _that = this;
switch (_that) {
case _ExtXMedia() when $default != null:
return $default(_that.type,_that.groupId,_that.language,_that.name,_that.isDefault,_that.autoSelect,_that.uri);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExtXMedia implements ExtXMedia {
  const _ExtXMedia({this.type = "", this.groupId = "", this.language = "", this.name = "", this.isDefault = false, this.autoSelect = false, this.uri = ""});
  factory _ExtXMedia.fromJson(Map<String, dynamic> json) => _$ExtXMediaFromJson(json);

@override@JsonKey() final  String type;
@override@JsonKey() final  String groupId;
@override@JsonKey() final  String language;
@override@JsonKey() final  String name;
@override@JsonKey() final  bool isDefault;
@override@JsonKey() final  bool autoSelect;
@override@JsonKey() final  String uri;

/// Create a copy of ExtXMedia
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExtXMediaCopyWith<_ExtXMedia> get copyWith => __$ExtXMediaCopyWithImpl<_ExtXMedia>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExtXMediaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExtXMedia&&(identical(other.type, type) || other.type == type)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.language, language) || other.language == language)&&(identical(other.name, name) || other.name == name)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault)&&(identical(other.autoSelect, autoSelect) || other.autoSelect == autoSelect)&&(identical(other.uri, uri) || other.uri == uri));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,groupId,language,name,isDefault,autoSelect,uri);

@override
String toString() {
  return 'ExtXMedia(type: $type, groupId: $groupId, language: $language, name: $name, isDefault: $isDefault, autoSelect: $autoSelect, uri: $uri)';
}


}

/// @nodoc
abstract mixin class _$ExtXMediaCopyWith<$Res> implements $ExtXMediaCopyWith<$Res> {
  factory _$ExtXMediaCopyWith(_ExtXMedia value, $Res Function(_ExtXMedia) _then) = __$ExtXMediaCopyWithImpl;
@override @useResult
$Res call({
 String type, String groupId, String language, String name, bool isDefault, bool autoSelect, String uri
});




}
/// @nodoc
class __$ExtXMediaCopyWithImpl<$Res>
    implements _$ExtXMediaCopyWith<$Res> {
  __$ExtXMediaCopyWithImpl(this._self, this._then);

  final _ExtXMedia _self;
  final $Res Function(_ExtXMedia) _then;

/// Create a copy of ExtXMedia
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? groupId = null,Object? language = null,Object? name = null,Object? isDefault = null,Object? autoSelect = null,Object? uri = null,}) {
  return _then(_ExtXMedia(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,autoSelect: null == autoSelect ? _self.autoSelect : autoSelect // ignore: cast_nullable_to_non_nullable
as bool,uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
