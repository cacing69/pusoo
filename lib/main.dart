import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:forui/forui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pusoo/router.dart';
import 'package:video_player_media_kit/video_player_media_kit.dart';

// import 'package:media_kit/media_kit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // inisialisasi binding
  // WidgetsFlutterBinding.ensureInitialized();

  // MediaKit.ensureInitialized();

  VideoPlayerMediaKit.ensureInitialized(
    android: true,
    // windows: true,
    // linux: true,
  );

  // Wajib: inisialisasi MediaKit sebelum dipakai
  // MediaKit.ensureInitialized();

  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);

  runApp(ProviderScope(child: Application()));
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = FThemes.zinc.dark;

    return MaterialApp.router(
      supportedLocales: FLocalizations.supportedLocales,
      localizationsDelegates: const [...FLocalizations.localizationsDelegates],
      builder: (_, child) => FTheme(data: theme, child: child!),
      theme: theme.toApproximateMaterialTheme(),
      routerConfig: router,
    );
  }
}
