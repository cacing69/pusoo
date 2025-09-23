/*
 * Pusoo - IPTV Player
 * Copyright (C) 2025 Ibnul Mutaki <ibnuul@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */

import 'dart:convert';

import 'package:drift/drift.dart' as drift;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pusoo/shared/extensions/string_ext.dart';
import 'package:pusoo/shared/utils/helpers.dart';
import 'package:pusoo/shared/utils/m3u_parser.dart';
import 'package:pusoo/shared/utils/playlist_name_extractor.dart';
import 'package:pusoo/features/source/domain/entities/source.dart';
import 'package:pusoo/features/source/presentation/providers/active_source_notifier.dart';
import 'package:pusoo/features/track/domain/models/track_filter_query.dart';
import 'package:pusoo/features/tv/presentation/providers/tv_track_count_notifier.dart';
import 'package:pusoo/features/tv/presentation/providers/tv_track_group_titles_notifier.dart';
import 'package:pusoo/shared/data/datasources/local/drift/drift_database.dart';
import 'package:http/http.dart' as http;
import 'package:pusoo/features/track/domain/models/track.dart';
import 'package:pusoo/shared/data/playlist_template_reff.dart';
import 'package:ulid/ulid.dart';

class AddNewPlaylistScreen extends StatefulHookConsumerWidget {
  final Source source;
  const AddNewPlaylistScreen({required this.source, super.key});

  @override
  ConsumerState<AddNewPlaylistScreen> createState() =>
      _AddNewPlaylistScreenState();
}

class _AddNewPlaylistScreenState extends ConsumerState<AddNewPlaylistScreen> {
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController(
      text: widget.source.isEmpty ? "" : widget.source.name,
    );
    final urlController = useTextEditingController(
      text: widget.source.isEmpty
          ? ""
          : widget.source.tracks!.first.links.first,
    );
    final epgLinkController = useTextEditingController();

