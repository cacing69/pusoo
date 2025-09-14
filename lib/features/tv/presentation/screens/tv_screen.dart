import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pusoo/core/extensions/string_ext.dart';
// import 'package:pusoo/core/utils/m3u_parse.dart';
import 'package:pusoo/router.dart';
import 'package:pusoo/shared/data/datasources/local/drift_database.dart';

class TvScreen extends StatefulHookConsumerWidget {
  const TvScreen({super.key});

  @override
  ConsumerState<TvScreen> createState() => _TvScreenState();
}

class _TvScreenState extends ConsumerState<TvScreen> {
  final Debouncer _debouncer = Debouncer();
  final Duration _debounceDuration = const Duration(milliseconds: 500);

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

  List<ChannelDriftData> channels = [];
  Map<dynamic, dynamic> categories = {};

  Future<void> loadM3U({String? search}) async {
    final test = await (driftDb.select(driftDb.channelDrift)).get();

    debugPrint("test.toString() : $test");

    // get playlist selected
    final selectedPlaylist = await (driftDb.select(
      driftDb.playlistDrift,
    )..where((tbl) => tbl.isActive.equals(true))).get();

    if (selectedPlaylist.isNotEmpty) {
      final String playlistId = selectedPlaylist.first.id;

      // maksin pattern
      late final filtered;

      if (search != null) {
        filtered =
            await (driftDb.select(driftDb.channelDrift)..where(
                  (tbl) =>
                      tbl.playlistId.equals(playlistId) &
                      tbl.streamUrl.like('%movie%').not() &
                      tbl.streamUrl.like('%series%').not() &
                      tbl.name.like('%$search%'),
                ))
                .get();
      } else {
        filtered =
            await (driftDb.select(driftDb.channelDrift)..where(
                  (tbl) =>
                      tbl.playlistId.equals(playlistId) &
                      tbl.streamUrl.like('%movie%').not() &
                      tbl.streamUrl.like('%series%').not(),
                ))
                .get();
      }

      // channelTv.then((data) {
      setState(() {
        channels = filtered;

        // Flatten kategori yang dipisah titik koma
        List<Map> expandedChannels = [];

        for (var ch in filtered) {
          final rawCategories = ch.category?.split(';') ?? ["Miscellaneous"];
          for (var cat in rawCategories) {
            // buat salinan channel tapi dengan kategori tunggal
            final newCh = Map<String, dynamic>.from(ch.toJson());
            newCh['category'] = cat.trim();
            expandedChannels.add(newCh);
          }
        }

        categories = groupBy(expandedChannels, (row) => row['category']);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();

    // final screenWidth = MediaQuery.of(context).size.width;
    final isPotrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    // final double itemWidth = 120;
    // final int crossAxisCount = (screenWidth / itemWidth).floor();

    return FScaffold(
      resizeToAvoidBottomInset: false,
      header: FHeader(
        title: const Text('Live TV'),
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
                              spacing: 0,
                              children: [
                                FItem(
                                  prefix: Icon(FIcons.tags),
                                  title: Text("All Channel"),
                                  suffix: Icon(FIcons.chevronRight),
                                  onPress: () async {
                                    // Bisa navigasi ke halaman detail channel per kategori
                                    debugPrint("All channel selected");

                                    final filtered =
                                        await (driftDb.select(
                                              driftDb.channelDrift,
                                            )..where(
                                              (tbl) =>
                                                  tbl.streamUrl
                                                      .like('%movie%')
                                                      .not() &
                                                  tbl.streamUrl
                                                      .like('%series%')
                                                      .not(),
                                            ))
                                            .get();

                                    // channelTv.then((data) {
                                    setState(() {
                                      channels = filtered;

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
                                        channels = channelTv;

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
                channels = [];
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

                if (context.mounted) {
                  // showFToast(
                  //   context: context,
                  //   alignment: FToastAlignment.topCenter,
                  //   title: const Text('Playlist Loaded'),
                  //   description: const Text('Lorem ipsum dolor sit amet'),
                  // );
                }
              }
            },
          ),
        ],
      ),
      child: Column(
        spacing: 0,
        children: [
          FTile(
            prefix: SizedBox(
              width: 20,
              height: 20,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green[800],
                ),
              ),
            ),
            title: Text("IPTV-ORG COUNTRY"),
            // subtitle: Text("Active playlist"),
            subtitle: Text("2.250 channel"),
            suffix: Icon(FIcons.chevronRight),
            onPress: () async {
              showFDialog(
                context: context,
                builder: (context, style, animation) => FDialog(
                  animation: animation,
                  direction: Axis.horizontal,
                  title: const Text('Change playlist'),
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FDivider(
                        style: (style) => style.copyWith(
                          padding: EdgeInsets.symmetric(vertical: 5),
                        ),
                      ),
                      FItemGroup(
                        children: [
                          FItem(
                            prefix: Icon(FIcons.circleDashed),
                            title: Text("IPTV-ORG ID"),
                            suffix: Icon(FIcons.check),
                            onPress: () async {
                              // update data old selected as false
                              // await (driftDb.update(driftDb.playlist)..where(
                              //       (tbl) => tbl.isSelected.equals(true),
                              //     ))
                              //     .write(
                              //       const PlaylistCompanion(
                              //         isSelected: drift.Value(false),
                              //       ),
                              //     );

                              // update data old selected as false
                              // await (driftDb.update(
                              //   driftDb.playlist,
                              // )..where((tbl) => tbl.id.equals(e.id))).write(
                              //   const PlaylistCompanion(
                              //     isSelected: drift.Value(true),
                              //   ),
                              // );

                              // loadPlaylist();

                              if (context.mounted) {
                                context.pop();

                                // showFToast(
                                //   context: context,
                                //   alignment:
                                //       FToastAlignment
                                //           .topCenter,
                                //   title: Text(
                                //     "Set ${e.name} as active playlist",
                                //   ),
                                // );
                                // showFlutterToast(
                                //   context: context,
                                //   message: "Set ${e.name} as active playlist",
                                // );
                              }
                            },
                          ),
                          FItem(
                            prefix: Icon(FIcons.circleDashed),
                            title: Text("IPTV-ORG MY"),
                            onPress: () async {
                              // delete channel first
                              // await (driftDb.delete(
                              //   driftDb.playlist,
                              // )..where((tbl) => tbl.id.equals(e.id))).go();

                              // // delete channel first
                              // await (driftDb.delete(driftDb.channel)..where(
                              //       (tbl) => tbl.playlistId.equals(e.id),
                              //     ))
                              //     .go();

                              // loadPlaylist();

                              if (context.mounted) {
                                context.pop();

                                // showFToast(
                                //   context: context,
                                //   alignment:
                                //       FToastAlignment
                                //           .topCenter,
                                //   title: Text(
                                //     "Removed ${e.name} from playlist",
                                //   ),
                                // );
                                // showFlutterToast(
                                //   context: context,
                                //   message: "Removed ${e.name} from playlist",
                                // );
                              }
                            },
                          ),
                          FItem(
                            prefix: Icon(FIcons.circleDashed),
                            title: Text("IPTV-ORG PE"),
                            onPress: () async {
                              // delete channel first
                              // await (driftDb.delete(
                              //   driftDb.playlist,
                              // )..where((tbl) => tbl.id.equals(e.id))).go();

                              // // delete channel first
                              // await (driftDb.delete(driftDb.channel)..where(
                              //       (tbl) => tbl.playlistId.equals(e.id),
                              //     ))
                              //     .go();

                              // loadPlaylist();

                              if (context.mounted) {
                                context.pop();

                                // showFToast(
                                //   context: context,
                                //   alignment:
                                //       FToastAlignment
                                //           .topCenter,
                                //   title: Text(
                                //     "Removed ${e.name} from playlist",
                                //   ),
                                // );
                                // showFlutterToast(
                                //   context: context,
                                //   message: "Removed ${e.name} from playlist",
                                // );
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  actions: [
                    FButton(
                      style: FButtonStyle.outline(),
                      onPress: () => context.pop(),
                      child: const Text('Close'),
                    ),
                  ],
                ),
              );
            },
          ),
          Gap(5),
          FTextField(
            controller: searchController,
            hint: "Find something to watch...",
            label: Text("Search"),
            clearable: (e) => e.text.isNotEmpty,
            onChange: (String value) {
              _debouncer.debounce(
                duration: _debounceDuration,
                onDebounce: () async {
                  // await ref
                  //     .read(blockNominatimSearchNotifierProvider.notifier)
                  //     .perform(query.text);
                  // completer.complete();
                  // debugPrint(value);
                  loadM3U(search: value);
                },
              );
            },
          ),
          Gap(10),
          Expanded(
            child: channels.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("No Data"),
                        Gap(10),
                        SizedBox(
                          width: 100,
                          child: FButton(
                            style: FButtonStyle.outline(),
                            onPress: () {
                              loadM3U();
                            },
                            child: Text("Refresh"),
                          ),
                        ),
                      ],
                    ),
                  )
                : GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isPotrait ? 4 : 8,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 1,
                    ),
                    itemCount: channels.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // debugPrint(series[index].toString());

                          context.pushNamed(
                            RouteName.tvPlayer.name,
                            extra: channels[index],
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
                                      channels[index].logo?.isNotEmpty ?? false
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
                                                  channels[index].logo ?? "",
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
                                              fit: BoxFit.fitWidth,
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
                                      channels[index].name,
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
