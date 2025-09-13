import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:pusoo/shared/data/datasources/drift_database.dart';

class TvPlayerScreen extends StatefulWidget {
  final ChannelData channel;
  const TvPlayerScreen({super.key, required this.channel});

  @override
  State<TvPlayerScreen> createState() => _TvPlayerScreenState();
}

class _TvPlayerScreenState extends State<TvPlayerScreen> {
  late Player _player;

  late VideoController controller;

  bool _isBuffering = true;

  @override
  void initState() {
    super.initState();

    _player = Player();

    _player.stream.buffering.listen((isPlaying) {
      if (isPlaying && _isBuffering) {
        setState(() {
          _isBuffering = false;
        });
      }
    });

    final List urls = (jsonDecode(widget.channel.streamUrl) as List<dynamic>);
    // debugPrint("urls.toString(): $urls");

    _player.open(Media(urls.first));

    controller = VideoController(_player);
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader.nested(
        title: Text("Pusoo IPTV"),
        prefixes: [
          FHeaderAction.back(
            onPress: () {
              context.pop();
            },
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 9.0 / 16.0,
                child: _isBuffering
                    ? Center(child: FProgress.circularIcon())
                    : Video(controller: controller),
              ),
            ],
          ),

          FDivider(),
          Expanded(child: buildDescription(widget.channel)),
        ],
      ),
    );
  }

  Widget buildDescription(ChannelData channel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            SizedBox(
              width: 45,
              height: 45,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: context.theme.colors.disable(
                    context.theme.colors.foreground,
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: context.theme.colors.disable(
                        context.theme.colors.foreground,
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: CachedNetworkImage(
                      imageUrl: channel.logo ?? "",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    channel.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                  Text(
                    channel.tvgId ?? channel.name,
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
        Expanded(
          child: Center(
            child: Text(
              "No Information",
              style: context.theme.typography.base.copyWith(
                color: context.theme.colors.disable(
                  context.theme.colors.foreground,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
