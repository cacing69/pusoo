// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'channel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Channel {

 String? get id; String? get playlistId; String? get name; String? get tvgId; String? get tmdbId; String? get tvgName; String? get logo; String? get groupTitle; bool? get isFavorite; bool? get isLiveTv; bool? get isMovie; bool? get isTvSerie; bool? get isWatched; Map<String, String>? get kodiprop; Map<String, String>? get extvlcopt;
/// Create a copy of Channel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChannelCopyWith<Channel> get copyWith => _$ChannelCopyWithImpl<Channel>(this as Channel, _$identity);

  /// Serializes this Channel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Channel&&(identical(other.id, id) || other.id == id)&&(identical(other.playlistId, playlistId) || other.playlistId == playlistId)&&(identical(other.name, name) || other.name == name)&&(identical(other.tvgId, tvgId) || other.tvgId == tvgId)&&(identical(other.tmdbId, tmdbId) || other.tmdbId == tmdbId)&&(identical(other.tvgName, tvgName) || other.tvgName == tvgName)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.groupTitle, groupTitle) || other.groupTitle == groupTitle)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.isLiveTv, isLiveTv) || other.isLiveTv == isLiveTv)&&(identical(other.isMovie, isMovie) || other.isMovie == isMovie)&&(identical(other.isTvSerie, isTvSerie) || other.isTvSerie == isTvSerie)&&(identical(other.isWatched, isWatched) || other.isWatched == isWatched)&&const DeepCollectionEquality().equals(other.kodiprop, kodiprop)&&const DeepCollectionEquality().equals(other.extvlcopt, extvlcopt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,playlistId,name,tvgId,tmdbId,tvgName,logo,groupTitle,isFavorite,isLiveTv,isMovie,isTvSerie,isWatched,const DeepCollectionEquality().hash(kodiprop),const DeepCollectionEquality().hash(extvlcopt));

@override
String toString() {
  return 'Channel(id: $id, playlistId: $playlistId, name: $name, tvgId: $tvgId, tmdbId: $tmdbId, tvgName: $tvgName, logo: $logo, groupTitle: $groupTitle, isFavorite: $isFavorite, isLiveTv: $isLiveTv, isMovie: $isMovie, isTvSerie: $isTvSerie, isWatched: $isWatched, kodiprop: $kodiprop, extvlcopt: $extvlcopt)';
}


}

