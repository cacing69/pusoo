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

part of 'subtitle_attribute.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubtitleAttribute _$SubtitleAttributeFromJson(Map<String, dynamic> json) =>
    _SubtitleAttribute(
      subtitleId: json['subtitle_id'] as String?,
      language: json['language'] as String?,
      downloadCount: (json['download_count'] as num?)?.toInt(),
      newDownloadCount: (json['new_download_count'] as num?)?.toInt(),
      hearingImpaired: json['hearing_impaired'] as bool?,
      hd: json['hd'] as bool?,
      fps: (json['fps'] as num?)?.toInt(),
      votes: (json['votes'] as num?)?.toInt(),
      ratings: (json['ratings'] as num?)?.toInt(),
      fromTrusted: json['from_trusted'] as bool?,
      foreignPartsOnly: json['foreign_parts_only'] as bool?,
      uploadDate: json['upload_date'] as String?,
      aiTranslated: json['ai_translated'] as bool?,
      nbCd: (json['nb_cd'] as num?)?.toInt(),
      slug: json['slug'] as String?,
      machineTranslated: json['machine_translated'] as bool?,
      release: json['release'] as String?,
      comments: json['comments'] as String?,
      legacySubtitleId: (json['legacy_subtitle_id'] as num?)?.toInt(),
      legacyUploaderId: (json['legacy_uploader_id'] as num?)?.toInt(),
      uploader: json['uploader'] == null
          ? null
          : AttributeUploader.fromJson(
              json['uploader'] as Map<String, dynamic>,
            ),
      featureDetails: json['feature_details'] == null
          ? null
          : AttributeFeatureDetail.fromJson(
              json['feature_details'] as Map<String, dynamic>,
            ),
      url: json['url'] as String?,
      relatedLinks: (json['related_links'] as List<dynamic>?)
          ?.map((e) => AttributeRelatedLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      files: (json['files'] as List<dynamic>?)
          ?.map((e) => AttributeFile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubtitleAttributeToJson(_SubtitleAttribute instance) =>
    <String, dynamic>{
      'subtitle_id': instance.subtitleId,
      'language': instance.language,
      'download_count': instance.downloadCount,
      'new_download_count': instance.newDownloadCount,
      'hearing_impaired': instance.hearingImpaired,
      'hd': instance.hd,
      'fps': instance.fps,
      'votes': instance.votes,
      'ratings': instance.ratings,
      'from_trusted': instance.fromTrusted,
      'foreign_parts_only': instance.foreignPartsOnly,
      'upload_date': instance.uploadDate,
      'ai_translated': instance.aiTranslated,
      'nb_cd': instance.nbCd,
      'slug': instance.slug,
      'machine_translated': instance.machineTranslated,
      'release': instance.release,
      'comments': instance.comments,
      'legacy_subtitle_id': instance.legacySubtitleId,
      'legacy_uploader_id': instance.legacyUploaderId,
      'uploader': instance.uploader,
      'feature_details': instance.featureDetails,
      'url': instance.url,
      'related_links': instance.relatedLinks,
      'files': instance.files,
    };
