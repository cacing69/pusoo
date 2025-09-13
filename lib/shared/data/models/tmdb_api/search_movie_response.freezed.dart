// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_movie_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchMovieResponse {

 bool? get adult;@JsonKey(name: 'backdrop_path') String? get backdropPath; int? get budget;@JsonKey(name: 'genre_ids') List<int>? get genreIds; int? get id;@JsonKey(name: 'original_language') String? get originalLanguage;@JsonKey(name: 'original_title') String? get originalTitle; String? get overview; double? get popularity;@JsonKey(name: 'poster_path') String? get posterPath;@JsonKey(name: 'release_date') String? get releaseDate; String? get title; bool? get video;@JsonKey(name: 'vote_average') double? get voteAverage;@JsonKey(name: 'vote_count') int? get voteCount;
/// Create a copy of SearchMovieResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchMovieResponseCopyWith<SearchMovieResponse> get copyWith => _$SearchMovieResponseCopyWithImpl<SearchMovieResponse>(this as SearchMovieResponse, _$identity);

  /// Serializes this SearchMovieResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchMovieResponse&&(identical(other.adult, adult) || other.adult == adult)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&(identical(other.budget, budget) || other.budget == budget)&&const DeepCollectionEquality().equals(other.genreIds, genreIds)&&(identical(other.id, id) || other.id == id)&&(identical(other.originalLanguage, originalLanguage) || other.originalLanguage == originalLanguage)&&(identical(other.originalTitle, originalTitle) || other.originalTitle == originalTitle)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.title, title) || other.title == title)&&(identical(other.video, video) || other.video == video)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&(identical(other.voteCount, voteCount) || other.voteCount == voteCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,adult,backdropPath,budget,const DeepCollectionEquality().hash(genreIds),id,originalLanguage,originalTitle,overview,popularity,posterPath,releaseDate,title,video,voteAverage,voteCount);

@override
String toString() {
  return 'SearchMovieResponse(adult: $adult, backdropPath: $backdropPath, budget: $budget, genreIds: $genreIds, id: $id, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount)';
}


}

