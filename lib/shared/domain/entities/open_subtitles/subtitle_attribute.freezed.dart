// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subtitle_attribute.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubtitleAttribute {

@JsonKey(name: "subtitle_id") String? get subtitleId; String? get language;@JsonKey(name: "download_count") int? get downloadCount;@JsonKey(name: "new_download_count") int? get newDownloadCount;@JsonKey(name: "hearing_impaired") bool? get hearingImpaired; bool? get hd; int? get fps; int? get votes; int? get ratings;@JsonKey(name: "from_trusted") bool? get fromTrusted;@JsonKey(name: "foreign_parts_only") bool? get foreignPartsOnly;@JsonKey(name: "upload_date") String? get uploadDate;@JsonKey(name: "ai_translated") bool? get aiTranslated;@JsonKey(name: "nb_cd") int? get nbCd; String? get slug;@JsonKey(name: "machine_translated") bool? get machineTranslated; String? get release; String? get comments;@JsonKey(name: "legacy_subtitle_id") int? get legacySubtitleId;@JsonKey(name: "legacy_uploader_id") int? get legacyUploaderId; AttributeUploader? get uploader;@JsonKey(name: "feature_details") List<AttributeFeatureDetail>? get featureDetails; String? get url;@JsonKey(name: "related_links") List<AttributeRelatedLink>? get relatedLinks; List<AttributeFile>? get files;
/// Create a copy of SubtitleAttribute
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubtitleAttributeCopyWith<SubtitleAttribute> get copyWith => _$SubtitleAttributeCopyWithImpl<SubtitleAttribute>(this as SubtitleAttribute, _$identity);

  /// Serializes this SubtitleAttribute to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubtitleAttribute&&(identical(other.subtitleId, subtitleId) || other.subtitleId == subtitleId)&&(identical(other.language, language) || other.language == language)&&(identical(other.downloadCount, downloadCount) || other.downloadCount == downloadCount)&&(identical(other.newDownloadCount, newDownloadCount) || other.newDownloadCount == newDownloadCount)&&(identical(other.hearingImpaired, hearingImpaired) || other.hearingImpaired == hearingImpaired)&&(identical(other.hd, hd) || other.hd == hd)&&(identical(other.fps, fps) || other.fps == fps)&&(identical(other.votes, votes) || other.votes == votes)&&(identical(other.ratings, ratings) || other.ratings == ratings)&&(identical(other.fromTrusted, fromTrusted) || other.fromTrusted == fromTrusted)&&(identical(other.foreignPartsOnly, foreignPartsOnly) || other.foreignPartsOnly == foreignPartsOnly)&&(identical(other.uploadDate, uploadDate) || other.uploadDate == uploadDate)&&(identical(other.aiTranslated, aiTranslated) || other.aiTranslated == aiTranslated)&&(identical(other.nbCd, nbCd) || other.nbCd == nbCd)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.machineTranslated, machineTranslated) || other.machineTranslated == machineTranslated)&&(identical(other.release, release) || other.release == release)&&(identical(other.comments, comments) || other.comments == comments)&&(identical(other.legacySubtitleId, legacySubtitleId) || other.legacySubtitleId == legacySubtitleId)&&(identical(other.legacyUploaderId, legacyUploaderId) || other.legacyUploaderId == legacyUploaderId)&&(identical(other.uploader, uploader) || other.uploader == uploader)&&const DeepCollectionEquality().equals(other.featureDetails, featureDetails)&&(identical(other.url, url) || other.url == url)&&const DeepCollectionEquality().equals(other.relatedLinks, relatedLinks)&&const DeepCollectionEquality().equals(other.files, files));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,subtitleId,language,downloadCount,newDownloadCount,hearingImpaired,hd,fps,votes,ratings,fromTrusted,foreignPartsOnly,uploadDate,aiTranslated,nbCd,slug,machineTranslated,release,comments,legacySubtitleId,legacyUploaderId,uploader,const DeepCollectionEquality().hash(featureDetails),url,const DeepCollectionEquality().hash(relatedLinks),const DeepCollectionEquality().hash(files)]);

