// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subtitle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Subtitle {

@JsonKey(name: "id") String? get id;@JsonKey(name: "type") String? get type;@JsonKey(name: "attributes") dynamic get attributes;@JsonKey(name: "data") List<dynamic>? get data;
/// Create a copy of Subtitle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubtitleCopyWith<Subtitle> get copyWith => _$SubtitleCopyWithImpl<Subtitle>(this as Subtitle, _$identity);

  /// Serializes this Subtitle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Subtitle&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.attributes, attributes)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,const DeepCollectionEquality().hash(attributes),const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'Subtitle(id: $id, type: $type, attributes: $attributes, data: $data)';
}


}

/// @nodoc
abstract mixin class $SubtitleCopyWith<$Res>  {
  factory $SubtitleCopyWith(Subtitle value, $Res Function(Subtitle) _then) = _$SubtitleCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") String? id,@JsonKey(name: "type") String? type,@JsonKey(name: "attributes") dynamic attributes,@JsonKey(name: "data") List<dynamic>? data
});




}
/// @nodoc
class _$SubtitleCopyWithImpl<$Res>
    implements $SubtitleCopyWith<$Res> {
  _$SubtitleCopyWithImpl(this._self, this._then);

  final Subtitle _self;
  final $Res Function(Subtitle) _then;

/// Create a copy of Subtitle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? type = freezed,Object? attributes = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,attributes: freezed == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as dynamic,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Subtitle].
extension SubtitlePatterns on Subtitle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Subtitle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Subtitle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Subtitle value)  $default,){
final _that = this;
switch (_that) {
case _Subtitle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Subtitle value)?  $default,){
final _that = this;
switch (_that) {
case _Subtitle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "type")  String? type, @JsonKey(name: "attributes")  dynamic attributes, @JsonKey(name: "data")  List<dynamic>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Subtitle() when $default != null:
return $default(_that.id,_that.type,_that.attributes,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "type")  String? type, @JsonKey(name: "attributes")  dynamic attributes, @JsonKey(name: "data")  List<dynamic>? data)  $default,) {final _that = this;
switch (_that) {
case _Subtitle():
return $default(_that.id,_that.type,_that.attributes,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "type")  String? type, @JsonKey(name: "attributes")  dynamic attributes, @JsonKey(name: "data")  List<dynamic>? data)?  $default,) {final _that = this;
switch (_that) {
case _Subtitle() when $default != null:
return $default(_that.id,_that.type,_that.attributes,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Subtitle implements Subtitle {
  const _Subtitle({@JsonKey(name: "id") this.id, @JsonKey(name: "type") this.type, @JsonKey(name: "attributes") this.attributes, @JsonKey(name: "data") final  List<dynamic>? data}): _data = data;
  factory _Subtitle.fromJson(Map<String, dynamic> json) => _$SubtitleFromJson(json);

@override@JsonKey(name: "id") final  String? id;
@override@JsonKey(name: "type") final  String? type;
@override@JsonKey(name: "attributes") final  dynamic attributes;
 final  List<dynamic>? _data;
@override@JsonKey(name: "data") List<dynamic>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Subtitle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubtitleCopyWith<_Subtitle> get copyWith => __$SubtitleCopyWithImpl<_Subtitle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubtitleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Subtitle&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.attributes, attributes)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,const DeepCollectionEquality().hash(attributes),const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'Subtitle(id: $id, type: $type, attributes: $attributes, data: $data)';
}


}

/// @nodoc
abstract mixin class _$SubtitleCopyWith<$Res> implements $SubtitleCopyWith<$Res> {
  factory _$SubtitleCopyWith(_Subtitle value, $Res Function(_Subtitle) _then) = __$SubtitleCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") String? id,@JsonKey(name: "type") String? type,@JsonKey(name: "attributes") dynamic attributes,@JsonKey(name: "data") List<dynamic>? data
});




}
/// @nodoc
class __$SubtitleCopyWithImpl<$Res>
    implements _$SubtitleCopyWith<$Res> {
  __$SubtitleCopyWithImpl(this._self, this._then);

  final _Subtitle _self;
  final $Res Function(_Subtitle) _then;

/// Create a copy of Subtitle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? type = freezed,Object? attributes = freezed,Object? data = freezed,}) {
  return _then(_Subtitle(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,attributes: freezed == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as dynamic,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,
  ));
}


}

// dart format on
