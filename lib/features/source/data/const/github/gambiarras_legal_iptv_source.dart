import 'package:pusoo/features/source/domain/entities/source.dart';
import 'package:pusoo/features/track/domain/models/track.dart';

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