@override
String toString() {
  return 'SubtitleAttribute(subtitleId: $subtitleId, language: $language, downloadCount: $downloadCount, newDownloadCount: $newDownloadCount, hearingImpaired: $hearingImpaired, hd: $hd, fps: $fps, votes: $votes, ratings: $ratings, fromTrusted: $fromTrusted, foreignPartsOnly: $foreignPartsOnly, uploadDate: $uploadDate, aiTranslated: $aiTranslated, nbCd: $nbCd, slug: $slug, machineTranslated: $machineTranslated, release: $release, comments: $comments, legacySubtitleId: $legacySubtitleId, legacyUploaderId: $legacyUploaderId, uploader: $uploader, featureDetails: $featureDetails, url: $url, relatedLinks: $relatedLinks, files: $files)';
}


}

/// @nodoc
abstract mixin class $SubtitleAttributeCopyWith<$Res>  {
  factory $SubtitleAttributeCopyWith(SubtitleAttribute value, $Res Function(SubtitleAttribute) _then) = _$SubtitleAttributeCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "subtitle_id") String? subtitleId, String? language,@JsonKey(name: "download_count") int? downloadCount,@JsonKey(name: "new_download_count") int? newDownloadCount,@JsonKey(name: "hearing_impaired") bool? hearingImpaired, bool? hd, int? fps, int? votes, int? ratings,@JsonKey(name: "from_trusted") bool? fromTrusted,@JsonKey(name: "foreign_parts_only") bool? foreignPartsOnly,@JsonKey(name: "upload_date") String? uploadDate,@JsonKey(name: "ai_translated") bool? aiTranslated,@JsonKey(name: "nb_cd") int? nbCd, String? slug,@JsonKey(name: "machine_translated") bool? machineTranslated, String? release, String? comments,@JsonKey(name: "legacy_subtitle_id") int? legacySubtitleId,@JsonKey(name: "legacy_uploader_id") int? legacyUploaderId, AttributeUploader? uploader,@JsonKey(name: "feature_details") List<AttributeFeatureDetail>? featureDetails, String? url,@JsonKey(name: "related_links") List<AttributeRelatedLink>? relatedLinks, List<AttributeFile>? files
});


