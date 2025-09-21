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
