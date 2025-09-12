import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:pusoo/core/utils/m3u_parse.dart';
// import 'package:pusoo/core/utils/m3u_parse.dart';
import 'package:pusoo/router.dart';
import 'package:http/http.dart' as http;

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

  List<dynamic> channels = [];

  Future<void> loadM3U() async {
    try {
      final response = await http.get(
        Uri.parse("https://iptv-org.github.io/iptv/languages/ind.m3u"),
      );
      if (response.statusCode == 200) {
        // debugPrint(response.body);
        final channel = M3uUtils.parse(response.body);

        debugPrint(channel["items"].toString());

        setState(() {
          // channels = urls;
          channels = List<Map<String, dynamic>>.from(channel["items"]);
        });
      } else {
        throw Exception('Failed to load M3U');
      }
    } catch (e) {
      print('Error loading M3U: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      resizeToAvoidBottomInset: false,
      header: FHeader(
        title: const Text('Explore'),
        suffixes: [
          FHeaderAction(icon: Icon(FIcons.refreshCw, size: 25), onPress: () {}),
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
                                      channels[index]['tvg-logo']?.isNotEmpty ??
                                          false
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                channels[index]['tvg-logo'],
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
                                            fit: BoxFit.fitWidth,
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
                                      channels[index]['name'],
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
