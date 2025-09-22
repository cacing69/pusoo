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

final mikhelEpgParaM3uSource = Source(
  name: "Mikhel/EPG-para-m3u",
  isPublic: true,
  isEmpty: false,
  homepage: "https://github.com/Mikhel/EPG-para-m3u",
  description: "Originalmente de y con agradecimientos a él por la ayuda",
  tracks: [
    Track(
      title: "Pluto TV",
      links: [
        "https://raw.githubusercontent.com/Mikhel/EPG-para-m3u/refs/heads/main/M3U/PLUTO/all.m3u",
      ],
    ),
    Track(
      title: "Roku TV",
      links: [
        "https://raw.githubusercontent.com/Mikhel/EPG-para-m3u/refs/heads/main/M3U/ROK/rokall.m3u",
      ],
    ),
    Track(
      title: "Stirr",
      links: [
        "https://raw.githubusercontent.com/Mikhel/EPG-para-m3u/refs/heads/main/M3U/STIR/all.m3u",
      ],
    ),
  ],
);
