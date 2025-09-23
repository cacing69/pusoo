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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pusoo/shared/extensions/string_ext.dart';
import 'package:pusoo/shared/utils/helpers.dart';
import 'package:pusoo/features/track/domain/models/track.dart';
import 'package:pusoo/router.dart';

class ExploreScreen extends StatefulHookConsumerWidget {
  const ExploreScreen({super.key});

  @override
  ConsumerState<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends ConsumerState<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    final urlController = useTextEditingController();
    return FScaffold(
      childPad: false,
      header: FHeader(title: Text("Explore")),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Discover all content",
              style: context.theme.typography.xl.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "from your watchlist",
              style: context.theme.typography.base.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Gap(30),
            SizedBox(
              width: 150,
              height: 150,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SvgPicture.asset(
                    "assets/icon.svg",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Gap(10),
            Text(
              "Open Source",
              style: context.theme.typography.base.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "IPTV Player",
              style: context.theme.typography.lg.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            Gap(20),
            Row(
              children: [
                Expanded(
                  child: FButton(
                    style: FButtonStyle.outline(),
                    onPress: () {
                      // context.pushNamed(RouteName.)
                    },
                    prefix: Icon(FIcons.compass),
                    child: Text("Explore"),
                  ),
                ),
                Gap(10),
                Expanded(
                  child: FButton(
                    style: FButtonStyle.outline(),
                    onPress: () async {
                      urlController.text = "";

                      await showFDialog(
                        context: context,
                        builder: (context, style, animation) => FDialog(
                          animation: animation,
                          direction: Axis.horizontal,
                          title: const Text('Please enter the URL'),
                          body: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Gap(10),
                                FTextField(
                                  maxLines: 4,
                                  controller: urlController,
                                ),
                                Gap(5),
                                FButton(
                                  style: FButtonStyle.ghost(),
                                  prefix: Icon(FIcons.clipboardPaste),
                                  onPress: () async {
                                    // paste clipboard here
                                    final clipboardData =
                                        await Clipboard.getData('text/plain');
                                    if (clipboardData != null) {
                                      urlController.text =
                                          clipboardData.text ?? '';
                                      openVideoUrl(urlController.text);
                                    }
                                  },
                                  child: Text("Paste & Open URL"),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            FButton(
                              style: FButtonStyle.outline(),
                              onPress: () => context.pop(),
                              child: const Text('Close'),
                            ),
                            FButton(
                              onPress: () async {
                                openVideoUrl(urlController.text);
                              },
                              child: const Text('Open'),
                            ),
                          ],
                        ),
                      );
                    },
                    prefix: Icon(FIcons.externalLink),
                    child: Text("Open URL"),
                  ),
                ),
              ],
            ),
            Gap(10),
            FButton(
              style: FButtonStyle.outline(),
              onPress: () {
                context.pushNamed(RouteName.addNewSource.name);
              },
              prefix: Icon(FIcons.plus),
              child: Text("Add New Source"),
            ),
          ],
        ),
      ),
    );
  }

  void openVideoUrl(String url) async {
    if (url.trim().isNotEmpty) {
      if (url.trim().isValidUrl()) {
        context.pushNamed(
          RouteName.tvPlayer.name,
          extra: Track(
            title: "Pusoo - Open Source IPTV Player",
            tvgId: "Online Video Player",
            links: [url.trim()],
          ),
        );
      } else {
        showFlutterToast(message: "Invalid URL", context: context);
      }
    } else {
      showFlutterToast(message: "URL cannot be empty", context: context);
    }
  }
}
