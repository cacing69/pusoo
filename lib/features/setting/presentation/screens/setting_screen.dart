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
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pusoo/router.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(title: const Text('Setting')),
      child: SingleChildScrollView(
        child: Column(
          children: [
            FTileGroup(
              label: Text("Source"),
              children: [
                FTile(
                  prefix: Icon(FIcons.database),
                  title: Text("Manage Sources"),
                  suffix: Icon(FIcons.chevronRight),
                  onPress: () {
                    context.pushNamed(RouteName.manageSource.name);
                  },
                ),
                FTile(
                  prefix: Icon(FIcons.userPen),
                  title: Text("Personal Playlist"),
                  suffix: Icon(FIcons.chevronRight),
                  onPress: () {
                    context.pushNamed(RouteName.managerPeronalPlaylist.name);
                  },
                ),
                FTile(
                  prefix: Icon(FIcons.serverCog),
                  title: Text("Public Sources"),
                  subtitle: Text("Browse freely available information sources"),
                  suffix: Icon(FIcons.chevronRight),
                  onPress: () {
                    context.pushNamed(RouteName.publicSources.name);
                  },
                ),
              ],
            ),
            Gap(10),
            FTileGroup(
              label: Text("General Settings"),
              children: [
                FTile(
                  prefix: Icon(FIcons.swatchBook),
                  title: Text("Visual Setting"),
                  suffix: Icon(FIcons.chevronRight),
                  onPress: () {},
                ),
                FTile(
                  prefix: Icon(FIcons.captions),
                  title: Text("Subtitle Setting"),
                  suffix: Icon(FIcons.chevronRight),
                  onPress: () {},
                ),
                FTile(
                  prefix: Icon(FIcons.earth),
                  title: Text("Activate TMDB"),
                  suffix: Icon(FIcons.chevronRight),
                  onPress: () {},
                ),
                FTile(
                  prefix: Icon(FIcons.info),
                  title: Text("About"),
                  suffix: Icon(FIcons.chevronRight),
                  onPress: () {
                    context.pushNamed(RouteName.about.name);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
