import 'package:pusoo/features/source/domain/entities/source.dart';
import 'package:pusoo/features/track/domain/models/track.dart';

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
