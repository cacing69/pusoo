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
