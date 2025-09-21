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

// lib/core/configs/env.dart
import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env', obfuscate: true)
abstract class Env {
  @EnviedField(varName: 'TMDB_API_KEY')
  static String tmdbApiKey = _Env.tmdbApiKey;

  @EnviedField(varName: 'TMDB_READ_ACCESS_TOKEN')
  static String tmdbReadAccessToken = _Env.tmdbReadAccessToken;

  @EnviedField(varName: 'OPEN_SUBTITLES_API_KEY')
  static String openSubtitlesApiKey = _Env.openSubtitlesApiKey;

  @EnviedField(varName: 'OPEN_SUBTITLES_SHA1_MD5')
  static String openSubtitlesSha1Md5 = _Env.openSubtitlesSha1Md5;

  @EnviedField(varName: 'OPEN_SUBTITLES_SHA1_HASH')
  static String openSubtitlesSha1Hash = _Env.openSubtitlesSha1Hash;

  @EnviedField(varName: 'OPEN_SUBTITLES_BASE_URL')
  static String openSubtitlesBaseUrl = _Env.openSubtitlesBaseUrl;
}
