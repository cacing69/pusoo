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
import 'package:pusoo/features/source/data/const/github_sources.dart';
import 'package:pusoo/features/source/data/const/public_sources.dart';
import 'package:pusoo/router.dart';

class PublicSourceListScreen extends StatefulWidget {
  const PublicSourceListScreen({super.key});

  @override
  State<PublicSourceListScreen> createState() => _PublicSourceListScreenState();
}

class _PublicSourceListScreenState extends State<PublicSourceListScreen> {
  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader.nested(
        title: Text("Public Sources"),
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
          Text("Public Sources", style: TextStyle(fontWeight: FontWeight.w600)),
          FItemGroup(
            children: [
              ...publicSources.map(
                (source) => FItem(
                  prefix: Icon(FIcons.folderRoot),
                  title: Text(source.name!),
                  subtitle: Text(source.homepage!),
                  suffix: Icon(FIcons.chevronRight),
                  onPress: () {
                    context.pushNamed(
                      RouteName.publicSourcesPlaylist.name,

                      extra: source,
                    );
                  },
                ),
              ),
            ],
          ),
          FDivider(
            style: (style) =>
                style.copyWith(padding: EdgeInsets.symmetric(vertical: 5)),
          ),
          Text("Github Sources", style: TextStyle(fontWeight: FontWeight.w600)),
          FItemGroup(
            children: [
              ...githubSources.map(
                (source) => FItem(
                  prefix: Icon(FIcons.folderRoot),
                  title: Text(source.name!),
                  subtitle: Text(source.homepage!),
                  suffix: Icon(FIcons.chevronRight),
                  onPress: () {
                    context.pushNamed(
                      RouteName.publicSourcesPlaylist.name,

                      extra: source,
                    );
                  },
                ),
              ),

              // FItem(
              //   prefix: Icon(FIcons.folderRoot),
              //   title: Text("hujingguang/ChinaIPTV"),
              //   subtitle: Text("https://github.com/hujingguang/ChinaIPTV"),
              //   suffix: Icon(FIcons.chevronRight),
              // ),

              // FItem(
              //   prefix: Icon(FIcons.folderRoot),
              //   title: Text("ghokun/tv"),
              //   subtitle: Text("https://github.com/ghokun/tv"),
              //   suffix: Icon(FIcons.chevronRight),
              // ),

              // FItem(
              //   prefix: Icon(FIcons.folderRoot),
              //   title: Text("tecotv2025/tecotv"),
              //   subtitle: Text("https://github.com/tecotv2025/tecotv"),
              //   suffix: Icon(FIcons.chevronRight),
              // ),

              // FItem(
              //   prefix: Icon(FIcons.folderRoot),
              //   title: Text("bugsfreeweb/LiveTVCollector"),
              //   subtitle: Text(
              //     "https://github.com/bugsfreeweb/LiveTVCollector",
              //   ),
              //   suffix: Icon(FIcons.chevronRight),
              // ),
              // FItem(
              //   prefix: Icon(FIcons.folderRoot),
              //   title: Text("konanda-sg/DrewLive"),
              //   subtitle: Text(
              //     "https://github.com/konanda-sg/DrewLive",
              //   ),
              //   suffix: Icon(FIcons.chevronRight),
              // ),
              // FItem(
              //   prefix: Icon(FIcons.folderRoot),
              //   title: Text("abusaeeidx/IPTV-Scraper-Zilla"),
              //   subtitle: Text(
              //     "https://github.com/abusaeeidx/IPTV-Scraper-Zilla",
              //   ),
              //   suffix: Icon(FIcons.chevronRight),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
