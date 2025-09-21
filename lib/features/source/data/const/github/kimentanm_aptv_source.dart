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

final kimentanmAptvSource = Source(
  name: "Kimentanm/aptv",
  isPublic: true,
  isEmpty: false,
  homepage: "https://github.com/Kimentanm/aptv",
  description: "A tool for playing m3u8 file",
  epgLink: "",
  tracks: [
    Track(
      title: "IPTV",
      links: [
        "https://cdn.jsdelivr.net/gh/hst1189/m3u/m3u/8_Kimentanm_aptv/iptv.m3u",
      ],
    ),
    Track(
      title: "Video",
      links: [
        "https://cdn.jsdelivr.net/gh/hst1189/m3u/m3u/8_Kimentanm_aptv/video.m3u",
      ],
    ),
    Track(
      title: "Radio",
      links: [
        "https://cdn.jsdelivr.net/gh/hst1189/m3u/m3u/8_Kimentanm_aptv/radio.m3u",
      ],
    ),
  ],
);
