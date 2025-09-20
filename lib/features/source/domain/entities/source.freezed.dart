// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'source.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Source {

 int? get id; String? get name; String get type; String? get contentType; String? get filePath; String? get template; String? get epgLink; String? get url; bool? get isActive;// Atribut untuk Xtream Codes
 String? get username; String? get password; String? get serverUrl;
/// Create a copy of Source
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SourceCopyWith<Source> get copyWith => _$SourceCopyWithImpl<Source>(this as Source, _$identity);

  /// Serializes this Source to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Source&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.template, template) || other.template == template)&&(identical(other.epgLink, epgLink) || other.epgLink == epgLink)&&(identical(other.url, url) || other.url == url)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.serverUrl, serverUrl) || other.serverUrl == serverUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,contentType,filePath,template,epgLink,url,isActive,username,password,serverUrl);

@override
String toString() {
  return 'Source(id: $id, name: $name, type: $type, contentType: $contentType, filePath: $filePath, template: $template, epgLink: $epgLink, url: $url, isActive: $isActive, username: $username, password: $password, serverUrl: $serverUrl)';
}


}

/// @nodoc
abstract mixin class $SourceCopyWith<$Res>  {
  factory $SourceCopyWith(Source value, $Res Function(Source) _then) = _$SourceCopyWithImpl;
@useResult
$Res call({
 int? id, String? name, String type, String? contentType, String? filePath, String? template, String? epgLink, String? url, bool? isActive, String? username, String? password, String? serverUrl
});




}
/// @nodoc
class _$SourceCopyWithImpl<$Res>
    implements $SourceCopyWith<$Res> {
  _$SourceCopyWithImpl(this._self, this._then);

  final Source _self;
  final $Res Function(Source) _then;

/// Create a copy of Source
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? type = null,Object? contentType = freezed,Object? filePath = freezed,Object? template = freezed,Object? epgLink = freezed,Object? url = freezed,Object? isActive = freezed,Object? username = freezed,Object? password = freezed,Object? serverUrl = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,contentType: freezed == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String?,filePath: freezed == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String?,template: freezed == template ? _self.template : template // ignore: cast_nullable_to_non_nullable
as String?,epgLink: freezed == epgLink ? _self.epgLink : epgLink // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,serverUrl: freezed == serverUrl ? _self.serverUrl : serverUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Source].
extension SourcePatterns on Source {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Source value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Source() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Source value)  $default,){
final _that = this;
switch (_that) {
case _Source():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Source value)?  $default,){
final _that = this;
switch (_that) {
case _Source() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? name,  String type,  String? contentType,  String? filePath,  String? template,  String? epgLink,  String? url,  bool? isActive,  String? username,  String? password,  String? serverUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Source() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.contentType,_that.filePath,_that.template,_that.epgLink,_that.url,_that.isActive,_that.username,_that.password,_that.serverUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? name,  String type,  String? contentType,  String? filePath,  String? template,  String? epgLink,  String? url,  bool? isActive,  String? username,  String? password,  String? serverUrl)  $default,) {final _that = this;
switch (_that) {
case _Source():
return $default(_that.id,_that.name,_that.type,_that.contentType,_that.filePath,_that.template,_that.epgLink,_that.url,_that.isActive,_that.username,_that.password,_that.serverUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? name,  String type,  String? contentType,  String? filePath,  String? template,  String? epgLink,  String? url,  bool? isActive,  String? username,  String? password,  String? serverUrl)?  $default,) {final _that = this;
switch (_that) {
case _Source() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.contentType,_that.filePath,_that.template,_that.epgLink,_that.url,_that.isActive,_that.username,_that.password,_that.serverUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Source implements Source {
  const _Source({this.id, this.name, this.type = "m3u", this.contentType, this.filePath, this.template, this.epgLink, this.url, this.isActive = false, this.username, this.password, this.serverUrl});
  factory _Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

@override final  int? id;
@override final  String? name;
@override@JsonKey() final  String type;
@override final  String? contentType;
@override final  String? filePath;
@override final  String? template;
@override final  String? epgLink;
@override final  String? url;
@override@JsonKey() final  bool? isActive;
// Atribut untuk Xtream Codes
@override final  String? username;
@override final  String? password;
@override final  String? serverUrl;

/// Create a copy of Source
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SourceCopyWith<_Source> get copyWith => __$SourceCopyWithImpl<_Source>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SourceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Source&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.template, template) || other.template == template)&&(identical(other.epgLink, epgLink) || other.epgLink == epgLink)&&(identical(other.url, url) || other.url == url)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.serverUrl, serverUrl) || other.serverUrl == serverUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,contentType,filePath,template,epgLink,url,isActive,username,password,serverUrl);

@override
String toString() {
  return 'Source(id: $id, name: $name, type: $type, contentType: $contentType, filePath: $filePath, template: $template, epgLink: $epgLink, url: $url, isActive: $isActive, username: $username, password: $password, serverUrl: $serverUrl)';
}


}

/// @nodoc
abstract mixin class _$SourceCopyWith<$Res> implements $SourceCopyWith<$Res> {
  factory _$SourceCopyWith(_Source value, $Res Function(_Source) _then) = __$SourceCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? name, String type, String? contentType, String? filePath, String? template, String? epgLink, String? url, bool? isActive, String? username, String? password, String? serverUrl
});




}
/// @nodoc
class __$SourceCopyWithImpl<$Res>
    implements _$SourceCopyWith<$Res> {
  __$SourceCopyWithImpl(this._self, this._then);

  final _Source _self;
  final $Res Function(_Source) _then;

/// Create a copy of Source
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? type = null,Object? contentType = freezed,Object? filePath = freezed,Object? template = freezed,Object? epgLink = freezed,Object? url = freezed,Object? isActive = freezed,Object? username = freezed,Object? password = freezed,Object? serverUrl = freezed,}) {
  return _then(_Source(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,contentType: freezed == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String?,filePath: freezed == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String?,template: freezed == template ? _self.template : template // ignore: cast_nullable_to_non_nullable
as String?,epgLink: freezed == epgLink ? _self.epgLink : epgLink // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,serverUrl: freezed == serverUrl ? _self.serverUrl : serverUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
