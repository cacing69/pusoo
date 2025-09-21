import 'package:pusoo/features/source/domain/entities/source.dart';
import 'package:pusoo/features/track/domain/models/track.dart';

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
