import 'package:pusoo/features/source/domain/entities/source.dart';
import 'package:pusoo/features/track/domain/models/track.dart';

final lituatuiM3uptSource = Source(
  name: "LITUATUI/M3UPT",
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
