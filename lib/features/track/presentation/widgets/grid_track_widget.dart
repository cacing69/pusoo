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

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:pusoo/features/track/domain/models/track.dart';

class GridTrackWidget extends StatefulWidget {
  final Track track;
  const GridTrackWidget({super.key, required this.track});

  @override
  State<GridTrackWidget> createState() => _GridTrackWidgetState();
}

class _GridTrackWidgetState extends State<GridTrackWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.track.tvgLogo,
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
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(4),
                        ),
                        color: context.theme.colors.background.withAlpha(160),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          widget.track.groupTitle.isNotEmpty
                              ? widget.track.groupTitle.substring(
                                  0,
                                  widget.track.groupTitle.length > 15
                                      ? 15
                                      : widget.track.groupTitle.length,
                                )
                              : "-",
                          style: context.theme.typography.xs.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Text(
            widget.track.title,

            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.theme.typography.base.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
