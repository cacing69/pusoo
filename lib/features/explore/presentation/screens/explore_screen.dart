import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pusoo/router.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(title: Text("Explore")),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5,
          children: [
            Icon(FIcons.globe, size: 120),
            Text(
              "Pusoo TV",
              style: context.theme.typography.xl3.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Discover all tracks in your saved playlists"),
            Gap(5),
            FButton(
              style: FButtonStyle.outline(),
              onPress: () {
                // context.pushNamed(RouteName.)
              },
              prefix: Icon(FIcons.search),
              child: Text("Explore Now"),
            ),
          ],
        ),
      ),
    );
  }
}
