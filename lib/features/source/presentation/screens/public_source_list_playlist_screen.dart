import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pusoo/router.dart';

class PublicSourceListPlaylistScreen extends StatefulWidget {
  const PublicSourceListPlaylistScreen({super.key});

  @override
  State<PublicSourceListPlaylistScreen> createState() =>
      _PublicSourceListPlaylistScreenState();
}

class _PublicSourceListPlaylistScreenState
    extends State<PublicSourceListPlaylistScreen> {
  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader.nested(
        title: Text("Available Playlists"),
        prefixes: [
          FHeaderAction.back(
            onPress: () {
              context.pop(false);
            },
          ),
        ],
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(FIcons.atSign),
                  Gap(5),
                  Text(
                    "iptv-org/iptv",
                    style: context.theme.typography.base.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Gap(10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Collection of publicly available IPTV channels from all over the world",
                  style: context.theme.typography.sm,
                ),
              ),
              FItem(
                prefix: Icon(FIcons.globe),
                title: Text("Homepage"),
                suffix: Icon(FIcons.externalLink),
              ),
              FItem(
                prefix: Icon(FIcons.github),
                title: Text("Gitub Repository"),
                suffix: Icon(FIcons.externalLink),
              ),
            ],
          ),
          FDivider(
            style: (style) =>
                style.copyWith(padding: EdgeInsets.symmetric(vertical: 10)),
          ),
          FItemGroup(
            children: [
              FItem(
                prefix: Icon(FIcons.folderGit2),
                title: Text("Main Playlist"),
                subtitle: Text("https://iptv-org.github.io/iptv/index.m3u"),
                suffix: Icon(FIcons.chevronRight),
                onPress: () {
                  context.pushNamed(RouteName.publicSourcesPlaylistTrack.name);
                },
              ),
              FItem(
                prefix: Icon(FIcons.folderGit2),
                title: Text("Grouped by category"),
                subtitle: Text(
                  "https://iptv-org.github.io/iptv/index.category.m3u",
                ),
                suffix: Icon(FIcons.chevronRight),
              ),
              FItem(
                prefix: Icon(FIcons.folderGit2),
                title: Text("Grouped by Language"),
                subtitle: Text(
                  "https://iptv-org.github.io/iptv/index.language.m3u",
                ),
                suffix: Icon(FIcons.chevronRight),
              ),
              FItem(
                prefix: Icon(FIcons.folderGit2),
                title: Text("Grouped by Broadcast Area"),
                subtitle: Text(
                  "https://iptv-org.github.io/iptv/index.country.m3u",
                ),
                suffix: Icon(FIcons.chevronRight),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
