import 'dart:convert';

import 'package:drift/drift.dart' as drift;
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pusoo/core/utils/m3u_parse.dart';
import 'package:pusoo/shared/data/datasources/drift_database.dart';
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
    final urlController = useTextEditingController(text: "");

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
      child: Column(
        spacing: 10,
        children: [
          FTextField(controller: nameController, label: Text("Name")),
          FTextField.multiline(
            controller: urlController,
            label: Text("URL"),
            minLines: 10,
          ),
          Spacer(),
          SafeArea(
            child: FButton(
              onPress: () async {
                // await managers.users.create(
                //   (row) => row(username: 'firstuser'),
                // );

                final String playlistId = Ulid().toString();

                await driftDb
                    .into(driftDb.playlist)
                    .insert(
                      PlaylistCompanion.insert(
                        id: drift.Value(playlistId),
                        name: nameController.text.trim(),
                        url: urlController.text.trim(),
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
                        driftDb.channel,
                        channel["items"].map<ChannelCompanion>((ch) {
                          // debugPrint(ch.toString());

                          return ChannelCompanion(
                            id: drift.Value(Ulid().toString()),
                            playlistId: drift.Value(playlistId),
                            name: drift.Value(ch["name"]),
                            tvgId: drift.Value(ch["tvgId"]),
                            logo: drift.Value(ch["tvgLogo"]),
                            category: drift.Value(ch["groupTitle"]),
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
