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

part of 'search_movie_query_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchMovieQueryParams {

 String get query; String get language; int get page; String? get region; String? get year;@JsonKey(name: 'include_adult') bool get includeAdult;@JsonKey(name: 'primary_release_year') String? get primaryReleaseYear;
/// Create a copy of SearchMovieQueryParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchMovieQueryParamsCopyWith<SearchMovieQueryParams> get copyWith => _$SearchMovieQueryParamsCopyWithImpl<SearchMovieQueryParams>(this as SearchMovieQueryParams, _$identity);

  /// Serializes this SearchMovieQueryParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchMovieQueryParams&&(identical(other.query, query) || other.query == query)&&(identical(other.language, language) || other.language == language)&&(identical(other.page, page) || other.page == page)&&(identical(other.region, region) || other.region == region)&&(identical(other.year, year) || other.year == year)&&(identical(other.includeAdult, includeAdult) || other.includeAdult == includeAdult)&&(identical(other.primaryReleaseYear, primaryReleaseYear) || other.primaryReleaseYear == primaryReleaseYear));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,query,language,page,region,year,includeAdult,primaryReleaseYear);

@override
String toString() {
  return 'SearchMovieQueryParams(query: $query, language: $language, page: $page, region: $region, year: $year, includeAdult: $includeAdult, primaryReleaseYear: $primaryReleaseYear)';
}


}

/// @nodoc
abstract mixin class $SearchMovieQueryParamsCopyWith<$Res>  {
  factory $SearchMovieQueryParamsCopyWith(SearchMovieQueryParams value, $Res Function(SearchMovieQueryParams) _then) = _$SearchMovieQueryParamsCopyWithImpl;
@useResult
$Res call({
 String query, String language, int page, String? region, String? year,@JsonKey(name: 'include_adult') bool includeAdult,@JsonKey(name: 'primary_release_year') String? primaryReleaseYear
});




}
/// @nodoc
class _$SearchMovieQueryParamsCopyWithImpl<$Res>
    implements $SearchMovieQueryParamsCopyWith<$Res> {
  _$SearchMovieQueryParamsCopyWithImpl(this._self, this._then);

  final SearchMovieQueryParams _self;
  final $Res Function(SearchMovieQueryParams) _then;

/// Create a copy of SearchMovieQueryParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,Object? language = null,Object? page = null,Object? region = freezed,Object? year = freezed,Object? includeAdult = null,Object? primaryReleaseYear = freezed,}) {
  return _then(_self.copyWith(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String?,includeAdult: null == includeAdult ? _self.includeAdult : includeAdult // ignore: cast_nullable_to_non_nullable
as bool,primaryReleaseYear: freezed == primaryReleaseYear ? _self.primaryReleaseYear : primaryReleaseYear // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchMovieQueryParams].
extension SearchMovieQueryParamsPatterns on SearchMovieQueryParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchMovieQueryParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchMovieQueryParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchMovieQueryParams value)  $default,){
final _that = this;
switch (_that) {
case _SearchMovieQueryParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchMovieQueryParams value)?  $default,){
final _that = this;
switch (_that) {
case _SearchMovieQueryParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String query,  String language,  int page,  String? region,  String? year, @JsonKey(name: 'include_adult')  bool includeAdult, @JsonKey(name: 'primary_release_year')  String? primaryReleaseYear)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchMovieQueryParams() when $default != null:
return $default(_that.query,_that.language,_that.page,_that.region,_that.year,_that.includeAdult,_that.primaryReleaseYear);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String query,  String language,  int page,  String? region,  String? year, @JsonKey(name: 'include_adult')  bool includeAdult, @JsonKey(name: 'primary_release_year')  String? primaryReleaseYear)  $default,) {final _that = this;
switch (_that) {
case _SearchMovieQueryParams():
return $default(_that.query,_that.language,_that.page,_that.region,_that.year,_that.includeAdult,_that.primaryReleaseYear);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String query,  String language,  int page,  String? region,  String? year, @JsonKey(name: 'include_adult')  bool includeAdult, @JsonKey(name: 'primary_release_year')  String? primaryReleaseYear)?  $default,) {final _that = this;
switch (_that) {
case _SearchMovieQueryParams() when $default != null:
return $default(_that.query,_that.language,_that.page,_that.region,_that.year,_that.includeAdult,_that.primaryReleaseYear);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchMovieQueryParams implements SearchMovieQueryParams {
  const _SearchMovieQueryParams({this.query = "", this.language = "en-US", this.page = 1, this.region = null, this.year = null, @JsonKey(name: 'include_adult') this.includeAdult = false, @JsonKey(name: 'primary_release_year') this.primaryReleaseYear = null});
  factory _SearchMovieQueryParams.fromJson(Map<String, dynamic> json) => _$SearchMovieQueryParamsFromJson(json);

@override@JsonKey() final  String query;
@override@JsonKey() final  String language;
@override@JsonKey() final  int page;
@override@JsonKey() final  String? region;
@override@JsonKey() final  String? year;
@override@JsonKey(name: 'include_adult') final  bool includeAdult;
@override@JsonKey(name: 'primary_release_year') final  String? primaryReleaseYear;

/// Create a copy of SearchMovieQueryParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchMovieQueryParamsCopyWith<_SearchMovieQueryParams> get copyWith => __$SearchMovieQueryParamsCopyWithImpl<_SearchMovieQueryParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchMovieQueryParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchMovieQueryParams&&(identical(other.query, query) || other.query == query)&&(identical(other.language, language) || other.language == language)&&(identical(other.page, page) || other.page == page)&&(identical(other.region, region) || other.region == region)&&(identical(other.year, year) || other.year == year)&&(identical(other.includeAdult, includeAdult) || other.includeAdult == includeAdult)&&(identical(other.primaryReleaseYear, primaryReleaseYear) || other.primaryReleaseYear == primaryReleaseYear));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,query,language,page,region,year,includeAdult,primaryReleaseYear);

@override
String toString() {
  return 'SearchMovieQueryParams(query: $query, language: $language, page: $page, region: $region, year: $year, includeAdult: $includeAdult, primaryReleaseYear: $primaryReleaseYear)';
}


}

/// @nodoc
abstract mixin class _$SearchMovieQueryParamsCopyWith<$Res> implements $SearchMovieQueryParamsCopyWith<$Res> {
  factory _$SearchMovieQueryParamsCopyWith(_SearchMovieQueryParams value, $Res Function(_SearchMovieQueryParams) _then) = __$SearchMovieQueryParamsCopyWithImpl;
@override @useResult
$Res call({
 String query, String language, int page, String? region, String? year,@JsonKey(name: 'include_adult') bool includeAdult,@JsonKey(name: 'primary_release_year') String? primaryReleaseYear
});




}
/// @nodoc
class __$SearchMovieQueryParamsCopyWithImpl<$Res>
    implements _$SearchMovieQueryParamsCopyWith<$Res> {
  __$SearchMovieQueryParamsCopyWithImpl(this._self, this._then);

  final _SearchMovieQueryParams _self;
  final $Res Function(_SearchMovieQueryParams) _then;

/// Create a copy of SearchMovieQueryParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,Object? language = null,Object? page = null,Object? region = freezed,Object? year = freezed,Object? includeAdult = null,Object? primaryReleaseYear = freezed,}) {
  return _then(_SearchMovieQueryParams(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String?,includeAdult: null == includeAdult ? _self.includeAdult : includeAdult // ignore: cast_nullable_to_non_nullable
as bool,primaryReleaseYear: freezed == primaryReleaseYear ? _self.primaryReleaseYear : primaryReleaseYear // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
