import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:forui/theme.dart';
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
                    imageUrl:
                        "https://m.media-amazon.com/images/I/71OZeGjkmbL._UF894,1000_QL80_.jpg",
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
                          "Action",
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
            "Do non aliquip officia ipsum in deserunt magna.",

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
