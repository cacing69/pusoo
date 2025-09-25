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

import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:pusoo/features/track/domain/models/track.dart';
import 'package:pusoo/router.dart';

class SerieDetailScreen extends StatefulWidget {
  final Track track;

  const SerieDetailScreen({super.key, required this.track});

  @override
  State<SerieDetailScreen> createState() => _SerieDetailScreenState();
}

class _SerieDetailScreenState extends State<SerieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return FScaffold(
      child: ListView(
        children: [
          Placeholder(),
          FButton(
            style: FButtonStyle.outline(),
            prefix: Icon(FIcons.play),
            onPress: () {
              context.pushNamed(
                RouteName.videoPlayer.name,
                extra: widget.track,
                queryParameters: {"isLiveStream": "false"},
              );
            },
            child: Text("Watch Now"),
          ),
        ],
      ),
    );
  }
}
