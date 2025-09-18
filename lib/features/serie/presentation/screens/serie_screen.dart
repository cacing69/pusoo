import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pusoo/core/extensions/string_ext.dart';
// import 'package:pusoo/core/utils/m3u_parse.dart';
import 'package:pusoo/router.dart';
import 'package:pusoo/shared/data/datasources/local/drift/drift_database.dart';

class SerieScreen extends StatefulWidget {
  const SerieScreen({super.key});

  @override
  State<SerieScreen> createState() => _SerieScreenState();
}

class _SerieScreenState extends State<SerieScreen> {
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

  List<ChannelDriftData> series = [];

  List<ChannelDriftData> seriesTitle = [];

  Map<dynamic, dynamic> categories = {};

  Future<void> loadM3U() async {
    // const condition = drift.CustomExpression<bool>(
    //   '(tvg_id IS NULL OR tvg_id = "")',
    // );

    final filtered = await (driftDb.select(
      driftDb.channelDrift,
    )..where((tbl) => tbl.streamUrl.like("%series%"))).get();

    // seriesRow.then((data) {
    setState(() {
      series = filtered;

      // Flatten kategori yang dipisah titik koma
      List<Map> expandedSeries = [];

      for (var ch in filtered) {
        final rawCategories = ch.groupTitle?.split(';') ?? ["Miscellaneous"];
        for (var cat in rawCategories) {
          // buat salinan channel tapi dengan kategori tunggal
          final newCh = Map<String, dynamic>.from(ch.toJson());
          newCh['category'] = cat.trim();
          expandedSeries.add(newCh);
        }

        final String serieTitleCleaned = ch.name
            .replaceAll(RegExp(r'\s*S\d+E\d+', caseSensitive: false), '')
            .trim();

        bool exists = seriesTitle.any((v) => v.name == serieTitleCleaned);

        if (!exists) {
          seriesTitle.add(ch.copyWith(name: serieTitleCleaned));
        }
      }

      categories = groupBy(expandedSeries, (row) => row['category']);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isPotrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FScaffold(
      childPad: false,
      resizeToAvoidBottomInset: false,
      header: FHeader(
        title: const Text('Series'),
        suffixes: [
          FHeaderAction(
            icon: Icon(FIcons.menu, size: 25),
            onPress: () async {
              showFSheet(
                context: context,
                side: FLayout.ltr,
                useRootNavigator: true,
                useSafeArea: false,
                mainAxisMaxRatio: null,
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.8,
                  maxHeight: double.infinity,
                ),
                barrierDismissible: true,
                draggable: true,
                builder: (context) => FScaffold(
                  child: SafeArea(
                    child: Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Gap(10),
                            Text(
                              "Category",
                              style: context.theme.typography.base.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        FDivider(
                          style: (style) => style.copyWith(
                            padding: EdgeInsets.symmetric(vertical: 5),
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              spacing: 5,
                              children: [
                                FTile(
                                  prefix: Icon(FIcons.tags),
                                  title: Text("All Series"),
                                  suffix: Icon(FIcons.chevronRight),
                                  onPress: () async {
                                    // Bisa navigasi ke halaman detail channel per kategori
                                    debugPrint("All channel selected");

                                    final channelTv =
                                        await (driftDb.select(
                                              driftDb.channelDrift,
                                            )..where(
                                              (tbl) =>
                                                  tbl.tvgId.isNotNull() |
                                                  tbl.tvgId.isNotIn([""]),
                                            ))
                                            .get();

                                    // channelTv.then((data) {
                                    setState(() {
                                      series = channelTv;

                                      context.pop();
                                    });
                                    // });

                                    // setState(() {
                                    //   channels = categories[categoryName];
                                    // });
                                  },
                                ),
                                ...categories.keys.map((categoryName) {
                                  return FItem(
                                    prefix: Icon(FIcons.tag),
                                    title: Text(
                                      (categoryName as String)
                                          .capitalizeWords(),
                                    ),
                                    suffix: Icon(FIcons.chevronRight),
                                    onPress: () async {
                                      final channelTv =
                                          await (driftDb.select(
                                                driftDb.channelDrift,
                                              )..where(
                                                (tbl) => tbl.groupTitle.like(
                                                  "%$categoryName%",
                                                ),
                                              ))
                                              .get();

                                      // channelTv.then((data) {
                                      setState(() {
                                        series = channelTv;

                                        context.pop();
                                      });
                                      // });
                                    },
                                  );
                                }),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          FHeaderAction(
            icon: Icon(FIcons.power, size: 25),
            onPress: () async {
              // Hapus semua isi tabel 'playlist'
              await driftDb.delete(driftDb.playlistDrift).go();
              await driftDb.delete(driftDb.channelDrift).go();

              debugPrint("All rows has been deleted");

              loadM3U();
            },
          ),
          FHeaderAction(
            icon: Icon(FIcons.refreshCw, size: 25),
            onPress: () async {
              setState(() {
                series = [];
              });
              loadM3U();
            },
          ),
          FHeaderAction(
            icon: Icon(FIcons.plus),
            onPress: () async {
              final result = await context.pushNamed(
                RouteName.addPlaylist.name,
              );

              if (result is bool && result) {
                loadM3U();

                // showFToast(
                //   context: context,
                //   alignment: FToastAlignment.bottomCenter,
                //   title: const Text('Playlist Loaded'),
                //   description: const Text('Lorem ipsum dolor sit amet'),
                // );
              }
            },
          ),
        ],
      ),
      child: Column(
        spacing: 10,
        children: [
          FTextField(hint: "Find something to watch..."),
          Expanded(
            child: seriesTitle.isEmpty
                ? Center(child: FProgress.circularIcon())
                : GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isPotrait ? 4 : 8,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: seriesTitle.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // debugPrint(series[index].toString());

                          context.pushNamed(
                            RouteName.videoPlayer.name,
                            extra: seriesTitle[index],
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: context.theme.colors.border,
                              width: 1,
                            ),
                            color: context.theme.colors.disable(
                              context.theme.colors.foreground,
                            ),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height: 120, // tinggi tetap
                                  child:
                                      seriesTitle[index].logo?.isNotEmpty ??
                                          false
                                      ? Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            clipBehavior: Clip.antiAlias,
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  seriesTitle[index].logo ?? "",
                                              placeholder: (_, __) =>
                                                  const Center(
                                                    child:
                                                        FProgress.circularIcon(),
                                                  ),
                                              errorWidget: (_, __, ___) =>
                                                  Center(
                                                    child: Icon(
                                                      FIcons.imageOff,
                                                      color: context
                                                          .theme
                                                          .colors
                                                          .background
                                                          .withAlpha(200),
                                                      size: 40,
                                                    ),
                                                  ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )
                                      : Center(
                                          child: Icon(
                                            FIcons.imageOff,
                                            size: 40,
                                            color: context
                                                .theme
                                                .colors
                                                .background
                                                .withAlpha(200),
                                          ),
                                        ),
                                ),
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    padding: const EdgeInsets.all(6),
                                    color: context.theme.colors.background
                                        .withAlpha(125),
                                    child: Text(
                                      seriesTitle[index].name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: context.theme.colors.foreground,
                                        fontSize: context
                                            .theme
                                            .typography
                                            .xs
                                            .fontSize,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
