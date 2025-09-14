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
import 'package:ulid/ulid.dart';

class AddPlaylistScreen extends StatefulHookConsumerWidget {
  const AddPlaylistScreen({super.key});

  @override
  ConsumerState<AddPlaylistScreen> createState() => _AddPlaylistScreenState();
}

enum ChannelType { unknown, liveTv, movies, tvSeries }

class _AddPlaylistScreenState extends ConsumerState<AddPlaylistScreen> {
  bool isLoading = false;

  final channelTypeController = FSelectTileGroupController<ChannelType>.radio(
    ChannelType.unknown,
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
                value: ChannelType.unknown,
                suffix: Icon(FIcons.annoyed),
              ),
              FSelectTile(
                title: const Text('Live TV'),
                value: ChannelType.liveTv,
                suffix: Icon(FIcons.monitor),
              ),
              FSelectTile(
                title: const Text('Movies'),
                value: ChannelType.movies,
                suffix: Icon(FIcons.monitorPlay),
              ),
              FSelectTile(
                title: const Text('TV Series'),
                value: ChannelType.tvSeries,
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

          // FSelectGroup<ChannelType>(
          //   controller: channelTypeController,
          //   label: const Text('Playlist Type'),
          //   validator: (values) =>
          //       values?.isEmpty ?? true ? 'Please select a value.' : null,
          //   children: [
          //     FRadio.grouped(
          //       value: ChannelType.unknown,
          //       label: const Text('Unknown'),
          //     ),
          //     FRadio.grouped(
          //       value: ChannelType.liveTv,
          //       label: const Text('Live TV'),
          //     ),
          //     FRadio.grouped(
          //       value: ChannelType.movie,
          //       label: const Text('Movies'),
          //     ),
          //     FRadio.grouped(
          //       value: ChannelType.liveTv,
          //       label: const Text('TV Series'),
          //     ),
          //   ],
          // ),
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
                      // await managers.users.create(
                      //   (row) => row(username: 'firstuser'),
                      // );

                      final String playlistId = Ulid().toString();

                      debugPrint('Playlist Saved!');

                      // Save Channels
                      try {
                        final response = await http.get(
                          Uri.parse(urlController.text.trim()),
                        );

                        if (response.statusCode == 200) {
                          // debugPrint(response.body);
                          // final content = utf8
                          //     .decode(response.bodyBytes)
                          //     .replaceFirst('\u{FEFF}', '');

                          // final Map<String, dynamic> channel = M3uUtils.parse(
                          //   content,
                          // );

                          String content;

                          try {
                            content = utf8
                                .decode(response.bodyBytes)
                                .replaceFirst('\u{FEFF}', '');
                          } catch (_) {
                            // fallback ke latin1 jika utf8 gagal
                            content = latin1.decode(response.bodyBytes);
                          }

                          final dynamic channel = M3UParser.parse(content);

                          setState(() {
                            isLoading = false;
                          });

                          return;

                          // final find = channel["items"].where(
                          //   (item) =>
                          //       item["name"] == "ONE HD" ||
                          //       item["name"] == " ONE HD",
                          // );

                          // debugPrint(find.toString());

                          // return;

                          await driftDb.batch((batch) {
                            batch.insertAll(
                              driftDb.channelDrift,
                              channel["items"].map<ChannelDriftCompanion>((
                                dynamic ch,
                              ) {
                                // debugPrint(ch.toString());

                                return ChannelDriftCompanion(
                                  id: drift.Value(Ulid().toString()),
                                  playlistId: drift.Value(playlistId),
                                  name: drift.Value(ch["name"] ?? ""),
                                  tvgId: drift.Value(ch["tvgId"] ?? ""),
                                  logo: drift.Value(
                                    ch["tvgLogo"] ?? ch["groupLogo"] ?? "",
                                  ),
                                  groupTitle: drift.Value(
                                    ch["groupTitle"] ?? "Miscellaneous",
                                  ),
                                  streamUrl: drift.Value(
                                    jsonEncode(ch["urls"] ?? ""),
                                  ),
                                  kodiprop: drift.Value(
                                    jsonEncode(
                                      ch.containsKey("kodiprop")
                                          ? ch["kodiprop"]
                                          : "",
                                    ),
                                  ),
                                  isLiveTv: drift.Value(
                                    channelTypeController.value.contains(
                                      ChannelType.liveTv,
                                    ),
                                  ),
                                  isMovie: drift.Value(
                                    channelTypeController.value.contains(
                                      ChannelType.movies,
                                    ),
                                  ),
                                  isTvSerie: drift.Value(
                                    channelTypeController.value.contains(
                                      ChannelType.tvSeries,
                                    ),
                                  ),
                                  extvlcopt: drift.Value(
                                    jsonEncode(
                                      ch.containsKey("extvlcopt")
                                          ? ch["extvlcopt"]
                                          : "",
                                    ),
                                  ),
                                );
                              }).toList(),
                            );
                          });

                          // showFToast(
                          //   context: context,
                          //   alignment: FToastAlignment.bottomCenter,
                          //   title: const Text('Playlist Saved'),
                          //   description: const Text(
                          //     'Friday, May 23, 2025 at 9:00 AM',
                          //   ),
                          // );

                          // cek jika belum ada playlist maka set default
                          final countExpression = driftDb.playlistDrift.id
                              .count();

                          // Menggunakan selectOnly dan membaca hasilnya secara langsung
                          final count =
                              await (driftDb.selectOnly(driftDb.playlistDrift)
                                    ..addColumns([countExpression]))
                                  .map(
                                    (row) => row.read(countExpression),
                                  ) // Mengambil nilai count dari hasil
                                  .getSingle();

                          await driftDb
                              .into(driftDb.playlistDrift)
                              .insert(
                                PlaylistDriftCompanion.insert(
                                  id: drift.Value(playlistId),
                                  name: nameController.text.trim(),
                                  url: urlController.text.trim(),
                                  isActive: drift.Value(count == 0),
                                  type: drift.Value("m3u_playlist"),
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
