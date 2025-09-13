import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:pusoo/router.dart';

class AddNewProviderScreen extends StatefulWidget {
  const AddNewProviderScreen({super.key});

  @override
  State<AddNewProviderScreen> createState() => _CreateNewPlaylistOptionState();
}

class _CreateNewPlaylistOptionState extends State<AddNewProviderScreen> {
  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader.nested(
        title: Text("Add Provider"),
        prefixes: [
          FHeaderAction.back(
            onPress: () {
              context.pop(false);
            },
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: FTileGroup(
          label: const Text('Playlist'),
          description: const Text(
            'http://provider/playlist.m3u (m3u8/otc/xml/etc..)',
          ),
          children: [
            FTile(
              prefix: Icon(FIcons.globe),
              title: const Text('URL Playlist'),
              subtitle: const Text('Lorem ipsum dolor site amet'),
              suffix: Icon(FIcons.chevronRight),
              onPress: () async {
                final result = await context.pushNamed(
                  RouteName.addPlaylist.name,
                );

                if (result is bool && result) {
                  if (context.mounted) {
                    context.pop(result);
                  }
                }
              },
            ),
            FTile(
              prefix: Icon(FIcons.fileSliders),
              title: const Text('Local Playlist'),
              subtitle: const Text('Lorem ipsum dolor site amet'),
              suffix: Icon(FIcons.chevronRight),
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}
