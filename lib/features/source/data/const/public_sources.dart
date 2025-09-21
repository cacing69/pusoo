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

final lituatuiM3uptSource = Source(
  name: "https://github.com/LITUATUI/M3UPT",
  isPublic: true,
  isEmpty: false,
  homepage: "https://github.com/BuddyChewChew/xumo-playlist-generator",
  description:
      "IPTV playlist in M3U format with TV and radio stations in Portuguese. Public and official streams only.",
  epgLink:
      "https://raw.githubusercontent.com/BuddyChewChew/xumo-playlist-generator/refs/heads/main/playlists/xumo_epg.xml.gz",
  tracks: [
    Track(
      title: "Main Playlist",
      links: [
        "https://raw.githubusercontent.com/LITUATUI/M3UPT/refs/heads/main/M3U/M3UPT.m3u",
      ],
    ),
  ],
);

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

final ghokunTvSource = Source(
  name: "ghokun/tv",
  isPublic: true,
  isEmpty: false,
  homepage: "https://github.com/ghokun/tv",
  description:
      "This is an IPTV playlist and EPG generator. On a scheduled run (hourly)",
  epgLink:
      "https://raw.githubusercontent.com/ghokun/tv/refs/heads/main/bin/guide.xml",
  tracks: [
    Track(
      title: "Hà Nội IPTV",
      links: [
        "https://raw.githubusercontent.com/ghokun/tv/refs/heads/main/bin/playlist.m3u",
      ],
    ),
  ],
);

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

final List<Source> publicSources = [
  iptvOrgIptvSource,
  freeTvIptvSource,
  mikhelEpgParaM3uSource,
  gambiarrasLegalIptvSource,
  buddyChewChewXumoPlaylistGeneratorSource,
  lituatuiM3uptSource,
  haNoiIPTVHaNoiIPTVM3uSource,
  ghokunTvSource,
  kimentanmAptvSource,
];
