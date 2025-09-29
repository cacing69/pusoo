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

import 'package:pusoo/features/source/domain/entities/source.dart';
import 'package:pusoo/features/track/domain/models/track.dart';

final buddyChewChewXumoPlaylistGeneratorSource = Source(
  name: "BuddyChewChew/xumo-playlist-generator",
  isPublic: true,
  isEmpty: false,
  homepage: "https://github.com/BuddyChewChew/xumo-playlist-generator",
  description:
      "All streams are from a FREE publicly available source no DRM content. No login required and no commercials cut from streams. I would suggest visit Xumo or download the app for more content like (Movies Ondemand).",
  epgLink:
      "https://raw.githubusercontent.com/BuddyChewChew/xumo-playlist-generator/refs/heads/main/playlists/xumo_epg.xml.gz",
  tracks: [
    Track(
      title: "xumo_playlist.m3u",
      links: [
        "https://raw.githubusercontent.com/BuddyChewChew/xumo-playlist-generator/refs/heads/main/playlists/xumo_playlist.m3u",
      ],
    ),
  ],
);
