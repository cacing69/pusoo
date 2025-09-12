import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart' as widget;
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
  widget.Widget build(widget.BuildContext context) {
    final nameController = useTextEditingController();
    final urlController = useTextEditingController(
      // text: "https://iptv-org.github.io/iptv/languages/ind.m3u",
    );

    return FScaffold(
      header: FHeader.nested(
        title: widget.Text("Add Playlist"),
        prefixes: [
          FHeaderAction.back(
            onPress: () {
              context.pop();
            },
          ),
        ],
      ),
      child: widget.Column(
        spacing: 10,
        children: [
          FTextField(controller: nameController, label: widget.Text("Name")),
          FTextField.multiline(
            controller: urlController,
            label: widget.Text("URL"),
            minLines: 10,
          ),
          widget.Spacer(),
          widget.SafeArea(
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
                        id: Value(playlistId),
                        name: nameController.text,
                        url: urlController.text,
                      ),
                    );

                debugPrint('Playlist Saved!');

                // Save Channels
                try {
                  final response = await http.get(
                    Uri.parse(urlController.text),
                  );

                  if (response.statusCode == 200) {
                    // debugPrint(response.body);
                    final dynamic channel = M3uUtils.parse(response.body);

                    debugPrint(channel["items"].runtimeType.toString());

                    await driftDb.batch((batch) {
                      batch.insertAll(
                        driftDb.channel,
                        channel["items"]
                            .map<ChannelCompanion>(
                              (ch) => ChannelCompanion(
                                id: Value(Ulid().toString()),
                                playlistId: Value(playlistId),
                                name: Value(ch["name"]),
                                tvgId: Value(ch["tvg-id"]),
                                logo: Value(ch["tvg-logo"]),
                                category: Value(ch["group-title"]),
                                streamUrl: Value(jsonEncode(ch["urls"])),
                              ),
                            )
                            .toList(),
                      );
                    });

                    debugPrint('Channel Saved!');
                    nameController.text = "";
                    urlController.text = "";

                    // showFToast(
                    //   context: context,
                    //   alignment: FToastAlignment.bottomCenter,
                    //   title: const widget.Text('Playlist Saved'),
                    //   description: const widget.Text(
                    //     'Friday, May 23, 2025 at 9:00 AM',
                    //   ),
                    // );
                  } else {
                    throw Exception('Failed to load M3U');
                  }
                } catch (e) {
                  debugPrint('Error loading M3U: $e');
                }
              },
              child: widget.Text("Save"),
            ),
          ),
          Gap(10),
        ],
      ),
    );
  }
}
