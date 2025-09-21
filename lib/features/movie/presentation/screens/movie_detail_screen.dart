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

import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:pusoo/core/configs/env.dart';
import 'package:pusoo/features/track/domain/models/track.dart';
import 'package:pusoo/router.dart';
import 'package:pusoo/shared/data/datasources/local/drift/drift_database.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetailScreen extends StatefulWidget {
  final Track track;
  const MovieDetailScreen({super.key, required this.track});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  void initState() {
    super.initState();

    setState(() {
      poster = widget.track.tvgLogo!;
    });

    loadTmdb(widget.track);
  }

  Map<dynamic, dynamic> tmdbRes = {};
  Map<dynamic, dynamic> trailerRes = {};
  String poster = "";
  String backDrop = "";
  String tagline = "";
  String cleanedTitle = "";

  void loadTmdb(Track track) async {
    final String title = track.title
        .replaceAll(RegExp(r'\(\d{4}\)$'), "")
        .trim();

    setState(() {
      cleanedTitle = title;
    });

    String year = "";

    final yearRegex = RegExp(r'\((\d{4})\)$');
    final matchYear = yearRegex.firstMatch(track.title);

    if (matchYear != null) {
      year = "${matchYear.group(1)}";
      debugPrint("Extracted year: $year"); // Output: 2001
    } else {
      year = "";
      debugPrint("No year found");
    }

    // final String year = channel.name
    //     .replaceAll(RegExp(r'\(\d{4}\)$'), "")
    //     .trim();

    final Uri url = Uri.parse(
      "https://api.themoviedb.org/3/search/movie?query=${title}&include_adult=true&language=en-US&page=1&year=$year",
    );

    // debugPrint("url.toString(): $url");

    try {
      final response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer ${Env.tmdbReadAccessToken}",
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      );

      if (response.statusCode == 200) {
        final responseSearch = jsonDecode(response.body);

        if (("${responseSearch['results'][0]['id'] ?? ''}").isNotEmpty) {
          final String movieId = "${responseSearch['results'][0]['id']}";
          // get detail with ID
          final Uri urlDetail = Uri.parse(
            "https://api.themoviedb.org/3/movie/$movieId?language=en-US",
          );

          debugPrint("$urlDetail");

          final responseDetail = await http.get(
            urlDetail,
            headers: {
              "Authorization": "Bearer ${Env.tmdbReadAccessToken}",
              "Content-Type": "application/json",
              "Accept": "application/json",
            },
          );

          if (responseDetail.statusCode == 200) {
            // debugPrint(responseDetail.body);

            setState(() {
              tmdbRes = jsonDecode(responseDetail.body);
              poster =
                  "https://image.tmdb.org/t/p/w342/${tmdbRes["poster_path"]}";

              backDrop =
                  "https://image.tmdb.org/t/p/w500/${tmdbRes["backdrop_path"]}";

              tagline = tmdbRes["tagline"];
            });
          }

          // Trailer
          // get detail with ID
          final Uri urlVideos = Uri.parse(
            "https://api.themoviedb.org/3/movie/$movieId/videos",
          );

          debugPrint("$urlVideos");

          final responseVideos = await http.get(
            urlVideos,
            headers: {
              "Authorization": "Bearer ${Env.tmdbReadAccessToken}",
              "Content-Type": "application/json",
              "Accept": "application/json",
            },
          );

          if (responseVideos.statusCode == 200) {
            debugPrint(responseVideos.body);

            setState(() {
              trailerRes = jsonDecode(responseVideos.body);
            });
          }
        }
      }
    } catch (e) {
      debugPrint('Error loading TMDB: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader.nested(
        title: Text("Movie Detail"),
        prefixes: [
          FHeaderAction.back(
            onPress: () {
              context.pop(false);
            },
          ),
        ],
      ),
      child: ListView(
        children: [
          // Header dengan poster dan nama
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 300,
                child: CachedNetworkImage(
                  imageUrl: backDrop,
                  placeholder: (_, __) =>
                      const Center(child: FProgress.circularIcon()),
                  errorWidget: (_, __, ___) => Center(
                    child: Icon(
                      FIcons.imageOff,
                      color: context.theme.colors.background.withAlpha(200),
                      size: 40,
                    ),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: double.infinity,
                height: 300,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black, // paling gelap di bawah
                      Colors.transparent, // transparan ke atas
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 10,
                bottom: 0,
                child: Text(
                  "${tmdbRes["release_date"] ?? "-"}",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: 10,
                right: 10, // optional biar gak mepet kanan
                bottom: 25,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Poster
                    ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: CachedNetworkImage(
                        imageUrl: poster,
                        width: 100,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Judul dan rating
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: context.theme.colors.foreground,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 2.0,
                                    horizontal: 3,
                                  ),
                                  child: Text(
                                    "${(tmdbRes["vote_average"] ?? "0,0").toString().substring(0, 3).replaceAll(".", ",")}/${NumberFormat.decimalPattern('id').format(num.tryParse((tmdbRes["vote_count"] ?? "0").toString()))}",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: context.theme.colors.background,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: context.theme.colors.foreground,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 2.0,
                                    horizontal: 3,
                                  ),
                                  child: Text(
                                    "${tmdbRes["status"] ?? "-"}",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: context.theme.colors.background,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Text(
                            cleanedTitle,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            tagline,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          FButton(
            style: FButtonStyle.outline(),
            prefix: Icon(FIcons.play),
            onPress: () {
              // context.pushNamed(
              //   RouteName.videoPlayerFull.name,
              //   extra: widget.channel,
              // );
            },
            child: Text("Watch Now"),
          ),
          Gap(10),
          FTabs(
            children: [
              FTabEntry(
                label: const Text('About'),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(5),
                    FTile(
                      prefix: Icon(FIcons.globe),
                      title: Text("Homepage"),
                      suffix: Icon(FIcons.externalLink),
                      onPress: () async {
                        final uri = Uri.parse(tmdbRes["homepage"]);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(
                            uri,
                            mode: LaunchMode
                                .externalApplication, // buka di browser/app lain
                          );
                        } else {
                          throw 'Could not launch $uri';
                        }
                      },
                    ),
                    Gap(5),
                    SizedBox(width: double.infinity, child: Text("Overview")),
                    Gap(5),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        tmdbRes["overview"] ?? "-",
                        style: TextStyle(color: Colors.grey[300]),
                      ),
                    ),
                    Gap(10),
                    SizedBox(width: double.infinity, child: Text("Genres")),
                    Gap(5),
                    Wrap(
                      spacing: 3,
                      runSpacing: 3,
                      children: [
                        ...(tmdbRes["genres"] ?? []).map(
                          (genre) => FBadge(child: Text("${genre['name']}")),
                        ),
                      ],
                    ),
                    Gap(10),
                    SizedBox(width: double.infinity, child: Text("Countries")),
                    Gap(5),
                    ...(tmdbRes["production_countries"] ?? []).map(
                      (country) => FItem(
                        prefix: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: SizedBox(
                            width: 25,
                            height: 25,
                            child: CountryFlag.fromCountryCode(
                              country['iso_3166_1'],
                            ),
                          ),
                        ),
                        title: Text("${country['name']}"),
                      ),
                    ),
                    Gap(10),
                    SizedBox(width: double.infinity, child: Text("Languages")),
                    Gap(5),
                    ...(tmdbRes["spoken_languages"] ?? []).map(
                      (lang) => FItem(
                        prefix: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: SizedBox(
                            width: 25,
                            height: 25,
                            child: CountryFlag.fromLanguageCode(
                              lang['iso_639_1'],
                            ),
                          ),
                        ),
                        title: Text("${lang['english_name']}"),
                        subtitle: Text("${lang['name']}"),
                      ),
                    ),
                    Gap(10),
                    SizedBox(width: double.infinity, child: Text("Companies")),
                    Gap(5),
                    ...(tmdbRes["production_companies"] ?? []).map(
                      (company) => FItem(
                        prefix: Builder(
                          builder: (context) {
                            if (((company["logo_path"] ?? "") as String)
                                .isNotEmpty) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: context.theme.colors.foreground,
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "https://image.tmdb.org/t/p/w92/${company["logo_path"]}",
                                  ),
                                ),
                              );
                            } else {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: context.theme.colors.foreground,
                                ),
                                child: SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: Icon(
                                    FIcons.building2,
                                    size: 20,
                                    color: context.theme.colors.background,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                        title: Text("${company['name']}"),
                      ),
                    ),
                  ],
                ),
              ),
              FTabEntry(
                label: const Text('Trailer'),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text("Youtube", textAlign: TextAlign.start),
                    ),
                    ...(trailerRes["results"] ?? []).map((vid) {
                      if ((vid["site"] as String).toLowerCase() == "youtube" &&
                          ((vid["type"] as String).toLowerCase() ==
                              "trailer")) {
                        return GestureDetector(
                          onTap: () {
                            context.pushNamed(
                              RouteName.youtubeIframePlayer.name,
                              pathParameters: {"videoId": vid["key"]},
                              queryParameters: {"title": vid["name"]},
                            );
                          },
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${vid["type"]} - ${vid["name"]}",
                                  textAlign: TextAlign.start,
                                ),
                                Gap(10),
                                SizedBox(
                                  width: double.infinity,
                                  height: 200,
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        width: double.infinity,
                                        height: 200,
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              "https://img.youtube.com/vi/${vid["key"]}/mqdefault.jpg",
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                      Positioned.fill(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: context
                                                .theme
                                                .colors
                                                .background
                                                .withAlpha(50),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: context
                                                .theme
                                                .colors
                                                .background
                                                .withAlpha(180),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Icon(FIcons.play, size: 35),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                FDivider(),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    }),
                  ],
                ),
              ),
              FTabEntry(
                label: const Text('Cast'),
                child: FCard(
                  title: const Text('Cast'),
                  subtitle: const Text(
                    'Cast your password here. After saving, you will be logged out.',
                  ),
                  child: Column(
                    children: [
                      const FTextField(label: Text('Current password')),
                      const SizedBox(height: 10),
                      const FTextField(label: Text('New password')),
                      const SizedBox(height: 16),
                      FButton(onPress: () {}, child: const Text('Save')),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
