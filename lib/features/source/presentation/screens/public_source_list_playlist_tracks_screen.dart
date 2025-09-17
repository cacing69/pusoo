import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pusoo/core/utils/m3u_parser.dart';
import 'package:pusoo/features/track/domain/models/track.dart';
import 'package:http/http.dart' as http;
import 'package:pusoo/features/tv/presentation/widgets/tvg_logo_viewer.dart';

class PublicSourceListPlaylistTracksScreen extends StatefulHookConsumerWidget {
  const PublicSourceListPlaylistTracksScreen({super.key});

  @override
  ConsumerState<PublicSourceListPlaylistTracksScreen> createState() =>
      _PublicSourceListPlaylistTracksScreenState();
}

class _PublicSourceListPlaylistTracksScreenState
    extends ConsumerState<PublicSourceListPlaylistTracksScreen> {
  final Debouncer _debouncer = Debouncer();
  final Duration _debounceDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        final response = await http.get(
          Uri.parse("https://iptv-org.github.io/iptv/index.m3u"),
        );

        if (response.statusCode == 200) {
          String content;

          try {
            content = utf8
                .decode(response.bodyBytes)
                .replaceFirst('\u{FEFF}', '');
          } catch (_) {
            // fallback ke latin1 jika utf8 gagal
            content = latin1.decode(response.bodyBytes);
          }

          // final List<Track> channel = M3UParser.parse(content);

          setState(() {
            tracks = M3UParser.parse(content);
          });
        }
      } catch (e) {}
    });
  }

  List<Track> tracks = [];
  List<Track> tracksFiltered = [];

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();

    return FScaffold(
      header: FHeader.nested(
        title: Text("Available Channels"),
        prefixes: [
          FHeaderAction.back(
            onPress: () {
              context.pop(false);
            },
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(FIcons.folderGit2),
              Gap(5),
              Text(
                "Main Playlist (${NumberFormat.decimalPattern().format(tracks.length)} channels)",
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
              "The main playlist containing all channels available in the repository",
              style: context.theme.typography.sm,
            ),
          ),
          FTextField(
            hint: "Search channels...",
            controller: searchController,
            clearable: (e) => e.text.isNotEmpty,
            onChange: (String value) {
              _debouncer.debounce(
                duration: _debounceDuration,
                onDebounce: () async {
                  // ref.read(tvTracksFilterProvider.notifier).changeTitle(value);
                  // ref.read(tvTracksPagingProvider).refresh();

                  if (searchController.text.trim().isNotEmpty) {
                    setState(() {
                      tracksFiltered = tracks
                          .where(
                            (track) => track.title.toLowerCase().contains(
                              searchController.text.trim(),
                            ),
                          )
                          .toList();

                      debugPrint(tracksFiltered.length.toString());
                    });
                  } else {
                    setState(() {
                      tracksFiltered = [];
                    });
                  }
                },
              );
            },
          ),
          Gap(5),
          FButton(onPress: () {}, child: Text("Load Channels to My Playlist")),
          FDivider(
            style: (style) =>
                style.copyWith(padding: EdgeInsets.symmetric(vertical: 10)),
          ),
          Expanded(child: _buildResult()),
        ],
      ),
    );
  }

  Widget _buildResult() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ...(tracksFiltered.isNotEmpty ? tracksFiltered : tracks).map(
          (track) => FItem(
            prefix: Icon(FIcons.tvMinimal),
            title: Text(track.title),
            details: Text(
              track.groupTitle.isNotEmpty ? track.groupTitle : "Miscellaneous",
            ),
            subtitle: Text("https://iptv-org.github.io/iptv/index.m3u"),
            suffix: Icon(FIcons.chevronRight),
            onPress: () async {
              await showFDialog(
                context: context,
                builder: (context, style, animation) => FDialog(
                  animation: animation,
                  direction: Axis.horizontal,
                  title: const Text('Channel Information'),
                  body: Column(
                    children: [
                      Center(
                        child: TvgLogoViewer(
                          track: track,
                          size: 100,
                          showLabel: false,
                        ),
                      ),
                      FItemGroup(
                        divider: FItemDivider.indented,
                        children: [
                          FItem(
                            title: Text(track.title),
                            subtitle: Text("Channel name"),
                          ),
                          FItem(
                            title: Text(
                              track.groupTitle.isNotEmpty
                                  ? track.groupTitle
                                  : "Miscellaneous",
                            ),
                            subtitle: Text("Category"),
                          ),
                          FItem(
                            title: Text(
                              track.tvgId.isNotEmpty ? track.tvgId : "-",
                            ),
                            subtitle: Text("tvg-id"),
                          ),
                          FItem(
                            title: Text("URLs"),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ...track.links.map(
                                  (link) => Text(link, maxLines: 3),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  actions: [
                    FButton(
                      onPress: () async {
                        // removeAllPlaylist();
                        context.pop();

                        // showFlutterToast(
                        //   message: "All playlist deleted",
                        //   context: context,
                        // );
                      },
                      child: const Text('Close'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