    return FScaffold(
      resizeToAvoidBottomInset: false,
      header: FHeader.nested(
        title: Text("Add Playlist"),
        prefixes: [
          FHeaderAction.back(
            onPress: () {
              context.pop(false);
            },
          ),
        ],
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Gap(10),
          FTextField(
            controller: nameController,
            label: Text("Name"),
            description: Text(
              "If the name is left blank, the playlist name from the URL will be used instead.",
            ),
          ),
          Gap(10),
          FTextField.multiline(
            controller: urlController,
            label: Text("URL/M3U Content"),
            minLines: 6,
            clearable: (TextEditingValue e) => e.text.isNotEmpty,
          ),
          Gap(5),
          FButton(
            style: FButtonStyle.ghost(),
            prefix: Icon(FIcons.clipboardPaste),
            onPress: () async {
              final clipboardData = await Clipboard.getData('text/plain');
              if (clipboardData != null) {
                urlController.text = clipboardData.text ?? '';
                if (context.mounted) {
                  showFlutterToast(
                    message: "Pasted from clipboard",
                    context: context,
                  );
                }
              }
            },
            child: Text("Paste URL/M3U Content"),
          ),
          Gap(10),
          FTextField.multiline(
            controller: epgLinkController,
            label: Text("EPG Link (Optional)"),
            minLines: 2,
            clearable: (TextEditingValue e) => e.text.isNotEmpty,
          ),
          Gap(10),
          SafeArea(
            top: false,
            child: FButton(
              prefix: isLoading ? FProgress.circularIcon() : null,
              onPress: isLoading
                  ? null
                  : () async {
                      if (urlController.text.isEmpty) {
                        showFlutterToast(
                          message: "URL cannot empty",
                          context: context,
                        );
                        return;
                      }

                      setState(() {
                        isLoading = true;
                      });

                      final String playlistUlid = Ulid().toString();

                      debugPrint('Playlist Saved!');

                      List<Track> channel = [];
                      String content = "";

                      if (urlController.text.isValidUrl()) {
                        try {
                          final response = await http.get(
                            Uri.parse(urlController.text.trim()),
                          );

                          if (response.statusCode == 200) {
                            try {
                              content = utf8
                                  .decode(response.bodyBytes)
                                  .replaceFirst('\u{FEFF}', '');
                            } catch (_) {
                              content = latin1.decode(response.bodyBytes);
                            }

                            channel = M3UParser.parse(content);
                          } else {
                            throw Exception('Failed to load M3U');
                          }
                        } catch (e) {
                          setState(() {
                            isLoading = false;
                          });

                          if (context.mounted) {
                            showFlutterToast(
                              context: context,
                              message: 'Error loading M3U: $e',
                            );
                          }

                          debugPrint('Error loading M3U: $e');
                        }
                      } else {
                        try {
                          content = utf8
                              .decode(urlController.text.trim().codeUnits)
                              .replaceFirst('\u{FEFF}', '');
                        } catch (_) {
                          content = latin1.decode(
                            urlController.text.trim().codeUnits,
                          );
                        }

                        channel = M3UParser.parse(content);
                      }

                      final countExpression = driftDb.sourceDrift.id.count();

                      String name = widget.source.isEmpty
                          ? "M3U-${DateTime.now().millisecondsSinceEpoch.toString()}"
                          : nameController.text.trim();

                      if (nameController.text.trim().isEmpty &&
                          urlController.text.isValidUrl()) {
                        final extractedName = PlaylistNameExtractor.fromUrl(
                          urlController.text,
                        ).name;
                        name = extractedName?.isNotEmpty == true
                            ? extractedName!
                            : "M3U-${DateTime.now().millisecondsSinceEpoch.toString()}";
                      }

                      final count =
                          await (driftDb.selectOnly(driftDb.sourceDrift)
                                ..addColumns([countExpression]))
                              .map((row) => row.read(countExpression))
                              .getSingle();

                      final int playlistId = await driftDb
                          .into(driftDb.sourceDrift)
                          .insert(
                            SourceDriftCompanion.insert(
                              ulid: playlistUlid,
                              name: name,
                              type: drift.Value("m3u"),
                              contentType: drift.Value("m3u"),
                              filePath: drift.Value(""),
                              epgLink: drift.Value(
                                epgLinkController.text.trim(),
                              ),
                              url: drift.Value(urlController.text.trim()),
                              isActive: drift.Value(count == 0),
                              isPublic: drift.Value(
                                widget.source.isPublic ?? false,
                              ),
                            ),
                          );

                      // final isUrlExistOnPlaylisUrlHistory =
                      //     await (driftDb.select(driftDb.sourceDrift)..where(
                      //           (tbl) =>
                      //               tbl.url.equals(urlController.text.trim()),
                      //         ))
                      //         .getSingleOrNull() !=
                      //     null;

                      // TODO : Save history on hive

                      // if (!isUrlExistOnPlaylisUrlHistory) {
                      //   await driftDb
                      //       .into(driftDb.playlistUrlHistoryDrift)
                      //       .insert(
                      //         PlaylistUrlHistoryDriftCompanion.insert(
                      //           url: drift.Value(urlController.text.trim()),
                      //         ),
                      //       );
                      // }

                      if (channel.isNotEmpty) {
                        await driftDb.batch((batch) {
                          batch.insertAll(
                            driftDb.trackDrift,
                            channel.map<TrackDriftCompanion>((Track track) {
                              return TrackDriftCompanion(
                                sourceId: drift.Value(playlistId),
                                title: drift.Value(track.title),
                                tvgId: drift.Value(track.tvgId),
                                tvgLogo: drift.Value(track.tvgLogo),
                                groupTitle: drift.Value(track.groupTitle),
                                links: drift.Value(jsonEncode(track.links)),
                                kodiProps: drift.Value(
                                  jsonEncode(track.kodiProps),
                                ),
                                extVlcOpts: drift.Value(
                                  jsonEncode(track.extVlcOpts),
                                ),
                                isLiveTv: drift.Value(
                                  xtreamPlaylistTemplate.liveTvClassifier
                                          ?.isSatisfiedByAll(track) ??
                                      false,
                                ),
                                isMovie: drift.Value(
                                  xtreamPlaylistTemplate.movieClassifier
                                          ?.isSatisfiedByAll(track) ??
                                      false,
                                ),
                                isTvSerie: drift.Value(
                                  xtreamPlaylistTemplate.tvSerieClassifier
                                          ?.isSatisfiedByAll(track) ??
                                      false,
                                ),
                              );
                            }).toList(),
                          );
                        });

                        if (count == 0) {
                          ref.read(activeSourceProvider.notifier).perform();
                          ref
                              .read(tvTrackCountProvider.notifier)
                              .perform(TrackFilterQuery(isLiveTv: true));
                          ref
                              .read(tvTrackGroupTitlesProvider.notifier)
                              .perform(TrackFilterQuery(isLiveTv: true));
                        }
                      }

                      if (context.mounted) {
                        setState(() {
                          isLoading = false;
                        });

                        context.pop(true);
                      }
                    },
              child: Text("Save"),
            ),
          ),
          Gap(10),
        ],
      ),
    );
  }
}
