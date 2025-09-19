// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_subtitle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DownloadSubtitle _$DownloadSubtitleFromJson(Map<String, dynamic> json) =>
    _DownloadSubtitle(
      link: json['link'] as String?,
      fileName: json['file_name'] as String?,
      requests: (json['requests'] as num?)?.toInt(),
      remaining: (json['remaining'] as num?)?.toInt(),
      message: json['message'] as String?,
      resetTime: json['reset_time'] as String?,
      resetTimeUtc: json['reset_time_utc'] == null
          ? null
          : DateTime.parse(json['reset_time_utc'] as String),
    );

Map<String, dynamic> _$DownloadSubtitleToJson(_DownloadSubtitle instance) =>
    <String, dynamic>{
      'link': instance.link,
      'file_name': instance.fileName,
      'requests': instance.requests,
      'remaining': instance.remaining,
      'message': instance.message,
      'reset_time': instance.resetTime,
      'reset_time_utc': instance.resetTimeUtc?.toIso8601String(),
    };
