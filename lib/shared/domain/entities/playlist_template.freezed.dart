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

part of 'playlist_template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlaylistTemplate {

 String? get name; String? get label; List<String>? get knownHosts;// @JsonKey(includeToJson: false, includeFromJson: false)
// List<Function>? movieRules,
// @JsonKey(includeToJson: false, includeFromJson: false)
// List<Function>? seriesRules,
// @JsonKey(includeToJson: false, includeFromJson: false)
// List<Function>? liveTvRules,
@JsonKey(includeToJson: false, includeFromJson: false) Classificator? get movieClassifier;@JsonKey(includeToJson: false, includeFromJson: false) Classificator? get liveTvClassifier;@JsonKey(includeToJson: false, includeFromJson: false) Classificator? get tvSerieClassifier;
/// Create a copy of PlaylistTemplate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaylistTemplateCopyWith<PlaylistTemplate> get copyWith => _$PlaylistTemplateCopyWithImpl<PlaylistTemplate>(this as PlaylistTemplate, _$identity);

  /// Serializes this PlaylistTemplate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaylistTemplate&&(identical(other.name, name) || other.name == name)&&(identical(other.label, label) || other.label == label)&&const DeepCollectionEquality().equals(other.knownHosts, knownHosts)&&(identical(other.movieClassifier, movieClassifier) || other.movieClassifier == movieClassifier)&&(identical(other.liveTvClassifier, liveTvClassifier) || other.liveTvClassifier == liveTvClassifier)&&(identical(other.tvSerieClassifier, tvSerieClassifier) || other.tvSerieClassifier == tvSerieClassifier));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,label,const DeepCollectionEquality().hash(knownHosts),movieClassifier,liveTvClassifier,tvSerieClassifier);

@override
String toString() {
  return 'PlaylistTemplate(name: $name, label: $label, knownHosts: $knownHosts, movieClassifier: $movieClassifier, liveTvClassifier: $liveTvClassifier, tvSerieClassifier: $tvSerieClassifier)';
}


}

/// @nodoc
abstract mixin class $PlaylistTemplateCopyWith<$Res>  {
  factory $PlaylistTemplateCopyWith(PlaylistTemplate value, $Res Function(PlaylistTemplate) _then) = _$PlaylistTemplateCopyWithImpl;
@useResult
$Res call({
 String? name, String? label, List<String>? knownHosts,@JsonKey(includeToJson: false, includeFromJson: false) Classificator? movieClassifier,@JsonKey(includeToJson: false, includeFromJson: false) Classificator? liveTvClassifier,@JsonKey(includeToJson: false, includeFromJson: false) Classificator? tvSerieClassifier
});




}
/// @nodoc
class _$PlaylistTemplateCopyWithImpl<$Res>
    implements $PlaylistTemplateCopyWith<$Res> {
  _$PlaylistTemplateCopyWithImpl(this._self, this._then);

  final PlaylistTemplate _self;
  final $Res Function(PlaylistTemplate) _then;

/// Create a copy of PlaylistTemplate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? label = freezed,Object? knownHosts = freezed,Object? movieClassifier = freezed,Object? liveTvClassifier = freezed,Object? tvSerieClassifier = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,knownHosts: freezed == knownHosts ? _self.knownHosts : knownHosts // ignore: cast_nullable_to_non_nullable
as List<String>?,movieClassifier: freezed == movieClassifier ? _self.movieClassifier : movieClassifier // ignore: cast_nullable_to_non_nullable
as Classificator?,liveTvClassifier: freezed == liveTvClassifier ? _self.liveTvClassifier : liveTvClassifier // ignore: cast_nullable_to_non_nullable
as Classificator?,tvSerieClassifier: freezed == tvSerieClassifier ? _self.tvSerieClassifier : tvSerieClassifier // ignore: cast_nullable_to_non_nullable
as Classificator?,
  ));
}

}


