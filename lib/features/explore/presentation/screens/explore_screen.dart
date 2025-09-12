import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
// import 'package:pusoo/core/utils/m3u_parse.dart';
import 'package:pusoo/router.dart';
import 'package:pusoo/shared/data/datasources/drift_database.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadM3U();
    // https://github.com/iptv-org/iptv/blob/master/streams/id.m3u
    //http://ogietv.biz.id:80/get.php?username=maksin&password=123456&type=m3u_plus&output=mpegts
  }

  List<ChannelData> channels = [];
  Map<dynamic, dynamic> categories = {};

  Future<void> loadM3U() async {
    // try {
    //   final response = await http.get(
    //     Uri.parse("https://iptv-org.github.io/iptv/languages/ind.m3u"),
    //   );
    //   if (response.statusCode == 200) {
    //     // debugPrint(response.body);
    //     final channel = M3uUtils.parse(response.body);

    //     debugPrint(channel["items"].toString());

    //     setState(() {
    //       // channels = urls;
    //       channels = List<Map<String, dynamic>>.from(channel["items"]);
    //     });
    //   } else {
    //     throw Exception('Failed to load M3U');
    //   }
    // } catch (e) {
    //   print('Error loading M3U: $e');
    // }

    final channelTv = await (driftDb.select(
      driftDb.channel,
    )..where((tbl) => tbl.tvgId.isNotNull())).get();

    // channelTv.then((data) {
    setState(() {
      channels = channelTv;

      // Flatten kategori yang dipisah titik koma
      List<Map> expandedChannels = [];

      for (var ch in channelTv) {
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
    // });

    // final categories = ;
  }

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      resizeToAvoidBottomInset: false,
      header: FHeader(
        title: const Text('Pusoo IPTV'),
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
                        Text(
                          "Category",
                          style: context.theme.typography.lg.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Gap(1),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              spacing: 5,
                              children: [
                                FTile(
                                  prefix: Icon(FIcons.tags),
                                  title: Text("All Channel"),
                                  suffix: Icon(FIcons.chevronRight),
                                  onPress: () async {
                                    // Bisa navigasi ke halaman detail channel per kategori
                                    debugPrint("All channel selected");

                                    final channelTv =
                                        await (driftDb.select(driftDb.channel)
                                              ..where(
                                                (tbl) => tbl.tvgId.isNotNull(),
                                              ))
                                            .get();

                                    // channelTv.then((data) {
                                    setState(() {
                                      channels = channelTv;

                                      context.pop();
                                    });
                                    // });

                                    // setState(() {
                                    //   channels = categories[categoryName];
                                    // });
                                  },
                                ),
                                ...categories.keys.map((categoryName) {
                                  return FTile(
                                    prefix: Icon(FIcons.tag),
                                    title: Text(categoryName),
                                    suffix: Icon(FIcons.chevronRight),
                                    onPress: () async {
                                      // Bisa navigasi ke halaman detail channel per kategori
                                      // debugPrint("$categoryName selected");

                                      // setState(() {
                                      //   channels = categories[categoryName];
                                      // });

                                      final channelTv =
                                          await (driftDb.select(driftDb.channel)
                                                ..where(
                                                  (tbl) => tbl.category.like(
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
                                }).toList(),
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
              await driftDb.delete(driftDb.playlist).go();
              await driftDb.delete(driftDb.channel).go();

              debugPrint("All rows has been deleted");
            },
          ),
          // FHeaderAction(
          //   icon: Icon(FIcons.refreshCw, size: 25),
          //   onPress: () async {
          //     // Hapus semua isi tabel 'playlist'
          //     // await dirftDb.delete(dirftDb.playlist).go();
          //     // await dirftDb.delete(dirftDb.channel).go();

          //     debugPrint(channelTv.toString());
          //   },
          // ),
          FHeaderAction(
            icon: Icon(FIcons.plus),
            onPress: () {
              context.pushNamed(RouteName.addPlaylist.name);
            },
          ),
        ],
      ),
      child: Column(
        spacing: 10,
        children: [
          FTextField(hint: "Find something to watch..."),
          Expanded(
            child: channels.isEmpty
                ? Center(child: FProgress.circularIcon())
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          childAspectRatio: 0.75,
                        ),
                    itemCount: channels.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          context.pushNamed(
                            RouteName.iptvPlayer.name,
                            extra: channels[index],
                            // queryParameters: {
                            //   "url": channels[index]['urls'].first,
                            //   "title": channels[index]['name'],
                            // },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: context.theme.colors.border,
                              width: 1,
                            ),
                            color: context.theme.colors.foreground,
                          ),
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
                                          padding: const EdgeInsets.all(5.0),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                channels[index].logo ?? "",
                                            placeholder: (_, __) =>
                                                const Center(
                                                  child:
                                                      FProgress.circularIcon(),
                                                ),
                                            errorWidget: (_, __, ___) => Center(
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
                                            fit: BoxFit.scaleDown,
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
                                      style: TextStyle(
                                        color: context.theme.colors.foreground,
                                        fontSize: 10,
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
