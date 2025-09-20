import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pusoo/core/utils/m3u_parser.dart';
import 'package:pusoo/features/source/domain/entities/source.dart';
import 'package:pusoo/features/track/domain/models/track.dart';
import 'package:http/http.dart' as http;
import 'package:pusoo/features/tv/presentation/widgets/tvg_logo_viewer.dart';
import 'package:pusoo/router.dart';

class PublicSourceListPlaylistChannelsScreen
    extends StatefulHookConsumerWidget {
  final Source source;

  const PublicSourceListPlaylistChannelsScreen({
    required this.source,
    super.key,
  });

  @override
  ConsumerState<PublicSourceListPlaylistChannelsScreen> createState() =>
      _PublicSourceListPlaylistChannelsScreenState();
}

class _PublicSourceListPlaylistChannelsScreenState
    extends ConsumerState<PublicSourceListPlaylistChannelsScreen> {
  final Debouncer _debouncer = Debouncer();
  final Duration _debounceDuration = const Duration(milliseconds: 500);
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        final response = await http.get(
          Uri.parse(widget.source.tracks!.first.links.first),
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
            isLoading = false;
          });
        }
      } catch (e) {
        setState(() {
          isLoading = false;
        });
      }
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
                "Channels : ${NumberFormat.decimalPattern().format(tracks.length)}",
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
              "All channels available in this playlist",
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
          FButton(
            onPress: () {
              context.pushNamed(
                RouteName.addPlaylist.name,
                extra: widget.source,
              );
            },
            prefix: Icon(FIcons.bookmark),
            child: Text("Add to My Playlist"),
          ),
          FDivider(
            style: (style) =>
                style.copyWith(padding: EdgeInsets.symmetric(vertical: 10)),
          ),

          Expanded(
            child: isLoading
                ? Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FProgress.circularIcon(),
                        Text("Loading channels..."),
                      ],
                    ),
                  )
                : _buildResult(),
          ),
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
              track.groupTitle.isNotEmpty ? track.groupTitle : "Unknown",
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
                                  : "Unknown",
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
