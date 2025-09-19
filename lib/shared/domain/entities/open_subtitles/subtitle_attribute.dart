import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/attribute_feature_detail.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/attribute_file.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/attribute_related_link.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/attribute_uploader.dart';

part 'subtitle_attribute.g.dart';
part 'subtitle_attribute.freezed.dart';

@freezed
abstract class SubtitleAttribute with _$SubtitleAttribute {
  const factory SubtitleAttribute({
    @JsonKey(name: "subtitle_id") String? subtitleId,
    String? language,
    @JsonKey(name: "download_count") int? downloadCount,
    @JsonKey(name: "new_download_count") int? newDownloadCount,
    @JsonKey(name: "hearing_impaired") bool? hearingImpaired,
    bool? hd,
    int? fps,
    int? votes,
    int? ratings,
    @JsonKey(name: "from_trusted") bool? fromTrusted,
    @JsonKey(name: "foreign_parts_only") bool? foreignPartsOnly,
    @JsonKey(name: "upload_date") String? uploadDate,
    @JsonKey(name: "ai_translated") bool? aiTranslated,
    @JsonKey(name: "nb_cd") int? nbCd,
    String? slug,
    @JsonKey(name: "machine_translated") bool? machineTranslated,
    String? release,
    String? comments,
    @JsonKey(name: "legacy_subtitle_id") int? legacySubtitleId,
    @JsonKey(name: "legacy_uploader_id") int? legacyUploaderId,
    AttributeUploader? uploader,
    @JsonKey(name: "feature_details") AttributeFeatureDetail? featureDetails,
    String? url,
    @JsonKey(name: "related_links") List<AttributeRelatedLink>? relatedLinks,
    List<AttributeFile>? files,
  }) = _SubtitleAttribute;

  factory SubtitleAttribute.fromJson(Map<String, dynamic> json) =>
      _$SubtitleAttributeFromJson(json);
}
