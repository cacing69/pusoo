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

class YoutubeIdExtractor {
  final String? videoId;
  final String? url;

  YoutubeIdExtractor({this.videoId, this.url});

  /// Factory constructor to extract YouTube video ID from URL
  factory YoutubeIdExtractor.fromUrl(String url) {
    final videoId = extract(url);
    return YoutubeIdExtractor(videoId: videoId, url: url);
  }

  static String? extract(String url) {
    String? videoId;
    RegExp regExp;

    // Regex for YouTube watch URLs (e.g., https://www.youtube.com/watch?v=dQw4w9WgXcQ)
    regExp = RegExp(
      r"^(?:https?:\/\/)?(?:www\.)?(?:m\.)?(?:youtube\.com|youtu\.be)\/(?:watch\?v=|embed\/|v\/|)([\w-]{11})(?:\S+)?$",
    );
    Match? match = regExp.firstMatch(url);
    if (match != null && match.groupCount >= 1) {
      videoId = match.group(1);
    }

    return videoId;
  }

  /// Checks if video ID was successfully extracted
  bool get hasVideoId => videoId != null && videoId!.isNotEmpty;
}
