import 'dart:convert';

import 'package:drift/drift.dart' as drift;
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pusoo/core/utils/m3u_parse.dart';
import 'package:pusoo/shared/data/datasources/local/drift_database.dart';
import 'package:http/http.dart' as http;
import 'package:ulid/ulid.dart';

class AddPlaylistScreen extends StatefulHookConsumerWidget {
  const AddPlaylistScreen({super.key});

  @override
  ConsumerState<AddPlaylistScreen> createState() => _AddPlaylistScreenState();
}

class _AddPlaylistScreenState extends ConsumerState<AddPlaylistScreen> {
  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final urlController = useTextEditingController();
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
          FTextField(
            controller: nameController,
            label: Text("Name"),
            description: Text("Lorem ipsum dolor sit amet"),
          ),
          FTextField.multiline(
            controller: urlController,
            label: Text("URL"),
            minLines: 5,
            description: Text("Lorem ipsum dolor sit amet"),
          ),
          FTextField.multiline(
            controller: epgLinkController,
            label: Text("EPG Link (Optional)"),
            minLines: 3,
            description: Text("Lorem ipsum dolor sit amet"),
          ),
          Gap(10),
          SafeArea(
            child: FButton(
              onPress: () async {
                // await managers.users.create(
                //   (row) => row(username: 'firstuser'),
                // );

                final String playlistId = Ulid().toString();

                // cek jika belum ada playlist maka set default
                final countExpression = driftDb.playlistDrift.id.count();

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

                    final Map<String, dynamic> channel = M3uUtils.parse(
                      content,
                    );

                    debugPrint(
                      "channel[items].runtimeType.toString() : ${channel["items"].runtimeType.toString()}",
                    );

                    await driftDb.batch((batch) {
                      batch.insertAll(
                        driftDb.channelDrift,
                        channel["items"].map<ChannelDriftCompanion>((ch) {
                          // debugPrint(ch.toString());

                          return ChannelDriftCompanion(
                            id: drift.Value(Ulid().toString()),
                            playlistId: drift.Value(playlistId),
                            name: drift.Value(ch["name"]),
                            tvgId: drift.Value(ch["tvgId"]),
                            logo: drift.Value(ch["tvgLogo"]),
                            groupTitle: drift.Value(ch["groupTitle"]),
                            streamUrl: drift.Value(jsonEncode(ch["urls"])),
                          );
                        }).toList(),
                      );
                    });

                    debugPrint('Channel Saved!');
                    nameController.text = "";
                    urlController.text = "";

                    // showFToast(
                    //   context: context,
                    //   alignment: FToastAlignment.bottomCenter,
                    //   title: const Text('Playlist Saved'),
                    //   description: const Text(
                    //     'Friday, May 23, 2025 at 9:00 AM',
                    //   ),
                    // );

                    if (context.mounted) {
                      context.pop(true);
                    }
                  } else {
                    throw Exception('Failed to load M3U');
                  }
                } catch (e) {
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
