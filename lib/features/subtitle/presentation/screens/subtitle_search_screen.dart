import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pusoo/core/utils/helpers.dart';
import 'package:pusoo/shared/presentation/providers/better_player_notifier.dart';

class SubtitleSearchScreen extends StatefulHookConsumerWidget {
  const SubtitleSearchScreen({super.key});

  @override
  ConsumerState<SubtitleSearchScreen> createState() =>
      _SubtitleSearchScreenState();
}

class _SubtitleSearchScreenState extends ConsumerState<SubtitleSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader.nested(
        title: Text("Search Subtitle"),
        prefixes: [
          FHeaderAction.back(
            onPress: () {
              context.pop(true);
            },
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 10,
            children: [
              Flexible(child: FTextField(label: Text("Search By"))),
              Flexible(child: FTextField(label: Text("Language"))),
            ],
          ),

          Gap(5),
          FTextField(label: Text("Query")),
          Gap(5),
          FButton(
            onPress: () {},
            prefix: Icon(FIcons.search),
            child: Text("Search"),
          ),
          FDivider(
            style: (style) =>
                style.copyWith(padding: EdgeInsets.symmetric(vertical: 5)),
          ),
          Text("Results"),
          FItem(
            prefix: Icon(FIcons.captions),
            title: Text("Subtitle 1"),
            suffix: Icon(FIcons.download),
            details: Text("English"),
            subtitle: Text("BLuray 1080HD"),

            onPress: () async {
              String subtitle =
                  // "https://gist.githubusercontent.com/cacing69/bee104dbd333b3fa98dab94c7673f1de/raw/f3eb6671a7c8f6d44080a877b8c6efd04f0332bf/gistfile1.txt";
                  "https://gist.githubusercontent.com/matibzurovski/d690d5c14acbaa399e7f0829f9d6888e/raw/63578ca30e7430be1fa4942d4d8dd599f78151c7/example.srt";

              final BetterPlayerSubtitlesSource subtitlesSource =
                  BetterPlayerSubtitlesSource(
                    type: BetterPlayerSubtitlesSourceType.network,
                    urls: [subtitle],
                  );

              // betterPlayerController.setupSubtitleSource(subtitlesSource);

              ref
                  .read(betterPlayerProvider.notifier)
                  .loadSubtitle(subtitlesSource);

              showFlutterToast(message: "Subtitle loaded", context: context);

              // context.pop();
              context.pop(true);
            },
          ),
        ],
      ),
    );
  }
}
