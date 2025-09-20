import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:pusoo/router.dart';

class ManagePersonalPlaylistScreen extends StatefulWidget {
  const ManagePersonalPlaylistScreen({super.key});

  @override
  State<ManagePersonalPlaylistScreen> createState() =>
      _ManagePersonalPlaylistScreenState();
}

class _ManagePersonalPlaylistScreenState
    extends State<ManagePersonalPlaylistScreen> {
  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader.nested(
        title: Text("Personal Playlist"),
        prefixes: [
          FHeaderAction.back(
            onPress: () {
              context.pop(false);
            },
          ),
        ],
        suffixes: [
          FHeaderAction(
            icon: Icon(FIcons.plus),
            onPress: () {
              context.pop(false);
            },
          ),
        ],
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          FItem(
            prefix: Icon(FIcons.listVideo),
            title: Text("Manage Personal Playlist"),
          ),
        ],
      ),
    );
  }
}
