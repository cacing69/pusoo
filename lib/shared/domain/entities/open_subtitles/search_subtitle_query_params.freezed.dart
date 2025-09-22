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

part of 'search_subtitle_query_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchSubtitleQueryParams {

@JsonKey(name: "ai_translated", includeIfNull: false) String? get aiTranslated;@JsonKey(name: "episode_number", includeIfNull: false) int? get episodeNumber;@JsonKey(name: "foreign_parts_only", includeIfNull: false) String? get foreignPartsOnly;@JsonKey(name: "hearing_impaired", includeIfNull: false) String? get hearingImpaired;@JsonKey(name: "id", includeIfNull: false) int? get id;@JsonKey(name: "imdb_id", includeIfNull: false) int? get imdbId;@JsonKey(includeIfNull: false) String? get languages;@JsonKey(name: "machine_translated", includeIfNull: false) String? get machineTranslated;@JsonKey(includeIfNull: false) String? get moviehash;@JsonKey(name: "movie_hash_match", includeIfNull: false) String? get movieHashMatch;@JsonKey(name: "order_by", includeIfNull: false) String? get orderBy;@JsonKey(name: "order_direction", includeIfNull: false) String? get orderDirection; int get page;@JsonKey(name: "parent_feature_id", includeIfNull: false) int? get parentFeatureId;@JsonKey(name: "parent_imdb_id", includeIfNull: false) int? get parentImdbId;@JsonKey(name: "parent_tmdb_id", includeIfNull: false) int? get parentTmdbId;@JsonKey(includeIfNull: false) String? get query;@JsonKey(name: "season_number", includeIfNull: false) int? get seasonNumber;@JsonKey(name: "tmdb_id", includeIfNull: false) int? get tmdbId;@JsonKey(name: "trusted_sources", includeIfNull: false) String? get trustedSources;@JsonKey(includeIfNull: false) String? get type;@JsonKey(name: "uploader_id", includeIfNull: false) int? get uploaderId;@JsonKey(includeIfNull: false) int? get year;@JsonKey(name: "User-Agent", includeIfNull: false) String? get userAgent;
/// Create a copy of SearchSubtitleQueryParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchSubtitleQueryParamsCopyWith<SearchSubtitleQueryParams> get copyWith => _$SearchSubtitleQueryParamsCopyWithImpl<SearchSubtitleQueryParams>(this as SearchSubtitleQueryParams, _$identity);

  /// Serializes this SearchSubtitleQueryParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchSubtitleQueryParams&&(identical(other.aiTranslated, aiTranslated) || other.aiTranslated == aiTranslated)&&(identical(other.episodeNumber, episodeNumber) || other.episodeNumber == episodeNumber)&&(identical(other.foreignPartsOnly, foreignPartsOnly) || other.foreignPartsOnly == foreignPartsOnly)&&(identical(other.hearingImpaired, hearingImpaired) || other.hearingImpaired == hearingImpaired)&&(identical(other.id, id) || other.id == id)&&(identical(other.imdbId, imdbId) || other.imdbId == imdbId)&&(identical(other.languages, languages) || other.languages == languages)&&(identical(other.machineTranslated, machineTranslated) || other.machineTranslated == machineTranslated)&&(identical(other.moviehash, moviehash) || other.moviehash == moviehash)&&(identical(other.movieHashMatch, movieHashMatch) || other.movieHashMatch == movieHashMatch)&&(identical(other.orderBy, orderBy) || other.orderBy == orderBy)&&(identical(other.orderDirection, orderDirection) || other.orderDirection == orderDirection)&&(identical(other.page, page) || other.page == page)&&(identical(other.parentFeatureId, parentFeatureId) || other.parentFeatureId == parentFeatureId)&&(identical(other.parentImdbId, parentImdbId) || other.parentImdbId == parentImdbId)&&(identical(other.parentTmdbId, parentTmdbId) || other.parentTmdbId == parentTmdbId)&&(identical(other.query, query) || other.query == query)&&(identical(other.seasonNumber, seasonNumber) || other.seasonNumber == seasonNumber)&&(identical(other.tmdbId, tmdbId) || other.tmdbId == tmdbId)&&(identical(other.trustedSources, trustedSources) || other.trustedSources == trustedSources)&&(identical(other.type, type) || other.type == type)&&(identical(other.uploaderId, uploaderId) || other.uploaderId == uploaderId)&&(identical(other.year, year) || other.year == year)&&(identical(other.userAgent, userAgent) || other.userAgent == userAgent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,aiTranslated,episodeNumber,foreignPartsOnly,hearingImpaired,id,imdbId,languages,machineTranslated,moviehash,movieHashMatch,orderBy,orderDirection,page,parentFeatureId,parentImdbId,parentTmdbId,query,seasonNumber,tmdbId,trustedSources,type,uploaderId,year,userAgent]);