/// @nodoc
abstract mixin class $ChannelCopyWith<$Res>  {
  factory $ChannelCopyWith(Channel value, $Res Function(Channel) _then) = _$ChannelCopyWithImpl;
@useResult
$Res call({
 String? id, String? playlistId, String? name, String? tvgId, String? tmdbId, String? tvgName, String? logo, String? groupTitle, bool? isFavorite, bool? isLiveTv, bool? isMovie, bool? isTvSerie, bool? isWatched, Map<String, String>? kodiprop, Map<String, String>? extvlcopt
});




}
/// @nodoc
class _$ChannelCopyWithImpl<$Res>
    implements $ChannelCopyWith<$Res> {
  _$ChannelCopyWithImpl(this._self, this._then);

  final Channel _self;
  final $Res Function(Channel) _then;

/// Create a copy of Channel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? playlistId = freezed,Object? name = freezed,Object? tvgId = freezed,Object? tmdbId = freezed,Object? tvgName = freezed,Object? logo = freezed,Object? groupTitle = freezed,Object? isFavorite = freezed,Object? isLiveTv = freezed,Object? isMovie = freezed,Object? isTvSerie = freezed,Object? isWatched = freezed,Object? kodiprop = freezed,Object? extvlcopt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,playlistId: freezed == playlistId ? _self.playlistId : playlistId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,tvgId: freezed == tvgId ? _self.tvgId : tvgId // ignore: cast_nullable_to_non_nullable
as String?,tmdbId: freezed == tmdbId ? _self.tmdbId : tmdbId // ignore: cast_nullable_to_non_nullable
as String?,tvgName: freezed == tvgName ? _self.tvgName : tvgName // ignore: cast_nullable_to_non_nullable
as String?,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String?,groupTitle: freezed == groupTitle ? _self.groupTitle : groupTitle // ignore: cast_nullable_to_non_nullable
as String?,isFavorite: freezed == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool?,isLiveTv: freezed == isLiveTv ? _self.isLiveTv : isLiveTv // ignore: cast_nullable_to_non_nullable
as bool?,isMovie: freezed == isMovie ? _self.isMovie : isMovie // ignore: cast_nullable_to_non_nullable
as bool?,isTvSerie: freezed == isTvSerie ? _self.isTvSerie : isTvSerie // ignore: cast_nullable_to_non_nullable
as bool?,isWatched: freezed == isWatched ? _self.isWatched : isWatched // ignore: cast_nullable_to_non_nullable
as bool?,kodiprop: freezed == kodiprop ? _self.kodiprop : kodiprop // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,extvlcopt: freezed == extvlcopt ? _self.extvlcopt : extvlcopt // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Channel].
extension ChannelPatterns on Channel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Channel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Channel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Channel value)  $default,){
final _that = this;
switch (_that) {
case _Channel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Channel value)?  $default,){
final _that = this;
switch (_that) {
case _Channel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? playlistId,  String? name,  String? tvgId,  String? tmdbId,  String? tvgName,  String? logo,  String? groupTitle,  bool? isFavorite,  bool? isLiveTv,  bool? isMovie,  bool? isTvSerie,  bool? isWatched,  Map<String, String>? kodiprop,  Map<String, String>? extvlcopt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Channel() when $default != null:
return $default(_that.id,_that.playlistId,_that.name,_that.tvgId,_that.tmdbId,_that.tvgName,_that.logo,_that.groupTitle,_that.isFavorite,_that.isLiveTv,_that.isMovie,_that.isTvSerie,_that.isWatched,_that.kodiprop,_that.extvlcopt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? playlistId,  String? name,  String? tvgId,  String? tmdbId,  String? tvgName,  String? logo,  String? groupTitle,  bool? isFavorite,  bool? isLiveTv,  bool? isMovie,  bool? isTvSerie,  bool? isWatched,  Map<String, String>? kodiprop,  Map<String, String>? extvlcopt)  $default,) {final _that = this;
switch (_that) {
case _Channel():
return $default(_that.id,_that.playlistId,_that.name,_that.tvgId,_that.tmdbId,_that.tvgName,_that.logo,_that.groupTitle,_that.isFavorite,_that.isLiveTv,_that.isMovie,_that.isTvSerie,_that.isWatched,_that.kodiprop,_that.extvlcopt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? playlistId,  String? name,  String? tvgId,  String? tmdbId,  String? tvgName,  String? logo,  String? groupTitle,  bool? isFavorite,  bool? isLiveTv,  bool? isMovie,  bool? isTvSerie,  bool? isWatched,  Map<String, String>? kodiprop,  Map<String, String>? extvlcopt)?  $default,) {final _that = this;
switch (_that) {
case _Channel() when $default != null:
return $default(_that.id,_that.playlistId,_that.name,_that.tvgId,_that.tmdbId,_that.tvgName,_that.logo,_that.groupTitle,_that.isFavorite,_that.isLiveTv,_that.isMovie,_that.isTvSerie,_that.isWatched,_that.kodiprop,_that.extvlcopt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Channel implements Channel {
  const _Channel({this.id = null, this.playlistId = null, this.name = null, this.tvgId = null, this.tmdbId = null, this.tvgName = null, this.logo = null, this.groupTitle = null, this.isFavorite = null, this.isLiveTv = null, this.isMovie = null, this.isTvSerie = null, this.isWatched = null, final  Map<String, String>? kodiprop = null, final  Map<String, String>? extvlcopt = null}): _kodiprop = kodiprop,_extvlcopt = extvlcopt;
  factory _Channel.fromJson(Map<String, dynamic> json) => _$ChannelFromJson(json);

@override@JsonKey() final  String? id;
@override@JsonKey() final  String? playlistId;
@override@JsonKey() final  String? name;
@override@JsonKey() final  String? tvgId;
@override@JsonKey() final  String? tmdbId;
@override@JsonKey() final  String? tvgName;
@override@JsonKey() final  String? logo;
@override@JsonKey() final  String? groupTitle;
@override@JsonKey() final  bool? isFavorite;
@override@JsonKey() final  bool? isLiveTv;
@override@JsonKey() final  bool? isMovie;
@override@JsonKey() final  bool? isTvSerie;
@override@JsonKey() final  bool? isWatched;
 final  Map<String, String>? _kodiprop;
@override@JsonKey() Map<String, String>? get kodiprop {
  final value = _kodiprop;
  if (value == null) return null;
  if (_kodiprop is EqualUnmodifiableMapView) return _kodiprop;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, String>? _extvlcopt;
@override@JsonKey() Map<String, String>? get extvlcopt {
  final value = _extvlcopt;
  if (value == null) return null;
  if (_extvlcopt is EqualUnmodifiableMapView) return _extvlcopt;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of Channel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChannelCopyWith<_Channel> get copyWith => __$ChannelCopyWithImpl<_Channel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChannelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Channel&&(identical(other.id, id) || other.id == id)&&(identical(other.playlistId, playlistId) || other.playlistId == playlistId)&&(identical(other.name, name) || other.name == name)&&(identical(other.tvgId, tvgId) || other.tvgId == tvgId)&&(identical(other.tmdbId, tmdbId) || other.tmdbId == tmdbId)&&(identical(other.tvgName, tvgName) || other.tvgName == tvgName)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.groupTitle, groupTitle) || other.groupTitle == groupTitle)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.isLiveTv, isLiveTv) || other.isLiveTv == isLiveTv)&&(identical(other.isMovie, isMovie) || other.isMovie == isMovie)&&(identical(other.isTvSerie, isTvSerie) || other.isTvSerie == isTvSerie)&&(identical(other.isWatched, isWatched) || other.isWatched == isWatched)&&const DeepCollectionEquality().equals(other._kodiprop, _kodiprop)&&const DeepCollectionEquality().equals(other._extvlcopt, _extvlcopt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,playlistId,name,tvgId,tmdbId,tvgName,logo,groupTitle,isFavorite,isLiveTv,isMovie,isTvSerie,isWatched,const DeepCollectionEquality().hash(_kodiprop),const DeepCollectionEquality().hash(_extvlcopt));

@override
String toString() {
  return 'Channel(id: $id, playlistId: $playlistId, name: $name, tvgId: $tvgId, tmdbId: $tmdbId, tvgName: $tvgName, logo: $logo, groupTitle: $groupTitle, isFavorite: $isFavorite, isLiveTv: $isLiveTv, isMovie: $isMovie, isTvSerie: $isTvSerie, isWatched: $isWatched, kodiprop: $kodiprop, extvlcopt: $extvlcopt)';
}


}

/// @nodoc
abstract mixin class _$ChannelCopyWith<$Res> implements $ChannelCopyWith<$Res> {
  factory _$ChannelCopyWith(_Channel value, $Res Function(_Channel) _then) = __$ChannelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? playlistId, String? name, String? tvgId, String? tmdbId, String? tvgName, String? logo, String? groupTitle, bool? isFavorite, bool? isLiveTv, bool? isMovie, bool? isTvSerie, bool? isWatched, Map<String, String>? kodiprop, Map<String, String>? extvlcopt
});




}
/// @nodoc
class __$ChannelCopyWithImpl<$Res>
    implements _$ChannelCopyWith<$Res> {
  __$ChannelCopyWithImpl(this._self, this._then);

  final _Channel _self;
  final $Res Function(_Channel) _then;

/// Create a copy of Channel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? playlistId = freezed,Object? name = freezed,Object? tvgId = freezed,Object? tmdbId = freezed,Object? tvgName = freezed,Object? logo = freezed,Object? groupTitle = freezed,Object? isFavorite = freezed,Object? isLiveTv = freezed,Object? isMovie = freezed,Object? isTvSerie = freezed,Object? isWatched = freezed,Object? kodiprop = freezed,Object? extvlcopt = freezed,}) {
  return _then(_Channel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,playlistId: freezed == playlistId ? _self.playlistId : playlistId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,tvgId: freezed == tvgId ? _self.tvgId : tvgId // ignore: cast_nullable_to_non_nullable
as String?,tmdbId: freezed == tmdbId ? _self.tmdbId : tmdbId // ignore: cast_nullable_to_non_nullable
as String?,tvgName: freezed == tvgName ? _self.tvgName : tvgName // ignore: cast_nullable_to_non_nullable
as String?,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String?,groupTitle: freezed == groupTitle ? _self.groupTitle : groupTitle // ignore: cast_nullable_to_non_nullable
as String?,isFavorite: freezed == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool?,isLiveTv: freezed == isLiveTv ? _self.isLiveTv : isLiveTv // ignore: cast_nullable_to_non_nullable
as bool?,isMovie: freezed == isMovie ? _self.isMovie : isMovie // ignore: cast_nullable_to_non_nullable
as bool?,isTvSerie: freezed == isTvSerie ? _self.isTvSerie : isTvSerie // ignore: cast_nullable_to_non_nullable
as bool?,isWatched: freezed == isWatched ? _self.isWatched : isWatched // ignore: cast_nullable_to_non_nullable
as bool?,kodiprop: freezed == kodiprop ? _self._kodiprop : kodiprop // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,extvlcopt: freezed == extvlcopt ? _self._extvlcopt : extvlcopt // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}


}

// dart format on
