import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:pusoo/core/utils/theme_app.dart';
import 'package:pusoo/features/track/domain/models/track.dart';

class TvgLogoViewer extends StatelessWidget {
  final Track track;
  final double size;
  final bool showLabel;

  const TvgLogoViewer({
    super.key,
    required this.track,
    this.size = 120,
    this.showLabel = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: context.theme.colors.border, width: 1),
        color: context.theme.colors.disable(context.theme.colors.foreground),
      ),
      clipBehavior: Clip.antiAlias,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Stack(
          children: [
            SizedBox(
              width: size,
              height: size, // tinggi tetap
              child: track.tvgLogo.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: CachedNetworkImage(
                          imageUrl: track.tvgLogo,
                          placeholder: (_, __) =>
                              const Center(child: FProgress.circularIcon()),
                          errorWidget: (_, __, ___) => Center(
                            child: Icon(
                              FIcons.tvMinimal,
                              color: context.theme.colors.background.withAlpha(
                                200,
                              ),
                              size: 40,
                            ),
                          ),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    )
                  : Center(
                      child: Icon(
                        FIcons.tvMinimal,
                        size: 40,
                        color: context.theme.colors.background.withAlpha(200),
                      ),
                    ),
            ),
            showLabel
                ? Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      color: context.theme.colors.background.withAlpha(125),
                      child: Text(
                        track.tvgName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: context.theme.colors.foreground,
                          fontSize: CustomThemeData.fontSize.xs1,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
