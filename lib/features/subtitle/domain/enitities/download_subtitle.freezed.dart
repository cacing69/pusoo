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

part of 'download_subtitle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DownloadSubtitle {

 String? get link;@JsonKey(name: "file_name") String? get fileName; int? get requests; int? get remaining; String? get message;@JsonKey(name: "reset_time") String? get resetTime;@JsonKey(name: "reset_time_utc") DateTime? get resetTimeUtc;
/// Create a copy of DownloadSubtitle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DownloadSubtitleCopyWith<DownloadSubtitle> get copyWith => _$DownloadSubtitleCopyWithImpl<DownloadSubtitle>(this as DownloadSubtitle, _$identity);

  /// Serializes this DownloadSubtitle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadSubtitle&&(identical(other.link, link) || other.link == link)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.requests, requests) || other.requests == requests)&&(identical(other.remaining, remaining) || other.remaining == remaining)&&(identical(other.message, message) || other.message == message)&&(identical(other.resetTime, resetTime) || other.resetTime == resetTime)&&(identical(other.resetTimeUtc, resetTimeUtc) || other.resetTimeUtc == resetTimeUtc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,link,fileName,requests,remaining,message,resetTime,resetTimeUtc);

@override
String toString() {
  return 'DownloadSubtitle(link: $link, fileName: $fileName, requests: $requests, remaining: $remaining, message: $message, resetTime: $resetTime, resetTimeUtc: $resetTimeUtc)';
}


}

