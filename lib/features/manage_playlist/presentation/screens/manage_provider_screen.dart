import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pusoo/core/utils/helpers.dart';
import 'package:pusoo/router.dart';
import 'package:pusoo/shared/data/datasources/local/drift_database.dart';
import 'package:drift/drift.dart' as drift;

class ManageProviderScreen extends StatefulWidget {
  const ManageProviderScreen({super.key});

  @override
  State<ManageProviderScreen> createState() => _ManageProviderScreenState();
}

class _ManageProviderScreenState extends State<ManageProviderScreen> {
  List<PlaylistDriftData> playlist = [];

  void loadPlaylist() async {
    final allPlaylists = await driftDb.select(driftDb.playlistDrift).get();

    setState(() {
      playlist = allPlaylists;
    });
  }

  void removeAllPlaylist() async {
    // Hapus semua isi tabel 'playlist'
    await driftDb.delete(driftDb.playlistDrift).go();
    await driftDb.delete(driftDb.channelDrift).go();

    loadPlaylist();
  }

  @override
  void initState() {
    super.initState();

    loadPlaylist();
  }

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader.nested(
        title: Text("Manage provider"),
        prefixes: [
          FHeaderAction.back(
            onPress: () {
              context.pop(false);
            },
          ),
        ],
      ),
      child: Column(
        children: [
          FButton(
            style: FButtonStyle.outline(),
            onPress: () async {
              final result = await context.pushNamed(
                RouteName.addNewProvider.name,
              );

              if (result is bool && result) {
                // reload available
                loadPlaylist();

                if (context.mounted) {
                  showFlutterToast(context: context, message: "Playlist saved");
                  // showFToast(
                  //   context: context,
                  //   alignment: FToastAlignment.topCenter,
                  //   title: const Text('Playlist Saved'),
                  // );
                }
              }
            },
            prefix: Icon(FIcons.plus),
            child: Text("Add new provider"),
          ),
          Gap(10),
          FButton(
            style: FButtonStyle.destructive(),
            onPress: () async {
              await showFDialog(
                context: context,
                builder: (context, style, animation) => FDialog(
                  animation: animation,
                  direction: Axis.horizontal,
                  title: const Text('Delete all playlist'),
                  body: Text(
                    "This action will permanently delete all playlists. You can't undo this.",
                  ),
                  actions: [
                    FButton(
                      style: FButtonStyle.outline(),
                      onPress: () => context.pop(),
                      child: const Text('Cancel'),
                    ),
                    FButton(
                      onPress: () async {
                        removeAllPlaylist();
                        context.pop();

                        showFlutterToast(
                          message: "All playlist deleted",
                          context: context,
                        );
                      },
                      child: const Text('Delete'),
                    ),
                  ],
                ),
              );
            },
            prefix: Icon(FIcons.shredder),
            child: Text("Remove all playlist"),
          ),
          Gap(10),
          Expanded(
            child: Builder(
              builder: (context) {
                if (playlist.isEmpty) {
                  return Expanded(child: Center(child: Text("No Data")));
                } else {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5,
                      children: [
                        ...playlist.map((e) {
                          return FTile(
                            prefix: SizedBox(
                              width: 20,
                              height: 20,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: e.isActive
                                      ? Colors.green[800]
                                      : context.theme.colors.destructive,
                                ),
                              ),
                            ),
                            title: Text(e.name),
                            subtitle: Text(e.url),
                            suffix: Icon(FIcons.chevronRight),
                            onPress: e.isActive
                                ? () {
                                    showFlutterToast(
                                      context: context,
                                      message:
                                          "This is the active playlist. Please select another.",
                                    );
                                  }
                                : () {
                                    showFDialog(
                                      context: context,
                                      builder: (context, style, animation) => FDialog(
                                        animation: animation,
                                        direction: Axis.horizontal,
                                        title: const Text('Select an action'),
                                        body: Column(
                                          children: [
                                            Text(
                                              "Please choose an action to perform on this playlist.",
                                            ),
                                            FDivider(
                                              style: (style) => style.copyWith(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 5,
                                                ),
                                              ),
                                            ),
                                            FItemGroup(
                                              children: [
                                                FItem(
                                                  prefix: Icon(
                                                    FIcons.circleDashed,
                                                  ),
                                                  title: Text(
                                                    "Set as active playlist",
                                                  ),
                                                  suffix: Icon(FIcons.check),
                                                  onPress: () async {
                                                    // update data old selected as false
                                                    await (driftDb.update(
                                                          driftDb.playlistDrift,
                                                        )..where(
                                                          (tbl) => tbl.isActive
                                                              .equals(true),
                                                        ))
                                                        .write(
                                                          const PlaylistDriftCompanion(
                                                            isActive:
                                                                drift.Value(
                                                                  false,
                                                                ),
                                                          ),
                                                        );

                                                    // update data old selected as false
                                                    await (driftDb.update(
                                                          driftDb.playlistDrift,
                                                        )..where(
                                                          (tbl) => tbl.id
                                                              .equals(e.id),
                                                        ))
                                                        .write(
                                                          const PlaylistDriftCompanion(
                                                            isActive:
                                                                drift.Value(
                                                                  true,
                                                                ),
                                                          ),
                                                        );

                                                    loadPlaylist();

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
                                                      showFlutterToast(
                                                        context: context,
                                                        message:
                                                            "Set ${e.name} as active playlist",
                                                      );
                                                    }
                                                  },
                                                ),
                                                FItem(
                                                  prefix: Icon(
                                                    FIcons.circleDashed,
                                                  ),
                                                  title: Text(
                                                    "Remove from playlist",
                                                  ),
                                                  suffix: Icon(FIcons.trash),
                                                  onPress: () async {
                                                    // delete channel first
                                                    await (driftDb.delete(
                                                          driftDb.playlistDrift,
                                                        )..where(
                                                          (tbl) => tbl.id
                                                              .equals(e.id),
                                                        ))
                                                        .go();

                                                    // delete channel first
                                                    await (driftDb.delete(
                                                          driftDb.channelDrift,
                                                        )..where(
                                                          (tbl) => tbl
                                                              .playlistId
                                                              .equals(e.id),
                                                        ))
                                                        .go();

                                                    loadPlaylist();

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
                                                      showFlutterToast(
                                                        context: context,
                                                        message:
                                                            "Removed ${e.name} from playlist",
                                                      );
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
                          );
                        }),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
