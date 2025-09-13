import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
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
            FTile(
              prefix: Icon(FIcons.listVideo),
              title: Text("Manage Playlist"),
              suffix: Icon(FIcons.chevronRight),
              onPress: () {
                context.pushNamed(RouteName.manageProvider.name);
              },
            ),
          ],
        ),
      ),
    );
  }
}
