import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pusoo/features/source/domain/entities/source.dart';
import 'package:pusoo/router.dart';

class PublicSourceListPlaylistScreen extends StatefulWidget {
  final Source source;

  const PublicSourceListPlaylistScreen({required this.source, super.key});

  @override
  State<PublicSourceListPlaylistScreen> createState() =>
      _PublicSourceListPlaylistScreenState();
}

class _PublicSourceListPlaylistScreenState
    extends State<PublicSourceListPlaylistScreen> {
  @override
  Widget build(BuildContext context) {
    final source = widget.source;
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
              // Row(
              //   children: [
              //     Icon(FIcons.atSign),
              //     Gap(5),
              //     Text(
              //       source.name!,
              //       style: context.theme.typography.base.copyWith(
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ],
              // ),
              FTile(
                prefix: Icon(FIcons.github),
                title: Text(source.name!),
                suffix: Icon(FIcons.externalLink),
                subtitle: Text(source.description!, maxLines: 3),
              ),
              Gap(10),
            ],
          ),
          FItemGroup(
            divider: FItemDivider.indented,
            children: [
              ...source.tracks!.map(
                (track) => FItem(
                  prefix: Icon(FIcons.folderGit2),
                  title: Text(track.title),
                  subtitle: Text(track.links.first),
                  suffix: Icon(FIcons.chevronRight),
                  onPress: () {
                    context.pushNamed(
                      RouteName.publicSourcesPlaylistChannels.name,
                      extra: source.copyWith(
                        name: "${source.name} (${track.title})",
                        tracks: [track],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
