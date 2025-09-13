import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:forui/widgets/scaffold.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeIframePlayerScreen extends StatefulWidget {
  final String videoId;
  final String? title;
  const YoutubeIframePlayerScreen({
    super.key,
    required this.videoId,
    this.title,
  });

  @override
  State<YoutubeIframePlayerScreen> createState() =>
      _YoutubeIframePlayerScreenState();
}

class _YoutubeIframePlayerScreenState extends State<YoutubeIframePlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.videoId,
      autoPlay: true,
      params: const YoutubePlayerParams(
        showFullscreenButton: true,
        showControls: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader.nested(
        title: Text("Trailer"),
        prefixes: [
          FHeaderAction.back(
            onPress: () {
              context.pop(false);
            },
          ),
        ],
      ),
      child: YoutubePlayerScaffold(
        aspectRatio: 16 / 9,
        builder: (context, player) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              player,
              Gap(5),
              Text(widget.title!),
              Gap(5),
              FButton(
                style: FButtonStyle.outline(),
                onPress: () async {
                  // URL untuk aplikasi YouTube
                  final Uri youtubeAppUrl = Uri.parse(
                    'youtube://watch?v=${widget.videoId}',
                  );

                  // URL fallback untuk browser atau web view
                  final Uri youtubeWebUrl = Uri.parse(
                    'https://www.youtube.com/watch?v=${widget.videoId}',
                  );

                  if (await canLaunchUrl(youtubeAppUrl)) {
                    await launchUrl(
                      youtubeAppUrl,
                      mode: LaunchMode.externalApplication,
                    );
                  } else if (await canLaunchUrl(youtubeWebUrl)) {
                    await launchUrl(
                      youtubeWebUrl,
                      mode: LaunchMode.externalApplication,
                    );
                  } else {
                    throw 'Could not launch $youtubeWebUrl';
                  }
                },
                prefix: Icon(FIcons.youtube),
                child: Text("Open in Youtube"),
              ),
              Gap(10),
              Text("Other Trailers"),
              Gap(5),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10,
                        children: [
                          SizedBox(
                            width: 120,
                            height: 80,
                            child: Placeholder(),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "Exercitation do ullamco quis est. Consequat duis ea tempor ut id voluptate sit do dolore anim cupidatat officia. Eu dolor est Lorem aute non magna. Aute cillum reprehenderit voluptate quis consequat voluptate veniam velit fugiat fugiat esse in reprehenderit ullamco.",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Gap(5),
                                Text(
                                  "Exercitation do ullamco quis est. Consequat duis ea tempor ut id voluptate sit do dolore anim cupidatat officia. Eu dolor est Lorem aute non magna. Aute cillum reprehenderit voluptate quis consequat voluptate veniam velit fugiat fugiat esse in reprehenderit ullamco.",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.theme.typography.xs.copyWith(
                                    color: context.theme.colors.disable(
                                      context.theme.colors.foreground,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        controller: _controller,
      ),
    );
  }
}
