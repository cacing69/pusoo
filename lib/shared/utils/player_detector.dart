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

enum PlayerType { betterPlayer, youtube, mediaKit }

class PlayerDetector {
  final String? url;
  final PlayerType? type;

  PlayerDetector({this.url, this.type});

  /// Factory constructor to detect player type from URL
  factory PlayerDetector.fromUrl(String url) {
    final playerType = _detectPlayerType(url);
    return PlayerDetector(url: url, type: playerType);
  }

  /// Detects the appropriate player type based on the URL
  static PlayerType _detectPlayerType(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null) return PlayerType.betterPlayer;

    final host = uri.host.toLowerCase();

    // YouTube detection
    if (host.contains('youtube.com') ||
        host.contains('youtu.be') ||
        host.contains('m.youtube.com')) {
      return PlayerType.youtube;
    }

    // Default to better player for all other URLs
    return PlayerType.betterPlayer;
  }

  /// Checks if the URL is a YouTube URL
  bool get isYouTube => type == PlayerType.youtube;

  /// Checks if the URL should use better player
  bool get isBetterPlayer => type == PlayerType.betterPlayer;

  /// Gets the YouTube video ID if it's a YouTube URL
  String? get youtubeVideoId {
    if (!isYouTube || url == null) return null;

    final uri = Uri.tryParse(url!);
    if (uri == null) return null;

    // Handle youtu.be format
    if (uri.host.contains('youtu.be')) {
      return uri.pathSegments.isNotEmpty ? uri.pathSegments.first : null;
    }

    // Handle youtube.com format
    if (uri.host.contains('youtube.com')) {
      return uri.queryParameters['v'];
    }

    return null;
  }

  /// Gets the clean YouTube URL for embedding
  String? get youtubeEmbedUrl {
    final videoId = youtubeVideoId;
    if (videoId == null) return null;

    return 'https://www.youtube.com/embed/$videoId';
  }

  @override
  String toString() {
    return 'PlayerDetector(url: $url, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PlayerDetector && other.url == url && other.type == type;
  }

  @override
  int get hashCode => url.hashCode ^ type.hashCode;
}
