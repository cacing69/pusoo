import 'package:go_router/go_router.dart';
import 'package:pusoo/features/source/presentation/screens/add_new_source_screen.dart';
import 'package:pusoo/features/playlist/presentation/screens/add_new_playlist_screen.dart';
import 'package:pusoo/features/detail/presentation/screens/detail_screen.dart';
import 'package:pusoo/features/home/presentation/screens/home_screen.dart';
import 'package:pusoo/features/source/presentation/screens/manage_source_screen.dart';
import 'package:pusoo/features/movie/presentation/screens/movie_detail_screen.dart';
import 'package:pusoo/features/source/presentation/screens/public_source_list_playlist_screen.dart';
import 'package:pusoo/features/source/presentation/screens/public_source_list_playlist_tracks_screen.dart';
import 'package:pusoo/features/source/presentation/screens/public_source_list_screen.dart';
import 'package:pusoo/features/subtitle/presentation/screens/subtitle_search_screen.dart';
// import 'package:pusoo/features/tv/presentation/screens/tv_player_full_screen.dart';
import 'package:pusoo/features/tv/presentation/screens/tv_player_screen.dart';
import 'package:pusoo/features/welcome/presentation/screens/welcome_screen.dart';
import 'package:pusoo/shared/data/datasources/local/drift/drift_database.dart';
import 'package:pusoo/features/track/domain/models/track.dart';
import 'package:pusoo/shared/presentation/screens/youtube_iframe_player_screen.dart';

enum RouteName {
  welcome,
  home,
  detail,
  videoPlayer,

  // tv
  tvPlayer,

  // movie
  movieDetail,

  // source
  manageSource,
  addNewSource,

  // playlist
  addPlaylist,

  // public source
  publicSources,
  publicSourcesPlaylist,
  publicSourcesPlaylistTrack,

  // subtitle
  subtitleSearch,

  // etc..
  youtubeIframePlayer,
}

final List<GoRoute> defaultRouter = [
  GoRoute(
    path: '/',
    name: RouteName.welcome.name,
    builder: (context, state) => WellcomeScreen(),
  ),
  GoRoute(
    path: '/home',
    name: RouteName.home.name,
    builder: (context, state) => HomeScreen(),
  ),
  GoRoute(
    path: '/playlist/add',
    name: RouteName.addPlaylist.name,
    builder: (context, state) => AddNewPlaylistScreen(),
  ),
  GoRoute(
    path: '/detail/:movieId',
    name: RouteName.detail.name,
    builder: (context, state) {
      return DetailScreen(movieId: state.pathParameters['movieId']!);
    },
  ),
  // GoRoute(
  //   path: '/tv-player',
  //   name: RouteName.tvPlayer.name,
  //   builder: (context, state) {
  //     return TvPlayerScreen(channel: state.extra as ChannelDriftData);
  //   },
  // ),
  GoRoute(
    path: '/tv-player',
    name: RouteName.tvPlayer.name,
    builder: (context, state) {
      return TVPlayerScreen(track: state.extra as Track);
    },
  ),
  // GoRoute(
  //   path: '/tv-player-full',
  //   name: RouteName.tvPlayerFull.name,
  //   builder: (context, state) {
  //     return TvPlayerFullScreen(channel: state.extra as Track);
  //   },
  // ),
  GoRoute(
    path: '/movie-detail',
    name: RouteName.movieDetail.name,
    builder: (context, state) {
      return MovieDetailScreen(channel: state.extra as ChannelDriftData);
    },
  ),
  // GoRoute(
  //   path: '/video-player-full',
  //   name: RouteName.videoPlayerFull.name,
  //   builder: (context, state) {
  //     return VideoPlayerFullScreen(channel: state.extra as ChannelDriftData);
  //   },
  // ),
  GoRoute(
    path: '/youtube-iframe-player/:videoId',
    name: RouteName.youtubeIframePlayer.name,
    builder: (context, state) {
      return YoutubeIframePlayerScreen(
        videoId: state.pathParameters["videoId"]!,
        title: state.uri.queryParameters["title"],
      );
    },
  ),

  GoRoute(
    path: '/source/manage',
    name: RouteName.manageSource.name,
    builder: (context, state) {
      return ManageSourceScreen();
    },
  ),
  GoRoute(
    path: '/source/add-new',
    name: RouteName.addNewSource.name,
    builder: (context, state) {
      return AddNewSourceScreen();
    },
  ),
  GoRoute(
    path: '/source/public-sources',
    name: RouteName.publicSources.name,
    builder: (context, state) {
      return PublicSourceListScreen();
    },
  ),
  GoRoute(
    path: '/source/public-sources/playlist',
    name: RouteName.publicSourcesPlaylist.name,
    builder: (context, state) {
      return PublicSourceListPlaylistScreen();
    },
  ),
  GoRoute(
    path: '/source/public-sources/playlist/tracks',
    name: RouteName.publicSourcesPlaylistTrack.name,
    builder: (context, state) {
      return PublicSourceListPlaylistTracksScreen();
    },
  ),

  // subtitle
  GoRoute(
    path: '/subtitle/search',
    name: RouteName.subtitleSearch.name,
    builder: (context, state) {
      return SubtitleSearchScreen();
    },
  ),

  // GoRoute(
  //   path: '/iptv-player-full',
  //   name: RouteName.iptvPlayerFull.name,
  //   builder: (context, state) {
  //     // return IPTVPlayerFullScreen(channel: state.extra as ChannelDriftData);
  //   },
  // ),
];

final router = GoRouter(
  // initialLocation: '/',
  initialLocation: '/home',
  routes: [...defaultRouter],
);
