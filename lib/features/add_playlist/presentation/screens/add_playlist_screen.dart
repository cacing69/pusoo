import 'package:drift/drift.dart';
import 'package:flutter/widgets.dart' as widget;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
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
    final urlController = useTextEditingController();

    return FScaffold(
      header: FHeader.nested(title: widget.Text("Add Playlist")),
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

                await AppDatabase()
                    .into(AppDatabase().playlist)
                    .insert(
                      PlaylistCompanion.insert(
                        id: Value(playlistId),
                        name: nameController.text,
                        url: urlController.text,
                      ),
                    );

                // Save Channels
                try {
                  final response = await http.get(
                    Uri.parse(nameController.text),
                  );

                  if (response.statusCode == 200) {
                    // debugPrint(response.body);
                    final channel = M3uUtils.parse(response.body);

                    await AppDatabase().batch((batch) {
                      batch.insertAll(
                        AppDatabase().channel,
                        channel["items"].map(
                          (ch) => ChannelCompanion(
                            id: Value(Ulid().toString()),
                            playlistId: Value(playlistId),
                            name: ch["name"] ?? "-",
                            tvgId: ch["tvg-id"] ?? "-",
                            logo: ch["tvg-logo"] ?? "",
                            category: ch["group-title"] ?? "",
                          ),
                        ),
                      );
                    });
                  } else {
                    throw Exception('Failed to load M3U');
                  }
                } catch (e) {
                  print('Error loading M3U: $e');
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
