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
                  prefix: Icon(FIcons.listVideo),
                  title: Text("Manage Sources"),
                  suffix: Icon(FIcons.chevronRight),
                  onPress: () {
                    context.pushNamed(RouteName.manageSource.name);
                  },
                ),
                FTile(
                  prefix: Icon(FIcons.compass),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
