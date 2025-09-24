// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attribute_related_link.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AttributeRelatedLink {

 String? get label; String? get url;@JsonKey(name: "img_url") String? get imgUrl;
/// Create a copy of AttributeRelatedLink
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttributeRelatedLinkCopyWith<AttributeRelatedLink> get copyWith => _$AttributeRelatedLinkCopyWithImpl<AttributeRelatedLink>(this as AttributeRelatedLink, _$identity);

  /// Serializes this AttributeRelatedLink to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttributeRelatedLink&&(identical(other.label, label) || other.label == label)&&(identical(other.url, url) || other.url == url)&&(identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,url,imgUrl);

@override
String toString() {
  return 'AttributeRelatedLink(label: $label, url: $url, imgUrl: $imgUrl)';
}


}

/// @nodoc
abstract mixin class $AttributeRelatedLinkCopyWith<$Res>  {
  factory $AttributeRelatedLinkCopyWith(AttributeRelatedLink value, $Res Function(AttributeRelatedLink) _then) = _$AttributeRelatedLinkCopyWithImpl;
@useResult
$Res call({
 String? label, String? url,@JsonKey(name: "img_url") String? imgUrl
});




}
/// @nodoc
class _$AttributeRelatedLinkCopyWithImpl<$Res>
    implements $AttributeRelatedLinkCopyWith<$Res> {
  _$AttributeRelatedLinkCopyWithImpl(this._self, this._then);

  final AttributeRelatedLink _self;
  final $Res Function(AttributeRelatedLink) _then;

/// Create a copy of AttributeRelatedLink
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = freezed,Object? url = freezed,Object? imgUrl = freezed,}) {
  return _then(_self.copyWith(
label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,imgUrl: freezed == imgUrl ? _self.imgUrl : imgUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AttributeRelatedLink].
extension AttributeRelatedLinkPatterns on AttributeRelatedLink {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttributeRelatedLink value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttributeRelatedLink() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttributeRelatedLink value)  $default,){
final _that = this;
switch (_that) {
case _AttributeRelatedLink():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttributeRelatedLink value)?  $default,){
final _that = this;
switch (_that) {
case _AttributeRelatedLink() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? label,  String? url, @JsonKey(name: "img_url")  String? imgUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttributeRelatedLink() when $default != null:
return $default(_that.label,_that.url,_that.imgUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? label,  String? url, @JsonKey(name: "img_url")  String? imgUrl)  $default,) {final _that = this;
switch (_that) {
case _AttributeRelatedLink():
return $default(_that.label,_that.url,_that.imgUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? label,  String? url, @JsonKey(name: "img_url")  String? imgUrl)?  $default,) {final _that = this;
switch (_that) {
case _AttributeRelatedLink() when $default != null:
return $default(_that.label,_that.url,_that.imgUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttributeRelatedLink implements AttributeRelatedLink {
  const _AttributeRelatedLink({this.label, this.url, @JsonKey(name: "img_url") this.imgUrl});
  factory _AttributeRelatedLink.fromJson(Map<String, dynamic> json) => _$AttributeRelatedLinkFromJson(json);

@override final  String? label;
@override final  String? url;
@override@JsonKey(name: "img_url") final  String? imgUrl;

/// Create a copy of AttributeRelatedLink
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttributeRelatedLinkCopyWith<_AttributeRelatedLink> get copyWith => __$AttributeRelatedLinkCopyWithImpl<_AttributeRelatedLink>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttributeRelatedLinkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttributeRelatedLink&&(identical(other.label, label) || other.label == label)&&(identical(other.url, url) || other.url == url)&&(identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,url,imgUrl);

@override
String toString() {
  return 'AttributeRelatedLink(label: $label, url: $url, imgUrl: $imgUrl)';
}


}

/// @nodoc
abstract mixin class _$AttributeRelatedLinkCopyWith<$Res> implements $AttributeRelatedLinkCopyWith<$Res> {
  factory _$AttributeRelatedLinkCopyWith(_AttributeRelatedLink value, $Res Function(_AttributeRelatedLink) _then) = __$AttributeRelatedLinkCopyWithImpl;
@override @useResult
$Res call({
 String? label, String? url,@JsonKey(name: "img_url") String? imgUrl
});




}
/// @nodoc
class __$AttributeRelatedLinkCopyWithImpl<$Res>
    implements _$AttributeRelatedLinkCopyWith<$Res> {
  __$AttributeRelatedLinkCopyWithImpl(this._self, this._then);

  final _AttributeRelatedLink _self;
  final $Res Function(_AttributeRelatedLink) _then;

/// Create a copy of AttributeRelatedLink
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = freezed,Object? url = freezed,Object? imgUrl = freezed,}) {
  return _then(_AttributeRelatedLink(
label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,imgUrl: freezed == imgUrl ? _self.imgUrl : imgUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
