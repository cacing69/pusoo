import 'package:pusoo/features/source/data/const/github/iptv_org_list_countries.dart';
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
