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

class PlaylistNameExtractor {
  final String? url;
  final String? name;

  PlaylistNameExtractor({this.url, this.name});

  factory PlaylistNameExtractor.fromUrl(String url) {
    // Extract filename from URL
    String? extractedName;

    try {
      final uri = Uri.parse(url);
      final pathSegments = uri.pathSegments;

      if (pathSegments.isNotEmpty) {
        final lastSegment = pathSegments.last;
        // Clean up the filename by removing special characters at the beginning and end
        String cleanedSegment = lastSegment;

        // Remove special characters from the beginning (keep only alphanumeric)
        cleanedSegment = cleanedSegment.replaceAll(
          RegExp(r'^[^a-zA-Z0-9]+'),
          '',
        );

        // Remove special characters from the end (but keep the last dot if it's part of extension)
        if (cleanedSegment.contains('.')) {
          final parts = cleanedSegment.split('.');
          if (parts.length > 1) {
            final extension = parts.last;
            final nameWithoutExt = parts.sublist(0, parts.length - 1).join('.');
            // Clean the name part, keeping only alphanumeric
            final cleanedName = nameWithoutExt.replaceAll(
              RegExp(r'[^a-zA-Z0-9]+'),
              '',
            );
            cleanedSegment = '$cleanedName.$extension';
          } else {
            cleanedSegment = cleanedSegment.replaceAll(
              RegExp(r'[^a-zA-Z0-9]+$'),
              '',
            );
          }
        } else {
          cleanedSegment = cleanedSegment.replaceAll(
            RegExp(r'[^a-zA-Z0-9]+$'),
            '',
          );
        }

        // Check if it's a valid filename with extension
        if (cleanedSegment.contains('.') && cleanedSegment.length > 1) {
          extractedName = cleanedSegment;
        } else if (cleanedSegment.isNotEmpty) {
          // If no extension, add .m3u as default
          extractedName = '$cleanedSegment.m3u';
        }
      }

      // If no valid filename found, try to extract from query parameters
      if (extractedName == null) {
        final queryParams = uri.queryParameters;
        if (queryParams.containsKey('file')) {
          extractedName = queryParams['file'];
        } else if (queryParams.containsKey('name')) {
          extractedName = queryParams['name'];
        }
      }

      // If still no name found, generate a default name
      if (extractedName == null) {
        final host = uri.host;
        if (host.isNotEmpty) {
          extractedName = 'playlist_${host.replaceAll('.', '_')}.m3u';
        } else {
          extractedName = 'playlist.m3u';
        }
      }
    } catch (e) {
      // If URL parsing fails, use a default name
      extractedName = 'playlist.m3u';
    }

    return PlaylistNameExtractor(url: url, name: extractedName);
  }
}
