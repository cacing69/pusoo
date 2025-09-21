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

part 'download_request_body.freezed.dart';
part 'download_request_body.g.dart';

@freezed
abstract class DownloadRequestBody with _$DownloadRequestBody {
    const factory DownloadRequestBody({
        @JsonKey(name: "file_id") required String fileId,
    }) = _DownloadRequestBody;

    factory DownloadRequestBody.fromJson(Map<String, dynamic> json) => _$DownloadRequestBodyFromJson(json);
}

