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
      if (previous?.query != next.query && next.query?.isNotEmpty == true) {
        final log = ref.read(loggerProvider);
        log.i("Query params changed, refreshing paging...");
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
                Flexible(child: FTextField(label: Text("Search By"))),
                Flexible(
                  child: FTextField(
                    controller: languageController,
                    label: Text("Language (id)"),
                  ),
                ),
              ],
            ),

            Gap(5),
            FTextField(controller: queryController, label: Text("Query")),
            Gap(10),
            FButton(
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
                      .updateLanguage(language.isNotEmpty ? language : "id");

                  log.i("Updated query params - listener will handle refresh");
                } else {
                  log.w("Query is empty, not searching");
                }
              },
              prefix: Icon(FIcons.search),
              child: Text("Search"),
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
                  builder: (context, state, fetchNextPage) => PagedListView(
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
                                  Icon(FIcons.user, size: 15),
                                  Gap(5),
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
                                              height: 10,
                                              width: 16,
                                              child:
                                                  CountryFlag.fromLanguageCode(
                                                    item.attributes?.language ??
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
                    ),
                  ),
                ),
                onRefresh: () async {
                  ref.read(searchSubtitlePagingProvider).refresh();
                },
              ),
            ),
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
          ],
        ),
      ),
    );
  }
}
