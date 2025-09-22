/*
 * Pusoo - IPTV Player
 * Copyright (C) 2025 Ibnul Mutaki <ibnuul@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */


import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:pusoo/features/source/domain/entities/source.dart';
import 'package:pusoo/router.dart';

class AddNewSourceScreen extends StatefulWidget {
  const AddNewSourceScreen({super.key});

  @override
  State<AddNewSourceScreen> createState() => _CreateNewPlaylistOptionState();
}

class _CreateNewPlaylistOptionState extends State<AddNewSourceScreen> {
  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader.nested(
        title: Text("Add Source"),
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
                  extra: Source(isEmpty: true),
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
