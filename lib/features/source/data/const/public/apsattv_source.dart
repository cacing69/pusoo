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


// ASIA PACIFIC F.T.A SAT TV

import 'package:pusoo/features/source/domain/entities/source.dart';
import 'package:pusoo/features/track/domain/models/track.dart';

final appSatTvSource = Source(
  name: "Apsattv Playlists",
  isPublic: true,
  isEmpty: false,
  homepage: "https://www.apsattv.com/",
  description:
      "Your source for Asia Pacific regional Satellite News and Free to Air Satellite TV and IPTV Info since 1998",
  epgLink: "",
  tracks: [
    Track(title: "Fire TV", links: ["https://www.apsattv.com/firetv.m3u"]),
    Track(
      title: "LocalNow",
      links: ["https://www.apsattv.localnow/firetv.m3u"],
    ),
    Track(title: "Galxy.TV", links: ["https://www.apsattv.com/galxytv.m3u"]),
    Track(title: "Xiaomi", links: ["https://www.apsattv.com/xiaomi.m3u"]),
    Track(title: "Tablo", links: ["https://www.apsattv.com/tablo.m3u"]),
    Track(title: "Vizio TV", links: ["https://www.apsattv.com/vizio.m3u"]),
    Track(
      title: "The Roku Channel",
      links: ["https://www.apsattv.com/rok.m3u"],
    ),
    Track(
      title: "Freelivesports",
      links: ["https://www.apsattv.com/freelivesports.m3u"],
    ),
    Track(title: "TCL TV Plus", links: ["https://www.apsattv.com/tclplus.m3u"]),
    Track(title: "TCL BR", links: ["https://www.apsattv.com/tclbr.m3u"]),
    Track(title: "TCL Channels", links: ["https://www.apsattv.com/tcl.m3u"]),
    Track(title: "LG Channels AR", links: ["https://www.apsattv.com/arlg.m3u"]),
    Track(title: "LG Channels AT", links: ["https://www.apsattv.com/atlg.m3u"]),
    Track(title: "LG Channels AU", links: ["https://www.apsattv.com/aulg.m3u"]),
    Track(title: "LG Channels BE", links: ["https://www.apsattv.com/belg.m3u"]),
    Track(title: "LG Channels BR", links: ["https://www.apsattv.com/brlg.m3u"]),
    Track(title: "LG Channels CA", links: ["https://www.apsattv.com/calg.m3u"]),
    Track(title: "LG Channels CH", links: ["https://www.apsattv.com/chlg.m3u"]),
    Track(title: "LG Channels CL", links: ["https://www.apsattv.com/cllg.m3u"]),
    Track(title: "LG Channels CO", links: ["https://www.apsattv.com/colg.m3u"]),
    Track(title: "LG Channels DE", links: ["https://www.apsattv.com/delg.m3u"]),
    Track(title: "LG Channels DK", links: ["https://www.apsattv.com/dklg.m3u"]),
    Track(title: "LG Channels ES", links: ["https://www.apsattv.com/eslg.m3u"]),
    Track(title: "LG Channels FI", links: ["https://www.apsattv.com/filg.m3u"]),
    Track(title: "LG Channels FR", links: ["https://www.apsattv.com/frlg.m3u"]),
    Track(title: "LG Channels GB", links: ["https://www.apsattv.com/gblg.m3u"]),
    Track(title: "LG Channels IE", links: ["https://www.apsattv.com/ielg.m3u"]),
    Track(title: "LG Channels IN", links: ["https://www.apsattv.com/inlg.m3u"]),
    Track(title: "LG Channels IT", links: ["https://www.apsattv.com/itlg.m3u"]),
    Track(title: "LG Channels JP", links: ["https://www.apsattv.com/jplg.m3u"]),
    Track(title: "LG Channels KR", links: ["https://www.apsattv.com/krlg.m3u"]),
    Track(title: "LG Channels LU", links: ["https://www.apsattv.com/lulg.m3u"]),
    Track(title: "LG Channels MX", links: ["https://www.apsattv.com/mxlg.m3u"]),
    Track(title: "LG Channels NL", links: ["https://www.apsattv.com/nllg.m3u"]),
    Track(title: "LG Channels NO", links: ["https://www.apsattv.com/nolg.m3u"]),
    Track(title: "LG Channels NZ", links: ["https://www.apsattv.com/nzlg.m3u"]),
    Track(title: "LG Channels PE", links: ["https://www.apsattv.com/pelg.m3u"]),
    Track(title: "LG Channels PT", links: ["https://www.apsattv.com/ptlg.m3u"]),
    Track(title: "LG Channels SG", links: ["https://www.apsattv.com/sglg.m3u"]),
    Track(title: "LG Channels SE", links: ["https://www.apsattv.com/selg.m3u"]),
    Track(title: "LG Channels US", links: ["https://www.apsattv.com/uslg.m3u"]),
  ],
);
