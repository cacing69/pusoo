import 'package:pusoo/features/source/domain/entities/source.dart';
import 'package:pusoo/features/track/domain/models/track.dart';

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
