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
import 'package:cached_network_image/cached_network_image.dart';
import 'package:forui/forui.dart';
import 'package:forui/theme.dart';
import 'package:gap/gap.dart';
import 'package:pusoo/features/track/domain/models/track.dart';

class ListTrackWidget extends StatefulWidget {
  final Track track;
  const ListTrackWidget({super.key, required this.track});

  @override
  State<ListTrackWidget> createState() => _ListTrackWidgetState();
}

class _ListTrackWidgetState extends State<ListTrackWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            height: 140,
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              clipBehavior: Clip.antiAlias,
              child: CachedNetworkImage(
                imageUrl:
                    "https://media.designrush.com/tinymce_images/205878/conversions/2.-Wendy-content.jpg",
                fit: BoxFit.cover,
                placeholder: (_, __) =>
                    const Center(child: FProgress.circularIcon()),
                errorWidget: (_, __, ___) => Center(
                  child: Icon(
                    FIcons.imageOff,
                    color: context.theme.colors.background.withAlpha(200),
                    size: 40,
                  ),
                ),
              ),
            ),
          ),
          Gap(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Commodo est fugiat sunt ipsum veniam sit adipisicing.",
                  style: context.theme.typography.base.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(5),
                Text(
                  "Action",
                  style: context.theme.typography.sm.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Gap(5),
                Text(
                  "@tvg-id: n/a",
                  style: context.theme.typography.xs.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