/// @nodoc
abstract mixin class $DownloadSubtitleCopyWith<$Res>  {
  factory $DownloadSubtitleCopyWith(DownloadSubtitle value, $Res Function(DownloadSubtitle) _then) = _$DownloadSubtitleCopyWithImpl;
@useResult
$Res call({
 String? link,@JsonKey(name: "file_name") String? fileName, int? requests, int? remaining, String? message,@JsonKey(name: "reset_time") String? resetTime,@JsonKey(name: "reset_time_utc") DateTime? resetTimeUtc
});




}
/// @nodoc
class _$DownloadSubtitleCopyWithImpl<$Res>
    implements $DownloadSubtitleCopyWith<$Res> {
  _$DownloadSubtitleCopyWithImpl(this._self, this._then);

  final DownloadSubtitle _self;
  final $Res Function(DownloadSubtitle) _then;

/// Create a copy of DownloadSubtitle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? link = freezed,Object? fileName = freezed,Object? requests = freezed,Object? remaining = freezed,Object? message = freezed,Object? resetTime = freezed,Object? resetTimeUtc = freezed,}) {
  return _then(_self.copyWith(
link: freezed == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,requests: freezed == requests ? _self.requests : requests // ignore: cast_nullable_to_non_nullable
as int?,remaining: freezed == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,resetTime: freezed == resetTime ? _self.resetTime : resetTime // ignore: cast_nullable_to_non_nullable
as String?,resetTimeUtc: freezed == resetTimeUtc ? _self.resetTimeUtc : resetTimeUtc // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [DownloadSubtitle].
extension DownloadSubtitlePatterns on DownloadSubtitle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DownloadSubtitle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DownloadSubtitle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DownloadSubtitle value)  $default,){
final _that = this;
switch (_that) {
case _DownloadSubtitle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DownloadSubtitle value)?  $default,){
final _that = this;
switch (_that) {
case _DownloadSubtitle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? link, @JsonKey(name: "file_name")  String? fileName,  int? requests,  int? remaining,  String? message, @JsonKey(name: "reset_time")  String? resetTime, @JsonKey(name: "reset_time_utc")  DateTime? resetTimeUtc)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DownloadSubtitle() when $default != null:
return $default(_that.link,_that.fileName,_that.requests,_that.remaining,_that.message,_that.resetTime,_that.resetTimeUtc);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? link, @JsonKey(name: "file_name")  String? fileName,  int? requests,  int? remaining,  String? message, @JsonKey(name: "reset_time")  String? resetTime, @JsonKey(name: "reset_time_utc")  DateTime? resetTimeUtc)  $default,) {final _that = this;
switch (_that) {
case _DownloadSubtitle():
return $default(_that.link,_that.fileName,_that.requests,_that.remaining,_that.message,_that.resetTime,_that.resetTimeUtc);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? link, @JsonKey(name: "file_name")  String? fileName,  int? requests,  int? remaining,  String? message, @JsonKey(name: "reset_time")  String? resetTime, @JsonKey(name: "reset_time_utc")  DateTime? resetTimeUtc)?  $default,) {final _that = this;
switch (_that) {
case _DownloadSubtitle() when $default != null:
return $default(_that.link,_that.fileName,_that.requests,_that.remaining,_that.message,_that.resetTime,_that.resetTimeUtc);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DownloadSubtitle implements DownloadSubtitle {
  const _DownloadSubtitle({this.link, @JsonKey(name: "file_name") this.fileName, this.requests, this.remaining, this.message, @JsonKey(name: "reset_time") this.resetTime, @JsonKey(name: "reset_time_utc") this.resetTimeUtc});
  factory _DownloadSubtitle.fromJson(Map<String, dynamic> json) => _$DownloadSubtitleFromJson(json);

@override final  String? link;
@override@JsonKey(name: "file_name") final  String? fileName;
@override final  int? requests;
@override final  int? remaining;
@override final  String? message;
@override@JsonKey(name: "reset_time") final  String? resetTime;
@override@JsonKey(name: "reset_time_utc") final  DateTime? resetTimeUtc;

/// Create a copy of DownloadSubtitle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DownloadSubtitleCopyWith<_DownloadSubtitle> get copyWith => __$DownloadSubtitleCopyWithImpl<_DownloadSubtitle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DownloadSubtitleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DownloadSubtitle&&(identical(other.link, link) || other.link == link)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.requests, requests) || other.requests == requests)&&(identical(other.remaining, remaining) || other.remaining == remaining)&&(identical(other.message, message) || other.message == message)&&(identical(other.resetTime, resetTime) || other.resetTime == resetTime)&&(identical(other.resetTimeUtc, resetTimeUtc) || other.resetTimeUtc == resetTimeUtc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,link,fileName,requests,remaining,message,resetTime,resetTimeUtc);

@override
String toString() {
  return 'DownloadSubtitle(link: $link, fileName: $fileName, requests: $requests, remaining: $remaining, message: $message, resetTime: $resetTime, resetTimeUtc: $resetTimeUtc)';
}


}

/// @nodoc
abstract mixin class _$DownloadSubtitleCopyWith<$Res> implements $DownloadSubtitleCopyWith<$Res> {
  factory _$DownloadSubtitleCopyWith(_DownloadSubtitle value, $Res Function(_DownloadSubtitle) _then) = __$DownloadSubtitleCopyWithImpl;
@override @useResult
$Res call({
 String? link,@JsonKey(name: "file_name") String? fileName, int? requests, int? remaining, String? message,@JsonKey(name: "reset_time") String? resetTime,@JsonKey(name: "reset_time_utc") DateTime? resetTimeUtc
});




}
/// @nodoc
class __$DownloadSubtitleCopyWithImpl<$Res>
    implements _$DownloadSubtitleCopyWith<$Res> {
  __$DownloadSubtitleCopyWithImpl(this._self, this._then);

  final _DownloadSubtitle _self;
  final $Res Function(_DownloadSubtitle) _then;

/// Create a copy of DownloadSubtitle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? link = freezed,Object? fileName = freezed,Object? requests = freezed,Object? remaining = freezed,Object? message = freezed,Object? resetTime = freezed,Object? resetTimeUtc = freezed,}) {
  return _then(_DownloadSubtitle(
link: freezed == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,requests: freezed == requests ? _self.requests : requests // ignore: cast_nullable_to_non_nullable
as int?,remaining: freezed == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,resetTime: freezed == resetTime ? _self.resetTime : resetTime // ignore: cast_nullable_to_non_nullable
as String?,resetTimeUtc: freezed == resetTimeUtc ? _self.resetTimeUtc : resetTimeUtc // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
