// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subtitle_language.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubtitleLanguage {

 String? get label; String? get value;
/// Create a copy of SubtitleLanguage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubtitleLanguageCopyWith<SubtitleLanguage> get copyWith => _$SubtitleLanguageCopyWithImpl<SubtitleLanguage>(this as SubtitleLanguage, _$identity);

  /// Serializes this SubtitleLanguage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubtitleLanguage&&(identical(other.label, label) || other.label == label)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,value);

@override
String toString() {
  return 'SubtitleLanguage(label: $label, value: $value)';
}


}

/// @nodoc
abstract mixin class $SubtitleLanguageCopyWith<$Res>  {
  factory $SubtitleLanguageCopyWith(SubtitleLanguage value, $Res Function(SubtitleLanguage) _then) = _$SubtitleLanguageCopyWithImpl;
@useResult
$Res call({
 String? label, String? value
});




}
/// @nodoc
class _$SubtitleLanguageCopyWithImpl<$Res>
    implements $SubtitleLanguageCopyWith<$Res> {
  _$SubtitleLanguageCopyWithImpl(this._self, this._then);

  final SubtitleLanguage _self;
  final $Res Function(SubtitleLanguage) _then;

/// Create a copy of SubtitleLanguage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = freezed,Object? value = freezed,}) {
  return _then(_self.copyWith(
label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SubtitleLanguage].
extension SubtitleLanguagePatterns on SubtitleLanguage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubtitleLanguage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubtitleLanguage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubtitleLanguage value)  $default,){
final _that = this;
switch (_that) {
case _SubtitleLanguage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubtitleLanguage value)?  $default,){
final _that = this;
switch (_that) {
case _SubtitleLanguage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? label,  String? value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubtitleLanguage() when $default != null:
return $default(_that.label,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? label,  String? value)  $default,) {final _that = this;
switch (_that) {
case _SubtitleLanguage():
return $default(_that.label,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? label,  String? value)?  $default,) {final _that = this;
switch (_that) {
case _SubtitleLanguage() when $default != null:
return $default(_that.label,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubtitleLanguage implements SubtitleLanguage {
  const _SubtitleLanguage({this.label, this.value});
  factory _SubtitleLanguage.fromJson(Map<String, dynamic> json) => _$SubtitleLanguageFromJson(json);

@override final  String? label;
@override final  String? value;

/// Create a copy of SubtitleLanguage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubtitleLanguageCopyWith<_SubtitleLanguage> get copyWith => __$SubtitleLanguageCopyWithImpl<_SubtitleLanguage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubtitleLanguageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubtitleLanguage&&(identical(other.label, label) || other.label == label)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,value);

@override
String toString() {
  return 'SubtitleLanguage(label: $label, value: $value)';
}


}

/// @nodoc
abstract mixin class _$SubtitleLanguageCopyWith<$Res> implements $SubtitleLanguageCopyWith<$Res> {
  factory _$SubtitleLanguageCopyWith(_SubtitleLanguage value, $Res Function(_SubtitleLanguage) _then) = __$SubtitleLanguageCopyWithImpl;
@override @useResult
$Res call({
 String? label, String? value
});




}
/// @nodoc
class __$SubtitleLanguageCopyWithImpl<$Res>
    implements _$SubtitleLanguageCopyWith<$Res> {
  __$SubtitleLanguageCopyWithImpl(this._self, this._then);

  final _SubtitleLanguage _self;
  final $Res Function(_SubtitleLanguage) _then;

/// Create a copy of SubtitleLanguage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = freezed,Object? value = freezed,}) {
  return _then(_SubtitleLanguage(
label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
