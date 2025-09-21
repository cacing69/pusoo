import 'package:pusoo/features/source/domain/entities/source.dart';
import 'package:pusoo/features/track/domain/models/track.dart';

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