$AttributeUploaderCopyWith<$Res>? get uploader;

}
/// @nodoc
class _$SubtitleAttributeCopyWithImpl<$Res>
    implements $SubtitleAttributeCopyWith<$Res> {
  _$SubtitleAttributeCopyWithImpl(this._self, this._then);

  final SubtitleAttribute _self;
  final $Res Function(SubtitleAttribute) _then;

/// Create a copy of SubtitleAttribute
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subtitleId = freezed,Object? language = freezed,Object? downloadCount = freezed,Object? newDownloadCount = freezed,Object? hearingImpaired = freezed,Object? hd = freezed,Object? fps = freezed,Object? votes = freezed,Object? ratings = freezed,Object? fromTrusted = freezed,Object? foreignPartsOnly = freezed,Object? uploadDate = freezed,Object? aiTranslated = freezed,Object? nbCd = freezed,Object? slug = freezed,Object? machineTranslated = freezed,Object? release = freezed,Object? comments = freezed,Object? legacySubtitleId = freezed,Object? legacyUploaderId = freezed,Object? uploader = freezed,Object? featureDetails = freezed,Object? url = freezed,Object? relatedLinks = freezed,Object? files = freezed,}) {
  return _then(_self.copyWith(
subtitleId: freezed == subtitleId ? _self.subtitleId : subtitleId // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,downloadCount: freezed == downloadCount ? _self.downloadCount : downloadCount // ignore: cast_nullable_to_non_nullable
as int?,newDownloadCount: freezed == newDownloadCount ? _self.newDownloadCount : newDownloadCount // ignore: cast_nullable_to_non_nullable
as int?,hearingImpaired: freezed == hearingImpaired ? _self.hearingImpaired : hearingImpaired // ignore: cast_nullable_to_non_nullable
as bool?,hd: freezed == hd ? _self.hd : hd // ignore: cast_nullable_to_non_nullable
as bool?,fps: freezed == fps ? _self.fps : fps // ignore: cast_nullable_to_non_nullable
as int?,votes: freezed == votes ? _self.votes : votes // ignore: cast_nullable_to_non_nullable
as int?,ratings: freezed == ratings ? _self.ratings : ratings // ignore: cast_nullable_to_non_nullable
as int?,fromTrusted: freezed == fromTrusted ? _self.fromTrusted : fromTrusted // ignore: cast_nullable_to_non_nullable
as bool?,foreignPartsOnly: freezed == foreignPartsOnly ? _self.foreignPartsOnly : foreignPartsOnly // ignore: cast_nullable_to_non_nullable
as bool?,uploadDate: freezed == uploadDate ? _self.uploadDate : uploadDate // ignore: cast_nullable_to_non_nullable
as String?,aiTranslated: freezed == aiTranslated ? _self.aiTranslated : aiTranslated // ignore: cast_nullable_to_non_nullable
as bool?,nbCd: freezed == nbCd ? _self.nbCd : nbCd // ignore: cast_nullable_to_non_nullable
as int?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,machineTranslated: freezed == machineTranslated ? _self.machineTranslated : machineTranslated // ignore: cast_nullable_to_non_nullable
as bool?,release: freezed == release ? _self.release : release // ignore: cast_nullable_to_non_nullable
as String?,comments: freezed == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as String?,legacySubtitleId: freezed == legacySubtitleId ? _self.legacySubtitleId : legacySubtitleId // ignore: cast_nullable_to_non_nullable
as int?,legacyUploaderId: freezed == legacyUploaderId ? _self.legacyUploaderId : legacyUploaderId // ignore: cast_nullable_to_non_nullable
as int?,uploader: freezed == uploader ? _self.uploader : uploader // ignore: cast_nullable_to_non_nullable
as AttributeUploader?,featureDetails: freezed == featureDetails ? _self.featureDetails : featureDetails // ignore: cast_nullable_to_non_nullable
as List<AttributeFeatureDetail>?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,relatedLinks: freezed == relatedLinks ? _self.relatedLinks : relatedLinks // ignore: cast_nullable_to_non_nullable
as List<AttributeRelatedLink>?,files: freezed == files ? _self.files : files // ignore: cast_nullable_to_non_nullable
as List<AttributeFile>?,
  ));
}
/// Create a copy of SubtitleAttribute
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttributeUploaderCopyWith<$Res>? get uploader {
    if (_self.uploader == null) {
    return null;
  }

  return $AttributeUploaderCopyWith<$Res>(_self.uploader!, (value) {
    return _then(_self.copyWith(uploader: value));
  });
}
}