@override
String toString() {
  return 'SearchSubtitleQueryParams(aiTranslated: $aiTranslated, episodeNumber: $episodeNumber, foreignPartsOnly: $foreignPartsOnly, hearingImpaired: $hearingImpaired, id: $id, imdbId: $imdbId, languages: $languages, machineTranslated: $machineTranslated, moviehash: $moviehash, movieHashMatch: $movieHashMatch, orderBy: $orderBy, orderDirection: $orderDirection, page: $page, parentFeatureId: $parentFeatureId, parentImdbId: $parentImdbId, parentTmdbId: $parentTmdbId, query: $query, seasonNumber: $seasonNumber, tmdbId: $tmdbId, trustedSources: $trustedSources, type: $type, uploaderId: $uploaderId, year: $year, userAgent: $userAgent)';
}


}

/// @nodoc
abstract mixin class $SearchSubtitleQueryParamsCopyWith<$Res>  {
  factory $SearchSubtitleQueryParamsCopyWith(SearchSubtitleQueryParams value, $Res Function(SearchSubtitleQueryParams) _then) = _$SearchSubtitleQueryParamsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "ai_translated", includeIfNull: false) String? aiTranslated,@JsonKey(name: "episode_number", includeIfNull: false) int? episodeNumber,@JsonKey(name: "foreign_parts_only", includeIfNull: false) String? foreignPartsOnly,@JsonKey(name: "hearing_impaired", includeIfNull: false) String? hearingImpaired,@JsonKey(name: "id", includeIfNull: false) int? id,@JsonKey(name: "imdb_id", includeIfNull: false) int? imdbId,@JsonKey(includeIfNull: false) String? languages,@JsonKey(name: "machine_translated", includeIfNull: false) String? machineTranslated,@JsonKey(includeIfNull: false) String? moviehash,@JsonKey(name: "movie_hash_match", includeIfNull: false) String? movieHashMatch,@JsonKey(name: "order_by", includeIfNull: false) String? orderBy,@JsonKey(name: "order_direction", includeIfNull: false) String? orderDirection, int page,@JsonKey(name: "parent_feature_id", includeIfNull: false) int? parentFeatureId,@JsonKey(name: "parent_imdb_id", includeIfNull: false) int? parentImdbId,@JsonKey(name: "parent_tmdb_id", includeIfNull: false) int? parentTmdbId,@JsonKey(includeIfNull: false) String? query,@JsonKey(name: "season_number", includeIfNull: false) int? seasonNumber,@JsonKey(name: "tmdb_id", includeIfNull: false) int? tmdbId,@JsonKey(name: "trusted_sources", includeIfNull: false) String? trustedSources,@JsonKey(includeIfNull: false) String? type,@JsonKey(name: "uploader_id", includeIfNull: false) int? uploaderId,@JsonKey(includeIfNull: false) int? year,@JsonKey(name: "User-Agent", includeIfNull: false) String? userAgent
});




}
/// @nodoc
class _$SearchSubtitleQueryParamsCopyWithImpl<$Res>
    implements $SearchSubtitleQueryParamsCopyWith<$Res> {
  _$SearchSubtitleQueryParamsCopyWithImpl(this._self, this._then);

  final SearchSubtitleQueryParams _self;
  final $Res Function(SearchSubtitleQueryParams) _then;

/// Create a copy of SearchSubtitleQueryParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? aiTranslated = freezed,Object? episodeNumber = freezed,Object? foreignPartsOnly = freezed,Object? hearingImpaired = freezed,Object? id = freezed,Object? imdbId = freezed,Object? languages = freezed,Object? machineTranslated = freezed,Object? moviehash = freezed,Object? movieHashMatch = freezed,Object? orderBy = freezed,Object? orderDirection = freezed,Object? page = null,Object? parentFeatureId = freezed,Object? parentImdbId = freezed,Object? parentTmdbId = freezed,Object? query = freezed,Object? seasonNumber = freezed,Object? tmdbId = freezed,Object? trustedSources = freezed,Object? type = freezed,Object? uploaderId = freezed,Object? year = freezed,Object? userAgent = freezed,}) {
  return _then(_self.copyWith(
aiTranslated: freezed == aiTranslated ? _self.aiTranslated : aiTranslated // ignore: cast_nullable_to_non_nullable
as String?,episodeNumber: freezed == episodeNumber ? _self.episodeNumber : episodeNumber // ignore: cast_nullable_to_non_nullable
as int?,foreignPartsOnly: freezed == foreignPartsOnly ? _self.foreignPartsOnly : foreignPartsOnly // ignore: cast_nullable_to_non_nullable
as String?,hearingImpaired: freezed == hearingImpaired ? _self.hearingImpaired : hearingImpaired // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,imdbId: freezed == imdbId ? _self.imdbId : imdbId // ignore: cast_nullable_to_non_nullable
as int?,languages: freezed == languages ? _self.languages : languages // ignore: cast_nullable_to_non_nullable
as String?,machineTranslated: freezed == machineTranslated ? _self.machineTranslated : machineTranslated // ignore: cast_nullable_to_non_nullable
as String?,moviehash: freezed == moviehash ? _self.moviehash : moviehash // ignore: cast_nullable_to_non_nullable
as String?,movieHashMatch: freezed == movieHashMatch ? _self.movieHashMatch : movieHashMatch // ignore: cast_nullable_to_non_nullable
as String?,orderBy: freezed == orderBy ? _self.orderBy : orderBy // ignore: cast_nullable_to_non_nullable
as String?,orderDirection: freezed == orderDirection ? _self.orderDirection : orderDirection // ignore: cast_nullable_to_non_nullable
as String?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,parentFeatureId: freezed == parentFeatureId ? _self.parentFeatureId : parentFeatureId // ignore: cast_nullable_to_non_nullable
as int?,parentImdbId: freezed == parentImdbId ? _self.parentImdbId : parentImdbId // ignore: cast_nullable_to_non_nullable
as int?,parentTmdbId: freezed == parentTmdbId ? _self.parentTmdbId : parentTmdbId // ignore: cast_nullable_to_non_nullable
as int?,query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String?,seasonNumber: freezed == seasonNumber ? _self.seasonNumber : seasonNumber // ignore: cast_nullable_to_non_nullable
as int?,tmdbId: freezed == tmdbId ? _self.tmdbId : tmdbId // ignore: cast_nullable_to_non_nullable
as int?,trustedSources: freezed == trustedSources ? _self.trustedSources : trustedSources // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,uploaderId: freezed == uploaderId ? _self.uploaderId : uploaderId // ignore: cast_nullable_to_non_nullable
as int?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,userAgent: freezed == userAgent ? _self.userAgent : userAgent // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchSubtitleQueryParams].
extension SearchSubtitleQueryParamsPatterns on SearchSubtitleQueryParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchSubtitleQueryParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchSubtitleQueryParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchSubtitleQueryParams value)  $default,){
final _that = this;
switch (_that) {
case _SearchSubtitleQueryParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchSubtitleQueryParams value)?  $default,){
final _that = this;
switch (_that) {
case _SearchSubtitleQueryParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "ai_translated", includeIfNull: false)  String? aiTranslated, @JsonKey(name: "episode_number", includeIfNull: false)  int? episodeNumber, @JsonKey(name: "foreign_parts_only", includeIfNull: false)  String? foreignPartsOnly, @JsonKey(name: "hearing_impaired", includeIfNull: false)  String? hearingImpaired, @JsonKey(name: "id", includeIfNull: false)  int? id, @JsonKey(name: "imdb_id", includeIfNull: false)  int? imdbId, @JsonKey(includeIfNull: false)  String? languages, @JsonKey(name: "machine_translated", includeIfNull: false)  String? machineTranslated, @JsonKey(includeIfNull: false)  String? moviehash, @JsonKey(name: "movie_hash_match", includeIfNull: false)  String? movieHashMatch, @JsonKey(name: "order_by", includeIfNull: false)  String? orderBy, @JsonKey(name: "order_direction", includeIfNull: false)  String? orderDirection,  int page, @JsonKey(name: "parent_feature_id", includeIfNull: false)  int? parentFeatureId, @JsonKey(name: "parent_imdb_id", includeIfNull: false)  int? parentImdbId, @JsonKey(name: "parent_tmdb_id", includeIfNull: false)  int? parentTmdbId, @JsonKey(includeIfNull: false)  String? query, @JsonKey(name: "season_number", includeIfNull: false)  int? seasonNumber, @JsonKey(name: "tmdb_id", includeIfNull: false)  int? tmdbId, @JsonKey(name: "trusted_sources", includeIfNull: false)  String? trustedSources, @JsonKey(includeIfNull: false)  String? type, @JsonKey(name: "uploader_id", includeIfNull: false)  int? uploaderId, @JsonKey(includeIfNull: false)  int? year, @JsonKey(name: "User-Agent", includeIfNull: false)  String? userAgent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchSubtitleQueryParams() when $default != null:
return $default(_that.aiTranslated,_that.episodeNumber,_that.foreignPartsOnly,_that.hearingImpaired,_that.id,_that.imdbId,_that.languages,_that.machineTranslated,_that.moviehash,_that.movieHashMatch,_that.orderBy,_that.orderDirection,_that.page,_that.parentFeatureId,_that.parentImdbId,_that.parentTmdbId,_that.query,_that.seasonNumber,_that.tmdbId,_that.trustedSources,_that.type,_that.uploaderId,_that.year,_that.userAgent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "ai_translated", includeIfNull: false)  String? aiTranslated, @JsonKey(name: "episode_number", includeIfNull: false)  int? episodeNumber, @JsonKey(name: "foreign_parts_only", includeIfNull: false)  String? foreignPartsOnly, @JsonKey(name: "hearing_impaired", includeIfNull: false)  String? hearingImpaired, @JsonKey(name: "id", includeIfNull: false)  int? id, @JsonKey(name: "imdb_id", includeIfNull: false)  int? imdbId, @JsonKey(includeIfNull: false)  String? languages, @JsonKey(name: "machine_translated", includeIfNull: false)  String? machineTranslated, @JsonKey(includeIfNull: false)  String? moviehash, @JsonKey(name: "movie_hash_match", includeIfNull: false)  String? movieHashMatch, @JsonKey(name: "order_by", includeIfNull: false)  String? orderBy, @JsonKey(name: "order_direction", includeIfNull: false)  String? orderDirection,  int page, @JsonKey(name: "parent_feature_id", includeIfNull: false)  int? parentFeatureId, @JsonKey(name: "parent_imdb_id", includeIfNull: false)  int? parentImdbId, @JsonKey(name: "parent_tmdb_id", includeIfNull: false)  int? parentTmdbId, @JsonKey(includeIfNull: false)  String? query, @JsonKey(name: "season_number", includeIfNull: false)  int? seasonNumber, @JsonKey(name: "tmdb_id", includeIfNull: false)  int? tmdbId, @JsonKey(name: "trusted_sources", includeIfNull: false)  String? trustedSources, @JsonKey(includeIfNull: false)  String? type, @JsonKey(name: "uploader_id", includeIfNull: false)  int? uploaderId, @JsonKey(includeIfNull: false)  int? year, @JsonKey(name: "User-Agent", includeIfNull: false)  String? userAgent)  $default,) {final _that = this;
switch (_that) {
case _SearchSubtitleQueryParams():
return $default(_that.aiTranslated,_that.episodeNumber,_that.foreignPartsOnly,_that.hearingImpaired,_that.id,_that.imdbId,_that.languages,_that.machineTranslated,_that.moviehash,_that.movieHashMatch,_that.orderBy,_that.orderDirection,_that.page,_that.parentFeatureId,_that.parentImdbId,_that.parentTmdbId,_that.query,_that.seasonNumber,_that.tmdbId,_that.trustedSources,_that.type,_that.uploaderId,_that.year,_that.userAgent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "ai_translated", includeIfNull: false)  String? aiTranslated, @JsonKey(name: "episode_number", includeIfNull: false)  int? episodeNumber, @JsonKey(name: "foreign_parts_only", includeIfNull: false)  String? foreignPartsOnly, @JsonKey(name: "hearing_impaired", includeIfNull: false)  String? hearingImpaired, @JsonKey(name: "id", includeIfNull: false)  int? id, @JsonKey(name: "imdb_id", includeIfNull: false)  int? imdbId, @JsonKey(includeIfNull: false)  String? languages, @JsonKey(name: "machine_translated", includeIfNull: false)  String? machineTranslated, @JsonKey(includeIfNull: false)  String? moviehash, @JsonKey(name: "movie_hash_match", includeIfNull: false)  String? movieHashMatch, @JsonKey(name: "order_by", includeIfNull: false)  String? orderBy, @JsonKey(name: "order_direction", includeIfNull: false)  String? orderDirection,  int page, @JsonKey(name: "parent_feature_id", includeIfNull: false)  int? parentFeatureId, @JsonKey(name: "parent_imdb_id", includeIfNull: false)  int? parentImdbId, @JsonKey(name: "parent_tmdb_id", includeIfNull: false)  int? parentTmdbId, @JsonKey(includeIfNull: false)  String? query, @JsonKey(name: "season_number", includeIfNull: false)  int? seasonNumber, @JsonKey(name: "tmdb_id", includeIfNull: false)  int? tmdbId, @JsonKey(name: "trusted_sources", includeIfNull: false)  String? trustedSources, @JsonKey(includeIfNull: false)  String? type, @JsonKey(name: "uploader_id", includeIfNull: false)  int? uploaderId, @JsonKey(includeIfNull: false)  int? year, @JsonKey(name: "User-Agent", includeIfNull: false)  String? userAgent)?  $default,) {final _that = this;
switch (_that) {
case _SearchSubtitleQueryParams() when $default != null:
return $default(_that.aiTranslated,_that.episodeNumber,_that.foreignPartsOnly,_that.hearingImpaired,_that.id,_that.imdbId,_that.languages,_that.machineTranslated,_that.moviehash,_that.movieHashMatch,_that.orderBy,_that.orderDirection,_that.page,_that.parentFeatureId,_that.parentImdbId,_that.parentTmdbId,_that.query,_that.seasonNumber,_that.tmdbId,_that.trustedSources,_that.type,_that.uploaderId,_that.year,_that.userAgent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchSubtitleQueryParams implements SearchSubtitleQueryParams {
  const _SearchSubtitleQueryParams({@JsonKey(name: "ai_translated", includeIfNull: false) this.aiTranslated, @JsonKey(name: "episode_number", includeIfNull: false) this.episodeNumber, @JsonKey(name: "foreign_parts_only", includeIfNull: false) this.foreignPartsOnly, @JsonKey(name: "hearing_impaired", includeIfNull: false) this.hearingImpaired, @JsonKey(name: "id", includeIfNull: false) this.id, @JsonKey(name: "imdb_id", includeIfNull: false) this.imdbId, @JsonKey(includeIfNull: false) this.languages, @JsonKey(name: "machine_translated", includeIfNull: false) this.machineTranslated, @JsonKey(includeIfNull: false) this.moviehash, @JsonKey(name: "movie_hash_match", includeIfNull: false) this.movieHashMatch, @JsonKey(name: "order_by", includeIfNull: false) this.orderBy, @JsonKey(name: "order_direction", includeIfNull: false) this.orderDirection, this.page = 1, @JsonKey(name: "parent_feature_id", includeIfNull: false) this.parentFeatureId, @JsonKey(name: "parent_imdb_id", includeIfNull: false) this.parentImdbId, @JsonKey(name: "parent_tmdb_id", includeIfNull: false) this.parentTmdbId, @JsonKey(includeIfNull: false) this.query, @JsonKey(name: "season_number", includeIfNull: false) this.seasonNumber, @JsonKey(name: "tmdb_id", includeIfNull: false) this.tmdbId, @JsonKey(name: "trusted_sources", includeIfNull: false) this.trustedSources, @JsonKey(includeIfNull: false) this.type, @JsonKey(name: "uploader_id", includeIfNull: false) this.uploaderId, @JsonKey(includeIfNull: false) this.year, @JsonKey(name: "User-Agent", includeIfNull: false) this.userAgent});
  factory _SearchSubtitleQueryParams.fromJson(Map<String, dynamic> json) => _$SearchSubtitleQueryParamsFromJson(json);

@override@JsonKey(name: "ai_translated", includeIfNull: false) final  String? aiTranslated;
@override@JsonKey(name: "episode_number", includeIfNull: false) final  int? episodeNumber;
@override@JsonKey(name: "foreign_parts_only", includeIfNull: false) final  String? foreignPartsOnly;
@override@JsonKey(name: "hearing_impaired", includeIfNull: false) final  String? hearingImpaired;
@override@JsonKey(name: "id", includeIfNull: false) final  int? id;
@override@JsonKey(name: "imdb_id", includeIfNull: false) final  int? imdbId;
@override@JsonKey(includeIfNull: false) final  String? languages;
@override@JsonKey(name: "machine_translated", includeIfNull: false) final  String? machineTranslated;
@override@JsonKey(includeIfNull: false) final  String? moviehash;
@override@JsonKey(name: "movie_hash_match", includeIfNull: false) final  String? movieHashMatch;
@override@JsonKey(name: "order_by", includeIfNull: false) final  String? orderBy;
@override@JsonKey(name: "order_direction", includeIfNull: false) final  String? orderDirection;
@override@JsonKey() final  int page;
@override@JsonKey(name: "parent_feature_id", includeIfNull: false) final  int? parentFeatureId;
@override@JsonKey(name: "parent_imdb_id", includeIfNull: false) final  int? parentImdbId;
@override@JsonKey(name: "parent_tmdb_id", includeIfNull: false) final  int? parentTmdbId;
@override@JsonKey(includeIfNull: false) final  String? query;
@override@JsonKey(name: "season_number", includeIfNull: false) final  int? seasonNumber;
@override@JsonKey(name: "tmdb_id", includeIfNull: false) final  int? tmdbId;
@override@JsonKey(name: "trusted_sources", includeIfNull: false) final  String? trustedSources;
@override@JsonKey(includeIfNull: false) final  String? type;
@override@JsonKey(name: "uploader_id", includeIfNull: false) final  int? uploaderId;
@override@JsonKey(includeIfNull: false) final  int? year;
@override@JsonKey(name: "User-Agent", includeIfNull: false) final  String? userAgent;

/// Create a copy of SearchSubtitleQueryParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchSubtitleQueryParamsCopyWith<_SearchSubtitleQueryParams> get copyWith => __$SearchSubtitleQueryParamsCopyWithImpl<_SearchSubtitleQueryParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchSubtitleQueryParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchSubtitleQueryParams&&(identical(other.aiTranslated, aiTranslated) || other.aiTranslated == aiTranslated)&&(identical(other.episodeNumber, episodeNumber) || other.episodeNumber == episodeNumber)&&(identical(other.foreignPartsOnly, foreignPartsOnly) || other.foreignPartsOnly == foreignPartsOnly)&&(identical(other.hearingImpaired, hearingImpaired) || other.hearingImpaired == hearingImpaired)&&(identical(other.id, id) || other.id == id)&&(identical(other.imdbId, imdbId) || other.imdbId == imdbId)&&(identical(other.languages, languages) || other.languages == languages)&&(identical(other.machineTranslated, machineTranslated) || other.machineTranslated == machineTranslated)&&(identical(other.moviehash, moviehash) || other.moviehash == moviehash)&&(identical(other.movieHashMatch, movieHashMatch) || other.movieHashMatch == movieHashMatch)&&(identical(other.orderBy, orderBy) || other.orderBy == orderBy)&&(identical(other.orderDirection, orderDirection) || other.orderDirection == orderDirection)&&(identical(other.page, page) || other.page == page)&&(identical(other.parentFeatureId, parentFeatureId) || other.parentFeatureId == parentFeatureId)&&(identical(other.parentImdbId, parentImdbId) || other.parentImdbId == parentImdbId)&&(identical(other.parentTmdbId, parentTmdbId) || other.parentTmdbId == parentTmdbId)&&(identical(other.query, query) || other.query == query)&&(identical(other.seasonNumber, seasonNumber) || other.seasonNumber == seasonNumber)&&(identical(other.tmdbId, tmdbId) || other.tmdbId == tmdbId)&&(identical(other.trustedSources, trustedSources) || other.trustedSources == trustedSources)&&(identical(other.type, type) || other.type == type)&&(identical(other.uploaderId, uploaderId) || other.uploaderId == uploaderId)&&(identical(other.year, year) || other.year == year)&&(identical(other.userAgent, userAgent) || other.userAgent == userAgent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,aiTranslated,episodeNumber,foreignPartsOnly,hearingImpaired,id,imdbId,languages,machineTranslated,moviehash,movieHashMatch,orderBy,orderDirection,page,parentFeatureId,parentImdbId,parentTmdbId,query,seasonNumber,tmdbId,trustedSources,type,uploaderId,year,userAgent]);

@override
String toString() {
  return 'SearchSubtitleQueryParams(aiTranslated: $aiTranslated, episodeNumber: $episodeNumber, foreignPartsOnly: $foreignPartsOnly, hearingImpaired: $hearingImpaired, id: $id, imdbId: $imdbId, languages: $languages, machineTranslated: $machineTranslated, moviehash: $moviehash, movieHashMatch: $movieHashMatch, orderBy: $orderBy, orderDirection: $orderDirection, page: $page, parentFeatureId: $parentFeatureId, parentImdbId: $parentImdbId, parentTmdbId: $parentTmdbId, query: $query, seasonNumber: $seasonNumber, tmdbId: $tmdbId, trustedSources: $trustedSources, type: $type, uploaderId: $uploaderId, year: $year, userAgent: $userAgent)';
}


}

/// @nodoc
abstract mixin class _$SearchSubtitleQueryParamsCopyWith<$Res> implements $SearchSubtitleQueryParamsCopyWith<$Res> {
  factory _$SearchSubtitleQueryParamsCopyWith(_SearchSubtitleQueryParams value, $Res Function(_SearchSubtitleQueryParams) _then) = __$SearchSubtitleQueryParamsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "ai_translated", includeIfNull: false) String? aiTranslated,@JsonKey(name: "episode_number", includeIfNull: false) int? episodeNumber,@JsonKey(name: "foreign_parts_only", includeIfNull: false) String? foreignPartsOnly,@JsonKey(name: "hearing_impaired", includeIfNull: false) String? hearingImpaired,@JsonKey(name: "id", includeIfNull: false) int? id,@JsonKey(name: "imdb_id", includeIfNull: false) int? imdbId,@JsonKey(includeIfNull: false) String? languages,@JsonKey(name: "machine_translated", includeIfNull: false) String? machineTranslated,@JsonKey(includeIfNull: false) String? moviehash,@JsonKey(name: "movie_hash_match", includeIfNull: false) String? movieHashMatch,@JsonKey(name: "order_by", includeIfNull: false) String? orderBy,@JsonKey(name: "order_direction", includeIfNull: false) String? orderDirection, int page,@JsonKey(name: "parent_feature_id", includeIfNull: false) int? parentFeatureId,@JsonKey(name: "parent_imdb_id", includeIfNull: false) int? parentImdbId,@JsonKey(name: "parent_tmdb_id", includeIfNull: false) int? parentTmdbId,@JsonKey(includeIfNull: false) String? query,@JsonKey(name: "season_number", includeIfNull: false) int? seasonNumber,@JsonKey(name: "tmdb_id", includeIfNull: false) int? tmdbId,@JsonKey(name: "trusted_sources", includeIfNull: false) String? trustedSources,@JsonKey(includeIfNull: false) String? type,@JsonKey(name: "uploader_id", includeIfNull: false) int? uploaderId,@JsonKey(includeIfNull: false) int? year,@JsonKey(name: "User-Agent", includeIfNull: false) String? userAgent
});




}
/// @nodoc
class __$SearchSubtitleQueryParamsCopyWithImpl<$Res>
    implements _$SearchSubtitleQueryParamsCopyWith<$Res> {
  __$SearchSubtitleQueryParamsCopyWithImpl(this._self, this._then);

  final _SearchSubtitleQueryParams _self;
  final $Res Function(_SearchSubtitleQueryParams) _then;

/// Create a copy of SearchSubtitleQueryParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? aiTranslated = freezed,Object? episodeNumber = freezed,Object? foreignPartsOnly = freezed,Object? hearingImpaired = freezed,Object? id = freezed,Object? imdbId = freezed,Object? languages = freezed,Object? machineTranslated = freezed,Object? moviehash = freezed,Object? movieHashMatch = freezed,Object? orderBy = freezed,Object? orderDirection = freezed,Object? page = null,Object? parentFeatureId = freezed,Object? parentImdbId = freezed,Object? parentTmdbId = freezed,Object? query = freezed,Object? seasonNumber = freezed,Object? tmdbId = freezed,Object? trustedSources = freezed,Object? type = freezed,Object? uploaderId = freezed,Object? year = freezed,Object? userAgent = freezed,}) {
  return _then(_SearchSubtitleQueryParams(
aiTranslated: freezed == aiTranslated ? _self.aiTranslated : aiTranslated // ignore: cast_nullable_to_non_nullable
as String?,episodeNumber: freezed == episodeNumber ? _self.episodeNumber : episodeNumber // ignore: cast_nullable_to_non_nullable
as int?,foreignPartsOnly: freezed == foreignPartsOnly ? _self.foreignPartsOnly : foreignPartsOnly // ignore: cast_nullable_to_non_nullable
as String?,hearingImpaired: freezed == hearingImpaired ? _self.hearingImpaired : hearingImpaired // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,imdbId: freezed == imdbId ? _self.imdbId : imdbId // ignore: cast_nullable_to_non_nullable
as int?,languages: freezed == languages ? _self.languages : languages // ignore: cast_nullable_to_non_nullable
as String?,machineTranslated: freezed == machineTranslated ? _self.machineTranslated : machineTranslated // ignore: cast_nullable_to_non_nullable
as String?,moviehash: freezed == moviehash ? _self.moviehash : moviehash // ignore: cast_nullable_to_non_nullable
as String?,movieHashMatch: freezed == movieHashMatch ? _self.movieHashMatch : movieHashMatch // ignore: cast_nullable_to_non_nullable
as String?,orderBy: freezed == orderBy ? _self.orderBy : orderBy // ignore: cast_nullable_to_non_nullable
as String?,orderDirection: freezed == orderDirection ? _self.orderDirection : orderDirection // ignore: cast_nullable_to_non_nullable
as String?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,parentFeatureId: freezed == parentFeatureId ? _self.parentFeatureId : parentFeatureId // ignore: cast_nullable_to_non_nullable
as int?,parentImdbId: freezed == parentImdbId ? _self.parentImdbId : parentImdbId // ignore: cast_nullable_to_non_nullable
as int?,parentTmdbId: freezed == parentTmdbId ? _self.parentTmdbId : parentTmdbId // ignore: cast_nullable_to_non_nullable
as int?,query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String?,seasonNumber: freezed == seasonNumber ? _self.seasonNumber : seasonNumber // ignore: cast_nullable_to_non_nullable
as int?,tmdbId: freezed == tmdbId ? _self.tmdbId : tmdbId // ignore: cast_nullable_to_non_nullable
as int?,trustedSources: freezed == trustedSources ? _self.trustedSources : trustedSources // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,uploaderId: freezed == uploaderId ? _self.uploaderId : uploaderId // ignore: cast_nullable_to_non_nullable
as int?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,userAgent: freezed == userAgent ? _self.userAgent : userAgent // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
