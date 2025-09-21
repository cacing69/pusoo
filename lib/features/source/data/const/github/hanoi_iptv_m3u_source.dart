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

final haNoiIPTVHaNoiIPTVM3uSource = Source(
  name: "HaNoiIPTV/HaNoiIPTV.m3u",
  isPublic: true,
  isEmpty: false,
  homepage: "https://github.com/HaNoiIPTV/HaNoiIPTV.m3u",
  description: "Dịch vụ IPTV thế hệ mới hàng đầu quốc gia",
  epgLink:
      "https://raw.githubusercontent.com/BuddyChewChew/xumo-playlist-generator/refs/heads/main/playlists/xumo_epg.xml.gz",
  tracks: [
    Track(
      title: "Hà Nội IPTV",
      links: [
        "https://raw.githubusercontent.com/HaNoiIPTV/HaNoiIPTV.m3u/refs/heads/master/Danh%20s%C3%A1ch%20k%C3%AAnh/G%C3%B3i%20ch%C3%ADnh%20th%E1%BB%A9c/H%C3%A0%20N%E1%BB%99i%20IPTV.m3u",
      ],
    ),
    Track(
      title: "Hà Nội IPTV công cộng",
      links: [
        "https://raw.githubusercontent.com/HaNoiIPTV/HaNoiIPTV.m3u/master/Danh%20s%C3%A1ch%20k%C3%AAnh/G%C3%B3i%20ch%C3%ADnh%20th%E1%BB%A9c/H%C3%A0%20N%E1%BB%99i%20IPTV%20c%C3%B4ng%20c%E1%BB%99ng.m3u",
      ],
    ),
  ],
);