/// Adds pattern-matching-related methods to [SubtitleAttribute].
extension SubtitleAttributePatterns on SubtitleAttribute {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubtitleAttribute value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubtitleAttribute() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubtitleAttribute value)  $default,){
final _that = this;
switch (_that) {
case _SubtitleAttribute():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubtitleAttribute value)?  $default,){
final _that = this;
switch (_that) {
case _SubtitleAttribute() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "subtitle_id")  String? subtitleId,  String? language, @JsonKey(name: "download_count")  int? downloadCount, @JsonKey(name: "new_download_count")  int? newDownloadCount, @JsonKey(name: "hearing_impaired")  bool? hearingImpaired,  bool? hd,  int? fps,  int? votes,  int? ratings, @JsonKey(name: "from_trusted")  bool? fromTrusted, @JsonKey(name: "foreign_parts_only")  bool? foreignPartsOnly, @JsonKey(name: "upload_date")  String? uploadDate, @JsonKey(name: "ai_translated")  bool? aiTranslated, @JsonKey(name: "nb_cd")  int? nbCd,  String? slug, @JsonKey(name: "machine_translated")  bool? machineTranslated,  String? release,  String? comments, @JsonKey(name: "legacy_subtitle_id")  int? legacySubtitleId, @JsonKey(name: "legacy_uploader_id")  int? legacyUploaderId,  AttributeUploader? uploader, @JsonKey(name: "feature_details")  List<AttributeFeatureDetail>? featureDetails,  String? url, @JsonKey(name: "related_links")  List<AttributeRelatedLink>? relatedLinks,  List<AttributeFile>? files)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubtitleAttribute() when $default != null:
return $default(_that.subtitleId,_that.language,_that.downloadCount,_that.newDownloadCount,_that.hearingImpaired,_that.hd,_that.fps,_that.votes,_that.ratings,_that.fromTrusted,_that.foreignPartsOnly,_that.uploadDate,_that.aiTranslated,_that.nbCd,_that.slug,_that.machineTranslated,_that.release,_that.comments,_that.legacySubtitleId,_that.legacyUploaderId,_that.uploader,_that.featureDetails,_that.url,_that.relatedLinks,_that.files);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "subtitle_id")  String? subtitleId,  String? language, @JsonKey(name: "download_count")  int? downloadCount, @JsonKey(name: "new_download_count")  int? newDownloadCount, @JsonKey(name: "hearing_impaired")  bool? hearingImpaired,  bool? hd,  int? fps,  int? votes,  int? ratings, @JsonKey(name: "from_trusted")  bool? fromTrusted, @JsonKey(name: "foreign_parts_only")  bool? foreignPartsOnly, @JsonKey(name: "upload_date")  String? uploadDate, @JsonKey(name: "ai_translated")  bool? aiTranslated, @JsonKey(name: "nb_cd")  int? nbCd,  String? slug, @JsonKey(name: "machine_translated")  bool? machineTranslated,  String? release,  String? comments, @JsonKey(name: "legacy_subtitle_id")  int? legacySubtitleId, @JsonKey(name: "legacy_uploader_id")  int? legacyUploaderId,  AttributeUploader? uploader, @JsonKey(name: "feature_details")  List<AttributeFeatureDetail>? featureDetails,  String? url, @JsonKey(name: "related_links")  List<AttributeRelatedLink>? relatedLinks,  List<AttributeFile>? files)  $default,) {final _that = this;
switch (_that) {
case _SubtitleAttribute():
return $default(_that.subtitleId,_that.language,_that.downloadCount,_that.newDownloadCount,_that.hearingImpaired,_that.hd,_that.fps,_that.votes,_that.ratings,_that.fromTrusted,_that.foreignPartsOnly,_that.uploadDate,_that.aiTranslated,_that.nbCd,_that.slug,_that.machineTranslated,_that.release,_that.comments,_that.legacySubtitleId,_that.legacyUploaderId,_that.uploader,_that.featureDetails,_that.url,_that.relatedLinks,_that.files);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "subtitle_id")  String? subtitleId,  String? language, @JsonKey(name: "download_count")  int? downloadCount, @JsonKey(name: "new_download_count")  int? newDownloadCount, @JsonKey(name: "hearing_impaired")  bool? hearingImpaired,  bool? hd,  int? fps,  int? votes,  int? ratings, @JsonKey(name: "from_trusted")  bool? fromTrusted, @JsonKey(name: "foreign_parts_only")  bool? foreignPartsOnly, @JsonKey(name: "upload_date")  String? uploadDate, @JsonKey(name: "ai_translated")  bool? aiTranslated, @JsonKey(name: "nb_cd")  int? nbCd,  String? slug, @JsonKey(name: "machine_translated")  bool? machineTranslated,  String? release,  String? comments, @JsonKey(name: "legacy_subtitle_id")  int? legacySubtitleId, @JsonKey(name: "legacy_uploader_id")  int? legacyUploaderId,  AttributeUploader? uploader, @JsonKey(name: "feature_details")  List<AttributeFeatureDetail>? featureDetails,  String? url, @JsonKey(name: "related_links")  List<AttributeRelatedLink>? relatedLinks,  List<AttributeFile>? files)?  $default,) {final _that = this;
switch (_that) {
case _SubtitleAttribute() when $default != null:
return $default(_that.subtitleId,_that.language,_that.downloadCount,_that.newDownloadCount,_that.hearingImpaired,_that.hd,_that.fps,_that.votes,_that.ratings,_that.fromTrusted,_that.foreignPartsOnly,_that.uploadDate,_that.aiTranslated,_that.nbCd,_that.slug,_that.machineTranslated,_that.release,_that.comments,_that.legacySubtitleId,_that.legacyUploaderId,_that.uploader,_that.featureDetails,_that.url,_that.relatedLinks,_that.files);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubtitleAttribute implements SubtitleAttribute {
  const _SubtitleAttribute({@JsonKey(name: "subtitle_id") this.subtitleId, this.language, @JsonKey(name: "download_count") this.downloadCount, @JsonKey(name: "new_download_count") this.newDownloadCount, @JsonKey(name: "hearing_impaired") this.hearingImpaired, this.hd, this.fps, this.votes, this.ratings, @JsonKey(name: "from_trusted") this.fromTrusted, @JsonKey(name: "foreign_parts_only") this.foreignPartsOnly, @JsonKey(name: "upload_date") this.uploadDate, @JsonKey(name: "ai_translated") this.aiTranslated, @JsonKey(name: "nb_cd") this.nbCd, this.slug, @JsonKey(name: "machine_translated") this.machineTranslated, this.release, this.comments, @JsonKey(name: "legacy_subtitle_id") this.legacySubtitleId, @JsonKey(name: "legacy_uploader_id") this.legacyUploaderId, this.uploader, @JsonKey(name: "feature_details") final  List<AttributeFeatureDetail>? featureDetails, this.url, @JsonKey(name: "related_links") final  List<AttributeRelatedLink>? relatedLinks, final  List<AttributeFile>? files}): _featureDetails = featureDetails,_relatedLinks = relatedLinks,_files = files;
  factory _SubtitleAttribute.fromJson(Map<String, dynamic> json) => _$SubtitleAttributeFromJson(json);

@override@JsonKey(name: "subtitle_id") final  String? subtitleId;
@override final  String? language;
@override@JsonKey(name: "download_count") final  int? downloadCount;
@override@JsonKey(name: "new_download_count") final  int? newDownloadCount;
@override@JsonKey(name: "hearing_impaired") final  bool? hearingImpaired;
@override final  bool? hd;
@override final  int? fps;
@override final  int? votes;
@override final  int? ratings;
@override@JsonKey(name: "from_trusted") final  bool? fromTrusted;
@override@JsonKey(name: "foreign_parts_only") final  bool? foreignPartsOnly;
@override@JsonKey(name: "upload_date") final  String? uploadDate;
@override@JsonKey(name: "ai_translated") final  bool? aiTranslated;
@override@JsonKey(name: "nb_cd") final  int? nbCd;
@override final  String? slug;
@override@JsonKey(name: "machine_translated") final  bool? machineTranslated;
@override final  String? release;
@override final  String? comments;
@override@JsonKey(name: "legacy_subtitle_id") final  int? legacySubtitleId;
@override@JsonKey(name: "legacy_uploader_id") final  int? legacyUploaderId;
@override final  AttributeUploader? uploader;
 final  List<AttributeFeatureDetail>? _featureDetails;
@override@JsonKey(name: "feature_details") List<AttributeFeatureDetail>? get featureDetails {
  final value = _featureDetails;
  if (value == null) return null;
  if (_featureDetails is EqualUnmodifiableListView) return _featureDetails;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? url;
 final  List<AttributeRelatedLink>? _relatedLinks;
@override@JsonKey(name: "related_links") List<AttributeRelatedLink>? get relatedLinks {
  final value = _relatedLinks;
  if (value == null) return null;
  if (_relatedLinks is EqualUnmodifiableListView) return _relatedLinks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<AttributeFile>? _files;
@override List<AttributeFile>? get files {
  final value = _files;
  if (value == null) return null;
  if (_files is EqualUnmodifiableListView) return _files;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of SubtitleAttribute
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubtitleAttributeCopyWith<_SubtitleAttribute> get copyWith => __$SubtitleAttributeCopyWithImpl<_SubtitleAttribute>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubtitleAttributeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubtitleAttribute&&(identical(other.subtitleId, subtitleId) || other.subtitleId == subtitleId)&&(identical(other.language, language) || other.language == language)&&(identical(other.downloadCount, downloadCount) || other.downloadCount == downloadCount)&&(identical(other.newDownloadCount, newDownloadCount) || other.newDownloadCount == newDownloadCount)&&(identical(other.hearingImpaired, hearingImpaired) || other.hearingImpaired == hearingImpaired)&&(identical(other.hd, hd) || other.hd == hd)&&(identical(other.fps, fps) || other.fps == fps)&&(identical(other.votes, votes) || other.votes == votes)&&(identical(other.ratings, ratings) || other.ratings == ratings)&&(identical(other.fromTrusted, fromTrusted) || other.fromTrusted == fromTrusted)&&(identical(other.foreignPartsOnly, foreignPartsOnly) || other.foreignPartsOnly == foreignPartsOnly)&&(identical(other.uploadDate, uploadDate) || other.uploadDate == uploadDate)&&(identical(other.aiTranslated, aiTranslated) || other.aiTranslated == aiTranslated)&&(identical(other.nbCd, nbCd) || other.nbCd == nbCd)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.machineTranslated, machineTranslated) || other.machineTranslated == machineTranslated)&&(identical(other.release, release) || other.release == release)&&(identical(other.comments, comments) || other.comments == comments)&&(identical(other.legacySubtitleId, legacySubtitleId) || other.legacySubtitleId == legacySubtitleId)&&(identical(other.legacyUploaderId, legacyUploaderId) || other.legacyUploaderId == legacyUploaderId)&&(identical(other.uploader, uploader) || other.uploader == uploader)&&const DeepCollectionEquality().equals(other._featureDetails, _featureDetails)&&(identical(other.url, url) || other.url == url)&&const DeepCollectionEquality().equals(other._relatedLinks, _relatedLinks)&&const DeepCollectionEquality().equals(other._files, _files));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,subtitleId,language,downloadCount,newDownloadCount,hearingImpaired,hd,fps,votes,ratings,fromTrusted,foreignPartsOnly,uploadDate,aiTranslated,nbCd,slug,machineTranslated,release,comments,legacySubtitleId,legacyUploaderId,uploader,const DeepCollectionEquality().hash(_featureDetails),url,const DeepCollectionEquality().hash(_relatedLinks),const DeepCollectionEquality().hash(_files)]);

@override
String toString() {
  return 'SubtitleAttribute(subtitleId: $subtitleId, language: $language, downloadCount: $downloadCount, newDownloadCount: $newDownloadCount, hearingImpaired: $hearingImpaired, hd: $hd, fps: $fps, votes: $votes, ratings: $ratings, fromTrusted: $fromTrusted, foreignPartsOnly: $foreignPartsOnly, uploadDate: $uploadDate, aiTranslated: $aiTranslated, nbCd: $nbCd, slug: $slug, machineTranslated: $machineTranslated, release: $release, comments: $comments, legacySubtitleId: $legacySubtitleId, legacyUploaderId: $legacyUploaderId, uploader: $uploader, featureDetails: $featureDetails, url: $url, relatedLinks: $relatedLinks, files: $files)';
}


}

