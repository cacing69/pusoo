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
