import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pusoo/features/track/presentation/widgets/grid_track_widget.dart';
import 'package:pusoo/features/track/presentation/widgets/list_track_widget.dart';

class PagedTrackView extends StatefulWidget {
  final bool isListView;
  final PagingState pagingState;
  final Function() fetchNextPage;
  const PagedTrackView({
    super.key,
    this.isListView = true,
    required this.pagingState,
    required this.fetchNextPage,
  });

  @override
  State<PagedTrackView> createState() => _PagedTrackViewState();
}

class _PagedTrackViewState extends State<PagedTrackView> {
  @override
  Widget build(BuildContext context) {
    final isPotrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return widget.isListView
        ? PagedListView(
            padding: EdgeInsets.zero,
            state: widget.pagingState,
            fetchNextPage: widget.fetchNextPage,
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (context, dynamic item, index) =>
                  ListTrackWidget(track: item),
              firstPageProgressIndicatorBuilder: (context) =>
                  FProgress.circularIcon(),
              newPageProgressIndicatorBuilder: (context) =>
                  FProgress.circularIcon(),
            ),
          )
        : PagedGridView(
            padding: EdgeInsets.zero,
            state: widget.pagingState,
            fetchNextPage: widget.fetchNextPage,
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (context, dynamic item, index) =>
                  GridTrackWidget(track: item),
              firstPageProgressIndicatorBuilder: (context) => SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: AspectRatio(
                  aspectRatio: 0.5,
                  child: Center(child: FProgress.circularIcon()),
                ),
              ),
              newPageProgressIndicatorBuilder: (context) => SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: AspectRatio(
                  aspectRatio: 0.5,
                  child: Center(child: FProgress.circularIcon()),
                ),
              ),
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isPotrait ? 3 : 6,
              childAspectRatio: 0.52,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
          );
  }
}