/// @nodoc
abstract mixin class _$SubtitleAttributeCopyWith<$Res> implements $SubtitleAttributeCopyWith<$Res> {
  factory _$SubtitleAttributeCopyWith(_SubtitleAttribute value, $Res Function(_SubtitleAttribute) _then) = __$SubtitleAttributeCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "subtitle_id") String? subtitleId, String? language,@JsonKey(name: "download_count") int? downloadCount,@JsonKey(name: "new_download_count") int? newDownloadCount,@JsonKey(name: "hearing_impaired") bool? hearingImpaired, bool? hd, int? fps, int? votes, int? ratings,@JsonKey(name: "from_trusted") bool? fromTrusted,@JsonKey(name: "foreign_parts_only") bool? foreignPartsOnly,@JsonKey(name: "upload_date") String? uploadDate,@JsonKey(name: "ai_translated") bool? aiTranslated,@JsonKey(name: "nb_cd") int? nbCd, String? slug,@JsonKey(name: "machine_translated") bool? machineTranslated, String? release, String? comments,@JsonKey(name: "legacy_subtitle_id") int? legacySubtitleId,@JsonKey(name: "legacy_uploader_id") int? legacyUploaderId, AttributeUploader? uploader,@JsonKey(name: "feature_details") List<AttributeFeatureDetail>? featureDetails, String? url,@JsonKey(name: "related_links") List<AttributeRelatedLink>? relatedLinks, List<AttributeFile>? files
});


