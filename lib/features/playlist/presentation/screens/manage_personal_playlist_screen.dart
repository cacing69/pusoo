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