/// Adds pattern-matching-related methods to [PlaylistTemplate].
extension PlaylistTemplatePatterns on PlaylistTemplate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaylistTemplate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaylistTemplate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaylistTemplate value)  $default,){
final _that = this;
switch (_that) {
case _PlaylistTemplate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaylistTemplate value)?  $default,){
final _that = this;
switch (_that) {
case _PlaylistTemplate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? label,  List<String>? knownHosts, @JsonKey(includeToJson: false, includeFromJson: false)  Classificator? movieClassifier, @JsonKey(includeToJson: false, includeFromJson: false)  Classificator? liveTvClassifier, @JsonKey(includeToJson: false, includeFromJson: false)  Classificator? tvSerieClassifier)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaylistTemplate() when $default != null:
return $default(_that.name,_that.label,_that.knownHosts,_that.movieClassifier,_that.liveTvClassifier,_that.tvSerieClassifier);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? label,  List<String>? knownHosts, @JsonKey(includeToJson: false, includeFromJson: false)  Classificator? movieClassifier, @JsonKey(includeToJson: false, includeFromJson: false)  Classificator? liveTvClassifier, @JsonKey(includeToJson: false, includeFromJson: false)  Classificator? tvSerieClassifier)  $default,) {final _that = this;
switch (_that) {
case _PlaylistTemplate():
return $default(_that.name,_that.label,_that.knownHosts,_that.movieClassifier,_that.liveTvClassifier,_that.tvSerieClassifier);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? label,  List<String>? knownHosts, @JsonKey(includeToJson: false, includeFromJson: false)  Classificator? movieClassifier, @JsonKey(includeToJson: false, includeFromJson: false)  Classificator? liveTvClassifier, @JsonKey(includeToJson: false, includeFromJson: false)  Classificator? tvSerieClassifier)?  $default,) {final _that = this;
switch (_that) {
case _PlaylistTemplate() when $default != null:
return $default(_that.name,_that.label,_that.knownHosts,_that.movieClassifier,_that.liveTvClassifier,_that.tvSerieClassifier);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlaylistTemplate implements PlaylistTemplate {
  const _PlaylistTemplate({this.name, this.label, final  List<String>? knownHosts, @JsonKey(includeToJson: false, includeFromJson: false) this.movieClassifier, @JsonKey(includeToJson: false, includeFromJson: false) this.liveTvClassifier, @JsonKey(includeToJson: false, includeFromJson: false) this.tvSerieClassifier}): _knownHosts = knownHosts;
  factory _PlaylistTemplate.fromJson(Map<String, dynamic> json) => _$PlaylistTemplateFromJson(json);

@override final  String? name;
@override final  String? label;
 final  List<String>? _knownHosts;
@override List<String>? get knownHosts {
  final value = _knownHosts;
  if (value == null) return null;
  if (_knownHosts is EqualUnmodifiableListView) return _knownHosts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

// @JsonKey(includeToJson: false, includeFromJson: false)
// List<Function>? movieRules,
// @JsonKey(includeToJson: false, includeFromJson: false)
// List<Function>? seriesRules,
// @JsonKey(includeToJson: false, includeFromJson: false)
// List<Function>? liveTvRules,
@override@JsonKey(includeToJson: false, includeFromJson: false) final  Classificator? movieClassifier;
@override@JsonKey(includeToJson: false, includeFromJson: false) final  Classificator? liveTvClassifier;
@override@JsonKey(includeToJson: false, includeFromJson: false) final  Classificator? tvSerieClassifier;

/// Create a copy of PlaylistTemplate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaylistTemplateCopyWith<_PlaylistTemplate> get copyWith => __$PlaylistTemplateCopyWithImpl<_PlaylistTemplate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaylistTemplateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaylistTemplate&&(identical(other.name, name) || other.name == name)&&(identical(other.label, label) || other.label == label)&&const DeepCollectionEquality().equals(other._knownHosts, _knownHosts)&&(identical(other.movieClassifier, movieClassifier) || other.movieClassifier == movieClassifier)&&(identical(other.liveTvClassifier, liveTvClassifier) || other.liveTvClassifier == liveTvClassifier)&&(identical(other.tvSerieClassifier, tvSerieClassifier) || other.tvSerieClassifier == tvSerieClassifier));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,label,const DeepCollectionEquality().hash(_knownHosts),movieClassifier,liveTvClassifier,tvSerieClassifier);

@override
String toString() {
  return 'PlaylistTemplate(name: $name, label: $label, knownHosts: $knownHosts, movieClassifier: $movieClassifier, liveTvClassifier: $liveTvClassifier, tvSerieClassifier: $tvSerieClassifier)';
}


}

/// @nodoc
abstract mixin class _$PlaylistTemplateCopyWith<$Res> implements $PlaylistTemplateCopyWith<$Res> {
  factory _$PlaylistTemplateCopyWith(_PlaylistTemplate value, $Res Function(_PlaylistTemplate) _then) = __$PlaylistTemplateCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? label, List<String>? knownHosts,@JsonKey(includeToJson: false, includeFromJson: false) Classificator? movieClassifier,@JsonKey(includeToJson: false, includeFromJson: false) Classificator? liveTvClassifier,@JsonKey(includeToJson: false, includeFromJson: false) Classificator? tvSerieClassifier
});




}
/// @nodoc
class __$PlaylistTemplateCopyWithImpl<$Res>
    implements _$PlaylistTemplateCopyWith<$Res> {
  __$PlaylistTemplateCopyWithImpl(this._self, this._then);

  final _PlaylistTemplate _self;
  final $Res Function(_PlaylistTemplate) _then;

/// Create a copy of PlaylistTemplate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? label = freezed,Object? knownHosts = freezed,Object? movieClassifier = freezed,Object? liveTvClassifier = freezed,Object? tvSerieClassifier = freezed,}) {
  return _then(_PlaylistTemplate(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,knownHosts: freezed == knownHosts ? _self._knownHosts : knownHosts // ignore: cast_nullable_to_non_nullable
as List<String>?,movieClassifier: freezed == movieClassifier ? _self.movieClassifier : movieClassifier // ignore: cast_nullable_to_non_nullable
as Classificator?,liveTvClassifier: freezed == liveTvClassifier ? _self.liveTvClassifier : liveTvClassifier // ignore: cast_nullable_to_non_nullable
as Classificator?,tvSerieClassifier: freezed == tvSerieClassifier ? _self.tvSerieClassifier : tvSerieClassifier // ignore: cast_nullable_to_non_nullable
as Classificator?,
  ));
}


}

// dart format on