@override $AttributeUploaderCopyWith<$Res>? get uploader;

}
/// @nodoc
class __$SubtitleAttributeCopyWithImpl<$Res>
    implements _$SubtitleAttributeCopyWith<$Res> {
  __$SubtitleAttributeCopyWithImpl(this._self, this._then);

  final _SubtitleAttribute _self;
  final $Res Function(_SubtitleAttribute) _then;

/// Create a copy of SubtitleAttribute
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subtitleId = freezed,Object? language = freezed,Object? downloadCount = freezed,Object? newDownloadCount = freezed,Object? hearingImpaired = freezed,Object? hd = freezed,Object? fps = freezed,Object? votes = freezed,Object? ratings = freezed,Object? fromTrusted = freezed,Object? foreignPartsOnly = freezed,Object? uploadDate = freezed,Object? aiTranslated = freezed,Object? nbCd = freezed,Object? slug = freezed,Object? machineTranslated = freezed,Object? release = freezed,Object? comments = freezed,Object? legacySubtitleId = freezed,Object? legacyUploaderId = freezed,Object? uploader = freezed,Object? featureDetails = freezed,Object? url = freezed,Object? relatedLinks = freezed,Object? files = freezed,}) {
  return _then(_SubtitleAttribute(
subtitleId: freezed == subtitleId ? _self.subtitleId : subtitleId // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,downloadCount: freezed == downloadCount ? _self.downloadCount : downloadCount // ignore: cast_nullable_to_non_nullable
as int?,newDownloadCount: freezed == newDownloadCount ? _self.newDownloadCount : newDownloadCount // ignore: cast_nullable_to_non_nullable
as int?,hearingImpaired: freezed == hearingImpaired ? _self.hearingImpaired : hearingImpaired // ignore: cast_nullable_to_non_nullable
as bool?,hd: freezed == hd ? _self.hd : hd // ignore: cast_nullable_to_non_nullable
as bool?,fps: freezed == fps ? _self.fps : fps // ignore: cast_nullable_to_non_nullable
as int?,votes: freezed == votes ? _self.votes : votes // ignore: cast_nullable_to_non_nullable
as int?,ratings: freezed == ratings ? _self.ratings : ratings // ignore: cast_nullable_to_non_nullable
as int?,fromTrusted: freezed == fromTrusted ? _self.fromTrusted : fromTrusted // ignore: cast_nullable_to_non_nullable
as bool?,foreignPartsOnly: freezed == foreignPartsOnly ? _self.foreignPartsOnly : foreignPartsOnly // ignore: cast_nullable_to_non_nullable
as bool?,uploadDate: freezed == uploadDate ? _self.uploadDate : uploadDate // ignore: cast_nullable_to_non_nullable
as String?,aiTranslated: freezed == aiTranslated ? _self.aiTranslated : aiTranslated // ignore: cast_nullable_to_non_nullable
as bool?,nbCd: freezed == nbCd ? _self.nbCd : nbCd // ignore: cast_nullable_to_non_nullable
as int?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,machineTranslated: freezed == machineTranslated ? _self.machineTranslated : machineTranslated // ignore: cast_nullable_to_non_nullable
as bool?,release: freezed == release ? _self.release : release // ignore: cast_nullable_to_non_nullable
as String?,comments: freezed == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as String?,legacySubtitleId: freezed == legacySubtitleId ? _self.legacySubtitleId : legacySubtitleId // ignore: cast_nullable_to_non_nullable
as int?,legacyUploaderId: freezed == legacyUploaderId ? _self.legacyUploaderId : legacyUploaderId // ignore: cast_nullable_to_non_nullable
as int?,uploader: freezed == uploader ? _self.uploader : uploader // ignore: cast_nullable_to_non_nullable
as AttributeUploader?,featureDetails: freezed == featureDetails ? _self._featureDetails : featureDetails // ignore: cast_nullable_to_non_nullable
as List<AttributeFeatureDetail>?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,relatedLinks: freezed == relatedLinks ? _self._relatedLinks : relatedLinks // ignore: cast_nullable_to_non_nullable
as List<AttributeRelatedLink>?,files: freezed == files ? _self._files : files // ignore: cast_nullable_to_non_nullable
as List<AttributeFile>?,
  ));
}

/// Create a copy of SubtitleAttribute
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttributeUploaderCopyWith<$Res>? get uploader {
    if (_self.uploader == null) {
    return null;
  }

  return $AttributeUploaderCopyWith<$Res>(_self.uploader!, (value) {
    return _then(_self.copyWith(uploader: value));
  });
}
}

// dart format on
