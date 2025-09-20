import 'package:pusoo/features/source/data/const/iptv_org/iptv_org_list_countries.dart';
import 'package:pusoo/features/source/domain/entities/source.dart';

import 'package:pusoo/features/track/domain/models/track.dart';

final iptvOrgIptvSource = Source(
  name: "iptv-org/iptv",
  isPublic: true,
  isEmpty: false,
  homepage: "https://github.com/iptv-org/iptv",
  description:
      "Collection of publicly available IPTV channels from all over the world",
  tracks: [
    Track(
      title: "All Country",
      links: ["https://iptv-org.github.io/iptv/index.country.m3u"],
    ),
    ...iptvOrgListCountries,
  ],
);

final freeTvIptvSource = Source(
  name: "Free-TV/IPTV",
  isPublic: true,
  isEmpty: false,
  homepage: "https://github.com/Free-TV/IPTV",
  description: "M3U Playlist for free TV channels",
  tracks: [
    Track(
      title: "Main Playlist",
      links: [
        "https://raw.githubusercontent.com/Free-TV/IPTV/refs/heads/master/playlist.m3u8",
      ],
    ),
  ],
);

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
    // Track(
    //   title: "Samsung TV Plus",
    //   links: [
    //     "https://raw.githubusercontent.com/Mikhel/EPG-para-m3u/refs/heads/main/M3U/SAM/samall.m3u",
    //   ],
    // ),
    Track(
      title: "Stirr",
      links: [
        "https://raw.githubusercontent.com/Mikhel/EPG-para-m3u/refs/heads/main/M3U/STIR/all.m3u",
      ],
    ),
  ],
);

final gambiarrasLegalIptvSource = Source(
  name: "gambiarras/legal-iptv",
  isPublic: true,
  isEmpty: false,
  homepage: "https://github.com/gambiarras/legal-iptv",
  description: "No description, website, or topics provided.",
  tracks: [
    Track(
      title: "Main Playlist",
      links: [
        "https://raw.githubusercontent.com/gambiarras/legal-iptv/refs/heads/main/playlist.m3u",
      ],
    ),
  ],
);

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
      title: "Main Playlist",
      links: [
        "https://raw.githubusercontent.com/BuddyChewChew/xumo-playlist-generator/refs/heads/main/playlists/xumo_playlist.m3u",
      ],
    ),
  ],
);

// final indonesianIptv = Source(
//   name: "Indonesian-IPTV",
//   isPublic: true,
// isEmpty: false,
//   homepage: "https://github.com/emonnaja/Indonesian-IPTV",
//   description:
//       "Watch premium Indonesian live tv anywhere without subscriptions.",
//   tracks: [
//     Track(
//       title: "Main Playlist",
//       links: ["https://live.streamo.cfd/jakarta/playlist/indonesia.m3u"],
//     ),
//   ],
// );

final List<Source> publicSources = [
  iptvOrgIptvSource,
  freeTvIptvSource,
  mikhelEpgParaM3uSource,
  gambiarrasLegalIptvSource,
  buddyChewChewXumoPlaylistGeneratorSource,
];
