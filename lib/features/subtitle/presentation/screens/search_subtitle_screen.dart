import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pusoo/features/subtitle/presentation/providers/search_subtitle_paging_notifier.dart';
import 'package:pusoo/features/subtitle/presentation/providers/search_subtitle_search_query_params_notifier.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/subtitle.dart';
import 'package:pusoo/shared/domain/entities/open_subtitles/search_subtitle_query_params.dart';
import 'package:pusoo/shared/presentation/providers/logger_provider.dart';

class SearchSubtitleScreen extends StatefulHookConsumerWidget {
  const SearchSubtitleScreen({super.key});

  @override
  ConsumerState<SearchSubtitleScreen> createState() =>
      _SearchSubtitleScreenState();
}

class _SearchSubtitleScreenState extends ConsumerState<SearchSubtitleScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController queryController = useTextEditingController();
    final TextEditingController languageController = useTextEditingController(
      text: "id",
    );

    // Listen to query params changes and refresh paging when needed
    ref.listen<SearchSubtitleQueryParams>(searchSubtitleQueryParamsProvider, (
      previous,
      next,
    ) {
      // Only refresh when query actually changes (not when page changes)
      if (previous?.query != next.query) {
        final log = ref.read(loggerProvider);
        log.i(
          "Query changed from '${previous?.query}' to '${next.query}', refreshing paging...",
        );
        ref.read(searchSubtitlePagingProvider).refresh();
      }
    });

    return FScaffold(
      header: FHeader.nested(
        title: Text("Search Subtitle"),
        prefixes: [
          FHeaderAction.back(
            onPress: () {
              context.pop(true);
            },
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 10,
              children: [
                Flexible(child: FTextField(label: Text("IMDb ID"))),
                Flexible(child: FTextField(label: Text("Language (id)"))),
              ],
            ),
            Gap(5),

            Gap(5),
            FTextField(controller: queryController, label: Text("Title/Query")),
            Gap(5),
            Row(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(child: FTextField(label: Text("Season"))),
                Flexible(child: FTextField(label: Text("Episode"))),
                Flexible(child: FTextField(label: Text("Year"))),
                Flexible(
                  child: FButton.raw(
                    onPress: () async {
                      final log = ref.read(loggerProvider);
                      log.i("Search button clicked!");

                      final query = queryController.text.trim();
                      final language = languageController.text.trim();

                      log.i("Query text: '$query'");
                      log.i("Language: '$language'");

                      if (query.isNotEmpty) {
                        // Update query parameters
                        ref
                            .read(searchSubtitleQueryParamsProvider.notifier)
                            .updateQuery(query);

                        // Update language parameter
                        ref
                            .read(searchSubtitleQueryParamsProvider.notifier)
                            .updateLanguage(
                              language.isNotEmpty ? language : "id",
                            );

                        log.i(
                          "Updated query params - listener will handle refresh",
                        );
                      } else {
                        log.w("Query is empty, not searching");
                      }
                    },
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.all(9),
                        child: Icon(
                          FIcons.search,
                          color: context.theme.colors.background,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            FDivider(
              style: (style) =>
                  style.copyWith(padding: EdgeInsets.symmetric(vertical: 5)),
            ),
            Text("Results"),
            Gap(5),
            Expanded(
              child: RefreshIndicator(
                child: PagingListener(
                  controller: ref.watch(searchSubtitlePagingProvider),
                  builder: (context, state, fetchNextPage) {
                    // Cek apakah ada query
                    final queryState = ref.watch(
                      searchSubtitleQueryParamsProvider,
                    );
                    if (queryState.query == null || queryState.query!.isEmpty) {
                      return Center(
                        child: Text("Enter a query to search for subtitles"),
                      );
                    }

                    return PagedListView(
                      padding: EdgeInsets.zero,
                      state: state,
                      fetchNextPage: fetchNextPage,
                      builderDelegate: PagedChildBuilderDelegate(
                        itemBuilder: (context, Subtitle item, index) => Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Gap(5),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Gap(2),
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: context.theme.colors.foreground,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(2),
                                        child: Icon(
                                          FIcons.user,
                                          size: 17,
                                          color:
                                              context.theme.colors.background,
                                        ),
                                      ),
                                    ),
                                    Gap(7),
                                    Flexible(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            item.attributes?.uploader?.name ??
                                                "No Uploader",
                                            style: context.theme.typography.sm
                                                .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                height: 13,
                                                width: 20,
                                                child:
                                                    CountryFlag.fromLanguageCode(
                                                      item
                                                              .attributes
                                                              ?.language ??
                                                          "xx",
                                                    ),
                                              ),
                                              Gap(10),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                ...item.attributes?.files
                                        ?.map(
                                          (file) => FItem(
                                            prefix: Icon(FIcons.captions),
                                            title: Text(
                                              file.fileName ?? "No File Name",
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            suffix: Icon(FIcons.download),
                                            // details: Text(
                                            //     "${file.format?.toUpperCase() ?? "N/A"} - ${file.encoding ?? "N/A"}"),
                                            // subtitle: Text(
                                            //     "Size: ${file.fileSize ?? "N/A"} - ${item.attributes?.language ?? "N/A"}"),
                                            // onPress: () async {
                                            //   // Load subtitle into video player
                                            //   // For demo, just show a toast
                                            //   showFlutterToast(
                                            //     message:
                                            //         "Load subtitle: ${file.fileName}",
                                            //     context: context,
                                            //   );
                                            // },
                                          ),
                                        )
                                        .toList() ??
                                    [],
                                // FItem(
                                //   prefix: Icon(FIcons.captions),
                                //   title: Text(item.type ?? "No Type"),
                                //   suffix: Icon(FIcons.download),
                                //   details: Text("English"),
                                // ),
                                // FItem(
                                //   prefix: Icon(FIcons.captions),
                                //   title: Text(item.type ?? "No Type"),
                                //   suffix: Icon(FIcons.download),
                                //   details: Text("English"),
                                // ),
                                // FItem(
                                //   prefix: Icon(FIcons.captions),
                                //   title: Text(item.type ?? "No Type"),
                                //   suffix: Icon(FIcons.download),
                                //   details: Text("English"),
                                // ),
                              ],
                            ),
                            FDivider(
                              style: (style) => style.copyWith(
                                padding: EdgeInsets.symmetric(vertical: 2),
                                width: 1,
                              ),
                            ),
                          ],
                        ),
                        firstPageProgressIndicatorBuilder: (context) =>
                            FProgress.circularIcon(),
                        newPageProgressIndicatorBuilder: (context) =>
                            FProgress.circularIcon(),
                        firstPageErrorIndicatorBuilder: (context) {
                          final pagingNotifier = ref.read(
                            searchSubtitlePagingProvider.notifier,
                          );
                          final errorMessage = pagingNotifier.lastError;

                          // Parse error message to show user-friendly message
                          String displayMessage =
                              "Unable to search subtitles. Please try again.";
                          if (errorMessage != null) {
                            if (errorMessage.contains("403") ||
                                errorMessage.contains("Forbidden")) {
                              displayMessage =
                                  "Access denied. Please try again later.";
                            } else if (errorMessage.contains("401") ||
                                errorMessage.contains("Unauthorized")) {
                              displayMessage =
                                  "Authentication failed. Please try again.";
                            } else if (errorMessage.contains("429") ||
                                errorMessage.contains("Too Many Requests")) {
                              displayMessage =
                                  "Too many requests. Please wait a moment and try again.";
                            } else if (errorMessage.contains("500") ||
                                errorMessage.contains(
                                  "Internal Server Error",
                                )) {
                              displayMessage =
                                  "Server error. Please try again later.";
                            } else if (errorMessage.contains("timeout") ||
                                errorMessage.contains("Timeout")) {
                              displayMessage =
                                  "Request timeout. Please check your connection and try again.";
                            } else if (errorMessage.contains("User-Agent")) {
                              displayMessage =
                                  "Invalid request format. Please try again.";
                            }
                          }

                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.error_outline,
                                  size: 48,
                                  color: context.theme.colors.destructive,
                                ),
                                Gap(16),
                                Text(
                                  "Search Failed",
                                  style: context.theme.typography.lg.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: context.theme.colors.destructive,
                                  ),
                                ),
                                Gap(8),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 32),
                                  child: Text(
                                    displayMessage,
                                    textAlign: TextAlign.center,
                                    style: context.theme.typography.sm.copyWith(
                                      color:
                                          context.theme.colors.mutedForeground,
                                    ),
                                  ),
                                ),
                                Gap(16),
                                Center(
                                  child: SizedBox(
                                    width: 120,
                                    child: FButton(
                                      style: FButtonStyle.outline(),
                                      prefix: Icon(FIcons.refreshCw),
                                      onPress: () {
                                        ref
                                            .read(searchSubtitlePagingProvider)
                                            .refresh();
                                      },
                                      child: Text("Retry"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        newPageErrorIndicatorBuilder: (context) {
                          final pagingNotifier = ref.read(
                            searchSubtitlePagingProvider.notifier,
                          );
                          final errorMessage = pagingNotifier.lastError;

                          // Parse error message to show user-friendly message
                          String displayMessage = "Failed to load more results";
                          if (errorMessage != null) {
                            if (errorMessage.contains("403") ||
                                errorMessage.contains("Forbidden")) {
                              displayMessage = "Access denied";
                            } else if (errorMessage.contains("429") ||
                                errorMessage.contains("Too Many Requests")) {
                              displayMessage = "Rate limited";
                            } else if (errorMessage.contains("timeout") ||
                                errorMessage.contains("Timeout")) {
                              displayMessage = "Connection timeout";
                            }
                          }

                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.error_outline,
                                  size: 32,
                                  color: context.theme.colors.destructive,
                                ),
                                Gap(8),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Text(
                                    displayMessage,
                                    textAlign: TextAlign.center,
                                    style: context.theme.typography.sm.copyWith(
                                      color: context.theme.colors.destructive,
                                    ),
                                  ),
                                ),
                                Gap(8),
                                FButton(
                                  onPress: () {
                                    ref
                                        .read(searchSubtitlePagingProvider)
                                        .refresh();
                                  },
                                  child: Text("Retry"),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                onRefresh: () async {
                  ref.read(searchSubtitlePagingProvider).refresh();
                },
                // FItem(
                //   prefix: Icon(FIcons.captions),
                //   title: Text("Subtitle 1"),
                //   suffix: Icon(FIcons.download),
                //   details: Text("English"),
                //   subtitle: Text("BLuray 1080HD"),

                //   onPress: () async {
                //     String subtitle =
                //         "https://gist.githubusercontent.com/matibzurovski/d690d5c14acbaa399e7f0829f9d6888e/raw/63578ca30e7430be1fa4942d4d8dd599f78151c7/example.srt";

                //     final BetterPlayerSubtitlesSource subtitlesSource =
                //         BetterPlayerSubtitlesSource(
                //           type: BetterPlayerSubtitlesSourceType.network,
                //           urls: [subtitle],
                //         );

                //     ref
                //         .read(betterPlayerProvider.notifier)
                //         .loadSubtitle(subtitlesSource);

                //     showFlutterToast(message: "Subtitle loaded", context: context);

                //     context.pop(true);
                //   },
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
