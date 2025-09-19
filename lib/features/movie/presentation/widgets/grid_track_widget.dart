import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
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
                          SizedBox(
                            width: double.infinity,
                            height: 170,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl:
                                            "https://media.designrush.com/tinymce_images/205878/conversions/2.-Wendy-content.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                      Positioned(
                                        right: 0,
                                        top: 0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(4),
                                            ),
                                            color: context
                                                .theme
                                                .colors
                                                .background
                                                .withAlpha(160),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              "Action",
                                              style: context.theme.typography.xs
                                                  .copyWith(
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