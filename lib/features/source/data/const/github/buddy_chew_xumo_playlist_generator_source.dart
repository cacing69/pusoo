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
      title: "Xumo Playlist",
      links: [
        "https://raw.githubusercontent.com/BuddyChewChew/xumo-playlist-generator/refs/heads/main/playlists/xumo_playlist.m3u",
      ],
    ),
  ],
);
