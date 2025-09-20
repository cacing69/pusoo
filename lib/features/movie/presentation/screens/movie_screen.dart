import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:pusoo/features/movie/presentation/widgets/grid_track_widget.dart';
import 'package:pusoo/features/movie/presentation/widgets/list_track_widget.dart';
import 'package:pusoo/features/track/domain/models/track.dart';
// import 'package:pusoo/core/utils/m3u_parse.dart';
import 'package:pusoo/shared/data/datasources/local/drift/drift_database.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  void initState() {
    super.initState();

    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);

    loadM3U();
    // https://github.com/iptv-org/iptv/blob/master/streams/id.m3u
    //http://ogietv.biz.id:80/get.php?username=maksin&password=123456&type=m3u_plus&output=mpegts
  }

  List<Track> movies = [];
  Map<dynamic, dynamic> categories = {};

  Future<void> loadM3U() async {
    // const condition = drift.CustomExpression<bool>(
    //   '(tvg_id IS NULL OR tvg_id = "")',
    // );

    final filtered = [];
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
        title: const Text('Movies'),
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
          FTextField(hint: "Find something to watch..."),
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
                      crossAxisCount: 3,
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
