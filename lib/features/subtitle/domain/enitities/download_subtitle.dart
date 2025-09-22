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


import 'package:freezed_annotation/freezed_annotation.dart';

part 'download_subtitle.freezed.dart';
part 'download_subtitle.g.dart';

@freezed
abstract class DownloadSubtitle with _$DownloadSubtitle {
    const factory DownloadSubtitle({
        String? link,
        @JsonKey(name: "file_name")
        String? fileName,
        int? requests,
        int? remaining,
        String? message,
        @JsonKey(name: "reset_time")
        String? resetTime,
        @JsonKey(name: "reset_time_utc")
        DateTime? resetTimeUtc,
    }) = _DownloadSubtitle;

    factory DownloadSubtitle.fromJson(Map<String, dynamic> json) => _$DownloadSubtitleFromJson(json);
}
