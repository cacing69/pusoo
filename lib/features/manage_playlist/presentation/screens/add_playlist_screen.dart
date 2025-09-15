import 'dart:convert';

import 'package:drift/drift.dart' as drift;
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pusoo/core/utils/helpers.dart';
import 'package:pusoo/core/utils/m3u_parser.dart';
import 'package:pusoo/shared/data/datasources/local/drift_database.dart';
import 'package:http/http.dart' as http;
import 'package:pusoo/shared/data/models/playlist.dart';
import 'package:pusoo/shared/data/models/track.dart';
import 'package:ulid/ulid.dart';

class AddPlaylistScreen extends StatefulHookConsumerWidget {
  const AddPlaylistScreen({super.key});

  @override
  ConsumerState<AddPlaylistScreen> createState() => _AddPlaylistScreenState();
}

class _AddPlaylistScreenState extends ConsumerState<AddPlaylistScreen> {
  bool isLoading = false;

  final channelTypeController = FSelectTileGroupController<ContentType>.radio(
    ContentType.unknown,
  );

  @override
  void dispose() {
    channelTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final urlController = useTextEditingController(
      text:
          "https://raw.githubusercontent.com/kshshuGyUWGG799vfaga/new-m3u/refs/heads/main/2025",
    );
    final epgLinkController = useTextEditingController();

    return FScaffold(
      header: FHeader.nested(
        title: Text("Add Playlist"),
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
          FSelectTileGroup(
            selectController: channelTypeController,
            label: const Text('Playlist Type'),
            description: const Text('Select playlist type.'),
            children: [
              FSelectTile(
                title: const Text('Unknown'),
                value: ContentType.unknown,
                suffix: Icon(FIcons.annoyed),
              ),
              FSelectTile(
                title: const Text('Live TV'),
                value: ContentType.live,
                suffix: Icon(FIcons.monitor),
              ),
              FSelectTile(
                title: const Text('VOD'),
                value: ContentType.vod,
                suffix: Icon(FIcons.monitorPlay),
              ),
            ],
          ),
          Gap(10),
          FTextField(
            controller: nameController,
            label: Text("Name"),
            description: Text("Lorem ipsum dolor sit amet"),
          ),
          Gap(10),
          FTextField.multiline(
            controller: urlController,
            label: Text("URL"),
            minLines: 4,
            clearable: (TextEditingValue e) => e.text.isNotEmpty,
          ),
          Gap(10),
          FTextField.multiline(
            controller: epgLinkController,
            label: Text("EPG Link (Optional)"),
            minLines: 2,
            clearable: (TextEditingValue e) => e.text.isNotEmpty,
          ),
          Gap(10),
          FSelect<String>.rich(
            label: Text("Template"),
            hint: 'Select a fruit',
            format: (s) => s,
            children: [
              // for (final fruit in fruits)
              FSelectItem(title: Text("A"), value: "a"),
            ],
          ),
          Gap(10),
          SafeArea(
            child: FButton(
              prefix: isLoading ? FProgress.circularIcon() : null,
              onPress: isLoading
                  ? null
                  : () async {
                      setState(() {
                        isLoading = true;
                      });

                      final String playlistId = Ulid().toString();

                      debugPrint('Playlist Saved!');

                      // Save Channels
                      try {
                        final response = await http.get(
                          Uri.parse(urlController.text.trim()),
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

                          final List<Track> channel = M3UParser.parse(content);

                          await driftDb.batch((batch) {
                            batch.insertAll(
                              driftDb.trackDrift,
                              channel.map<TrackDriftCompanion>((Track track) {
                                // debugPrint(ch.toString());

                                return TrackDriftCompanion(
                                  id: drift.Value(Ulid().toString()),
                                  playlistId: drift.Value(playlistId),
                                  title: drift.Value(track.title),
                                  tvgId: drift.Value(track.tvgId),
                                  tvgLogo: drift.Value(track.tvgLogo),
                                  groupTitle: drift.Value(track.groupTitle),
                                  links: drift.Value(jsonEncode(track.links)),
                                  kodiProps: drift.Value(
                                    jsonEncode(track.kodiProps),
                                  ),
                                  extVlcOpts: drift.Value(
                                    jsonEncode(track.extVlcOpts),
                                  ),
                                );
                              }).toList(),
                            );
                          });

                          // cek jika belum ada playlist maka set default
                          final countExpression = driftDb.playlistDrift.id
                              .count();

                          // Menggunakan selectOnly dan membaca hasilnya secara langsung
                          final count =
                              await (driftDb.selectOnly(driftDb.playlistDrift)
                                    ..addColumns([countExpression]))
                                  .map((row) => row.read(countExpression))
                                  .getSingle();

                          await driftDb
                              .into(driftDb.playlistDrift)
                              .insert(
                                PlaylistDriftCompanion.insert(
                                  id: drift.Value(playlistId),
                                  name: nameController.text.trim(),
                                  type: drift.Value("m3u"),
                                  contentType: drift.Value("m3u"),
                                  filePath: drift.Value(""),
                                  epgLink: drift.Value(""),
                                  url: urlController.text.trim(),
                                  isActive: drift.Value(count == 0),
                                ),
                              );

                          if (context.mounted) {
                            setState(() {
                              isLoading = false;
                            });

                            context.pop(true);
                          }
                        } else {
                          throw Exception('Failed to load M3U');
                        }
                      } catch (e) {
                        setState(() {
                          isLoading = false;
                        });

                        if (context.mounted) {
                          showFlutterToast(
                            context: context,
                            message: 'Error loading M3U: $e',
                          );
                        }

                        debugPrint('Error loading M3U: $e');
                      }
                    },
              child: Text("Save"),
            ),
          ),
          Gap(10),
        ],
      ),
    );
  }
}
