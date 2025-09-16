import 'dart:convert';

import 'package:drift/drift.dart' as drift;
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forui/forui.dart';
import 'package:forui_hooks/forui_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pusoo/core/utils/helpers.dart';
import 'package:pusoo/core/utils/m3u_parser.dart';
import 'package:pusoo/shared/data/datasources/local/drift_database.dart';
import 'package:http/http.dart' as http;
import 'package:pusoo/shared/data/models/playlist.dart';
import 'package:pusoo/shared/data/models/playlist_template.dart';
import 'package:pusoo/shared/data/models/track.dart';
import 'package:pusoo/shared/data/playlist_template_reff.dart';
import 'package:ulid/ulid.dart';

class AddPlaylistScreen extends StatefulHookConsumerWidget {
  const AddPlaylistScreen({super.key});

  @override
  ConsumerState<AddPlaylistScreen> createState() => _AddPlaylistScreenState();
}

class _AddPlaylistScreenState extends ConsumerState<AddPlaylistScreen> {
  bool isLoading = false;

  final playlistTypeController = FSelectTileGroupController<ContentType>.radio(
    ContentType.live,
  );

  @override
  void dispose() {
    playlistTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final templateContoller = useFSelectController<PlaylistTemplate>();
    final urlController = useTextEditingController(
      // text:
      //     "https://raw.githubusercontent.com/kshshuGyUWGG799vfaga/new-m3u/refs/heads/main/2025",
      // text:
      //     "http://ogietv.biz.id:80/get.php?username=maksin&password=123456&type=m3u_plus&output=mpegts",
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
            selectController: playlistTypeController,
            label: const Text('Playlist Type'),
            description: const Text('Select playlist type.'),
            children: [
              FSelectTile(
                title: const Text('Live TV'),
                value: ContentType.live,
                suffix: Icon(FIcons.monitor),
              ),
              FSelectTile(
                title: const Text('Movies'),
                value: ContentType.movie,
                suffix: Icon(FIcons.monitorPlay),
              ),
              FSelectTile(
                title: const Text('TV Series'),
                value: ContentType.series,
                suffix: Icon(FIcons.monitorCheck),
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
          FSelect<PlaylistTemplate>.rich(
            controller: templateContoller,
            label: Text("Template"),
            hint: 'Select template',
            format: (s) => s.label ?? "",
            children: [
              ...listPlaylistTemplate.map(
                (template) => FSelectItem(
                  title: Text(template.label ?? ""),
                  value: template,
                ),
              ),
            ],
          ),
          Gap(10),
          SafeArea(
            child: FButton(
              prefix: isLoading ? FProgress.circularIcon() : null,
              onPress: isLoading
                  ? null
                  : () async {
                      if (nameController.text.isEmpty) {
                        showFlutterToast(
                          message: "Name cannot empty",
                          context: context,
                        );
                        return;
                      }

                      if (urlController.text.isEmpty) {
                        showFlutterToast(
                          message: "URL cannot empty",
                          context: context,
                        );
                        return;
                      }

                      setState(() {
                        isLoading = true;
                      });

                      final String playlistUlid = Ulid().toString();

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

                          // cek jika belum ada playlist maka set default
                          final countExpression = driftDb.playlistDrift.id
                              .count();

                          // Menggunakan selectOnly dan membaca hasilnya secara langsung
                          final count =
                              await (driftDb.selectOnly(driftDb.playlistDrift)
                                    ..addColumns([countExpression]))
                                  .map((row) => row.read(countExpression))
                                  .getSingle();

                          final int playlistId = await driftDb
                              .into(driftDb.playlistDrift)
                              .insert(
                                PlaylistDriftCompanion.insert(
                                  ulid: playlistUlid,
                                  name: nameController.text.trim(),
                                  type: drift.Value("m3u"),
                                  contentType: drift.Value("m3u"),
                                  filePath: drift.Value(""),
                                  epgLink: drift.Value(""),
                                  url: drift.Value(urlController.text.trim()),
                                  isActive: drift.Value(count == 0),
                                ),
                              );

                          // Menggunakan selectOnly dan membaca hasilnya secara langsung
                          final isUrlExistOnPlaylisUrlHistory =
                              await (driftDb.select(driftDb.playlistDrift)
                                    ..where(
                                      (tbl) => tbl.url.equals(
                                        urlController.text.trim(),
                                      ),
                                    ))
                                  .getSingleOrNull() !=
                              null;

                          if (!isUrlExistOnPlaylisUrlHistory) {
                            await driftDb
                                .into(driftDb.playlistUrlHistoryDrift)
                                .insert(
                                  PlaylistUrlHistoryDriftCompanion.insert(
                                    url: drift.Value(urlController.text.trim()),
                                  ),
                                );
                          }

                          final selectedTemplate = templateContoller.value;

                          final isLiveTv = playlistTypeController.value
                              .contains(ContentType.live);

                          final isMovie = playlistTypeController.value.contains(
                            ContentType.live,
                          );

                          final isTvSerie = playlistTypeController.value
                              .contains(ContentType.live);

                          await driftDb.batch((batch) {
                            batch.insertAll(
                              driftDb.trackDrift,
                              channel.map<TrackDriftCompanion>((Track track) {
                                // debugPrint(ch.toString());

                                return TrackDriftCompanion(
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
                                  isLiveTv: drift.Value(
                                    selectedTemplate?.liveTvClassifier
                                            ?.isSatisfiedByAll(track) ??
                                        isLiveTv,
                                  ),
                                  isMovie: drift.Value(
                                    selectedTemplate?.movieClassifier
                                            ?.isSatisfiedByAll(track) ??
                                        isMovie,
                                  ),
                                  isTvSerie: drift.Value(
                                    selectedTemplate?.tvSerieClassifier
                                            ?.isSatisfiedByAll(track) ??
                                        isTvSerie,
                                  ),
                                );
                              }).toList(),
                            );
                          });

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