/// @nodoc
abstract mixin class $SearchMovieResponseCopyWith<$Res>  {
  factory $SearchMovieResponseCopyWith(SearchMovieResponse value, $Res Function(SearchMovieResponse) _then) = _$SearchMovieResponseCopyWithImpl;
@useResult
$Res call({
 bool? adult,@JsonKey(name: 'backdrop_path') String? backdropPath, int? budget,@JsonKey(name: 'genre_ids') List<int>? genreIds, int? id,@JsonKey(name: 'original_language') String? originalLanguage,@JsonKey(name: 'original_title') String? originalTitle, String? overview, double? popularity,@JsonKey(name: 'poster_path') String? posterPath,@JsonKey(name: 'release_date') String? releaseDate, String? title, bool? video,@JsonKey(name: 'vote_average') double? voteAverage,@JsonKey(name: 'vote_count') int? voteCount
});




}
/// @nodoc
class _$SearchMovieResponseCopyWithImpl<$Res>
    implements $SearchMovieResponseCopyWith<$Res> {
  _$SearchMovieResponseCopyWithImpl(this._self, this._then);

  final SearchMovieResponse _self;
  final $Res Function(SearchMovieResponse) _then;

/// Create a copy of SearchMovieResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? adult = freezed,Object? backdropPath = freezed,Object? budget = freezed,Object? genreIds = freezed,Object? id = freezed,Object? originalLanguage = freezed,Object? originalTitle = freezed,Object? overview = freezed,Object? popularity = freezed,Object? posterPath = freezed,Object? releaseDate = freezed,Object? title = freezed,Object? video = freezed,Object? voteAverage = freezed,Object? voteCount = freezed,}) {
  return _then(_self.copyWith(
adult: freezed == adult ? _self.adult : adult // ignore: cast_nullable_to_non_nullable
as bool?,backdropPath: freezed == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String?,budget: freezed == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int?,genreIds: freezed == genreIds ? _self.genreIds : genreIds // ignore: cast_nullable_to_non_nullable
as List<int>?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,originalLanguage: freezed == originalLanguage ? _self.originalLanguage : originalLanguage // ignore: cast_nullable_to_non_nullable
as String?,originalTitle: freezed == originalTitle ? _self.originalTitle : originalTitle // ignore: cast_nullable_to_non_nullable
as String?,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,popularity: freezed == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as double?,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,video: freezed == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as bool?,voteAverage: freezed == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double?,voteCount: freezed == voteCount ? _self.voteCount : voteCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchMovieResponse].
extension SearchMovieResponsePatterns on SearchMovieResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchMovieResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchMovieResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchMovieResponse value)  $default,){
final _that = this;
switch (_that) {
case _SearchMovieResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchMovieResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SearchMovieResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? adult, @JsonKey(name: 'backdrop_path')  String? backdropPath,  int? budget, @JsonKey(name: 'genre_ids')  List<int>? genreIds,  int? id, @JsonKey(name: 'original_language')  String? originalLanguage, @JsonKey(name: 'original_title')  String? originalTitle,  String? overview,  double? popularity, @JsonKey(name: 'poster_path')  String? posterPath, @JsonKey(name: 'release_date')  String? releaseDate,  String? title,  bool? video, @JsonKey(name: 'vote_average')  double? voteAverage, @JsonKey(name: 'vote_count')  int? voteCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchMovieResponse() when $default != null:
return $default(_that.adult,_that.backdropPath,_that.budget,_that.genreIds,_that.id,_that.originalLanguage,_that.originalTitle,_that.overview,_that.popularity,_that.posterPath,_that.releaseDate,_that.title,_that.video,_that.voteAverage,_that.voteCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? adult, @JsonKey(name: 'backdrop_path')  String? backdropPath,  int? budget, @JsonKey(name: 'genre_ids')  List<int>? genreIds,  int? id, @JsonKey(name: 'original_language')  String? originalLanguage, @JsonKey(name: 'original_title')  String? originalTitle,  String? overview,  double? popularity, @JsonKey(name: 'poster_path')  String? posterPath, @JsonKey(name: 'release_date')  String? releaseDate,  String? title,  bool? video, @JsonKey(name: 'vote_average')  double? voteAverage, @JsonKey(name: 'vote_count')  int? voteCount)  $default,) {final _that = this;
switch (_that) {
case _SearchMovieResponse():
return $default(_that.adult,_that.backdropPath,_that.budget,_that.genreIds,_that.id,_that.originalLanguage,_that.originalTitle,_that.overview,_that.popularity,_that.posterPath,_that.releaseDate,_that.title,_that.video,_that.voteAverage,_that.voteCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? adult, @JsonKey(name: 'backdrop_path')  String? backdropPath,  int? budget, @JsonKey(name: 'genre_ids')  List<int>? genreIds,  int? id, @JsonKey(name: 'original_language')  String? originalLanguage, @JsonKey(name: 'original_title')  String? originalTitle,  String? overview,  double? popularity, @JsonKey(name: 'poster_path')  String? posterPath, @JsonKey(name: 'release_date')  String? releaseDate,  String? title,  bool? video, @JsonKey(name: 'vote_average')  double? voteAverage, @JsonKey(name: 'vote_count')  int? voteCount)?  $default,) {final _that = this;
switch (_that) {
case _SearchMovieResponse() when $default != null:
return $default(_that.adult,_that.backdropPath,_that.budget,_that.genreIds,_that.id,_that.originalLanguage,_that.originalTitle,_that.overview,_that.popularity,_that.posterPath,_that.releaseDate,_that.title,_that.video,_that.voteAverage,_that.voteCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchMovieResponse implements SearchMovieResponse {
  const _SearchMovieResponse({this.adult = null, @JsonKey(name: 'backdrop_path') this.backdropPath = null, this.budget = null, @JsonKey(name: 'genre_ids') final  List<int>? genreIds = null, this.id = null, @JsonKey(name: 'original_language') this.originalLanguage = null, @JsonKey(name: 'original_title') this.originalTitle = null, this.overview = null, this.popularity = null, @JsonKey(name: 'poster_path') this.posterPath = null, @JsonKey(name: 'release_date') this.releaseDate = null, this.title = null, this.video = null, @JsonKey(name: 'vote_average') this.voteAverage = null, @JsonKey(name: 'vote_count') this.voteCount = null}): _genreIds = genreIds;
  factory _SearchMovieResponse.fromJson(Map<String, dynamic> json) => _$SearchMovieResponseFromJson(json);

@override@JsonKey() final  bool? adult;
@override@JsonKey(name: 'backdrop_path') final  String? backdropPath;
@override@JsonKey() final  int? budget;
 final  List<int>? _genreIds;
@override@JsonKey(name: 'genre_ids') List<int>? get genreIds {
  final value = _genreIds;
  if (value == null) return null;
  if (_genreIds is EqualUnmodifiableListView) return _genreIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey() final  int? id;
@override@JsonKey(name: 'original_language') final  String? originalLanguage;
@override@JsonKey(name: 'original_title') final  String? originalTitle;
@override@JsonKey() final  String? overview;
@override@JsonKey() final  double? popularity;
@override@JsonKey(name: 'poster_path') final  String? posterPath;
@override@JsonKey(name: 'release_date') final  String? releaseDate;
@override@JsonKey() final  String? title;
@override@JsonKey() final  bool? video;
@override@JsonKey(name: 'vote_average') final  double? voteAverage;
@override@JsonKey(name: 'vote_count') final  int? voteCount;

/// Create a copy of SearchMovieResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchMovieResponseCopyWith<_SearchMovieResponse> get copyWith => __$SearchMovieResponseCopyWithImpl<_SearchMovieResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchMovieResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchMovieResponse&&(identical(other.adult, adult) || other.adult == adult)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&(identical(other.budget, budget) || other.budget == budget)&&const DeepCollectionEquality().equals(other._genreIds, _genreIds)&&(identical(other.id, id) || other.id == id)&&(identical(other.originalLanguage, originalLanguage) || other.originalLanguage == originalLanguage)&&(identical(other.originalTitle, originalTitle) || other.originalTitle == originalTitle)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.title, title) || other.title == title)&&(identical(other.video, video) || other.video == video)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&(identical(other.voteCount, voteCount) || other.voteCount == voteCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,adult,backdropPath,budget,const DeepCollectionEquality().hash(_genreIds),id,originalLanguage,originalTitle,overview,popularity,posterPath,releaseDate,title,video,voteAverage,voteCount);

@override
String toString() {
  return 'SearchMovieResponse(adult: $adult, backdropPath: $backdropPath, budget: $budget, genreIds: $genreIds, id: $id, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount)';
}


}

/// @nodoc
abstract mixin class _$SearchMovieResponseCopyWith<$Res> implements $SearchMovieResponseCopyWith<$Res> {
  factory _$SearchMovieResponseCopyWith(_SearchMovieResponse value, $Res Function(_SearchMovieResponse) _then) = __$SearchMovieResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? adult,@JsonKey(name: 'backdrop_path') String? backdropPath, int? budget,@JsonKey(name: 'genre_ids') List<int>? genreIds, int? id,@JsonKey(name: 'original_language') String? originalLanguage,@JsonKey(name: 'original_title') String? originalTitle, String? overview, double? popularity,@JsonKey(name: 'poster_path') String? posterPath,@JsonKey(name: 'release_date') String? releaseDate, String? title, bool? video,@JsonKey(name: 'vote_average') double? voteAverage,@JsonKey(name: 'vote_count') int? voteCount
});




}
/// @nodoc
class __$SearchMovieResponseCopyWithImpl<$Res>
    implements _$SearchMovieResponseCopyWith<$Res> {
  __$SearchMovieResponseCopyWithImpl(this._self, this._then);

  final _SearchMovieResponse _self;
  final $Res Function(_SearchMovieResponse) _then;

/// Create a copy of SearchMovieResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? adult = freezed,Object? backdropPath = freezed,Object? budget = freezed,Object? genreIds = freezed,Object? id = freezed,Object? originalLanguage = freezed,Object? originalTitle = freezed,Object? overview = freezed,Object? popularity = freezed,Object? posterPath = freezed,Object? releaseDate = freezed,Object? title = freezed,Object? video = freezed,Object? voteAverage = freezed,Object? voteCount = freezed,}) {
  return _then(_SearchMovieResponse(
adult: freezed == adult ? _self.adult : adult // ignore: cast_nullable_to_non_nullable
as bool?,backdropPath: freezed == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String?,budget: freezed == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int?,genreIds: freezed == genreIds ? _self._genreIds : genreIds // ignore: cast_nullable_to_non_nullable
as List<int>?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,originalLanguage: freezed == originalLanguage ? _self.originalLanguage : originalLanguage // ignore: cast_nullable_to_non_nullable
as String?,originalTitle: freezed == originalTitle ? _self.originalTitle : originalTitle // ignore: cast_nullable_to_non_nullable
as String?,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,popularity: freezed == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as double?,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,video: freezed == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as bool?,voteAverage: freezed == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double?,voteCount: freezed == voteCount ? _self.voteCount : voteCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
