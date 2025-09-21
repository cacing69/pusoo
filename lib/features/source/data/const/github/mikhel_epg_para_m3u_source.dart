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
