import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:pusoo/features/movie/presentation/widgets/grid_track_widget.dart';
import 'package:pusoo/features/movie/presentation/widgets/list_track_widget.dart';
import 'package:pusoo/features/track/domain/models/track.dart';

class SerieScreen extends StatefulWidget {
  const SerieScreen({super.key});

  @override
  State<SerieScreen> createState() => _SerieScreenState();
}

class _SerieScreenState extends State<SerieScreen> {
  @override
  void initState() {
    super.initState();
  }

  bool listViewMode = true;

  @override
  Widget build(BuildContext context) {
    final isPotrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FScaffold(
      childPad: false,
      resizeToAvoidBottomInset: false,
      header: FHeader(
        title: Row(
          children: [
            const Text('TV Series'),
            Gap(10),
            !isPotrait
                ? Expanded(
                    child: FTextField(hint: "Find something to watch..."),
                  )
                : SizedBox.shrink(),
          ],
        ),
        suffixes: [
          FHeaderAction(
            icon: Icon(listViewMode ? FIcons.grid2x2 : FIcons.rows3),
            onPress: () async {
              setState(() {
                listViewMode = !listViewMode;
              });
            },
          ),
        ],
      ),
      child: Column(
        spacing: 10,
        children: [
          isPotrait
              ? FTextField(hint: "Find something to watch...")
              : SizedBox.shrink(),
          Expanded(
            child: listViewMode
                ? ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      return ListTrackWidget(track: Track());
                    },
                  )
                : GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isPotrait ? 3 : 6,
                      childAspectRatio: 0.57,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      return GridTrackWidget(track: Track());
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
