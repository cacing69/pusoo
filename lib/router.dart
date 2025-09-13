import 'package:go_router/go_router.dart';
import 'package:pusoo/features/manage_playlist/presentation/screens/add_new_provider_screen.dart';
import 'package:pusoo/features/manage_playlist/presentation/screens/add_playlist_screen.dart';
import 'package:pusoo/features/detail/presentation/screens/detail_screen.dart';
import 'package:pusoo/features/home/presentation/screens/home_screen.dart';
import 'package:pusoo/features/manage_playlist/presentation/screens/manage_provider_screen.dart';
import 'package:pusoo/features/movie/presentation/screens/movie_detail_screen.dart';
import 'package:pusoo/features/tv/presentation/screens/tv_player_full_screen.dart';
import 'package:pusoo/features/video_player/presentation/screens/video_player_full_screen.dart';
import 'package:pusoo/features/tv/presentation/screens/tv_player_screen.dart';
import 'package:pusoo/features/welcome/presentation/screens/welcome_screen.dart';
import 'package:pusoo/shared/data/datasources/local/drift_database.dart';
import 'package:pusoo/shared/presentation/screens/youtube_iframe_player_screen.dart';

enum RouteName {
  welcome,
  home,
  detail,
  videoPlayer,
  videoPlayerFull,
  tvPlayer,
  tvPlayerFull,
  addPlaylist,
  movieDetail,
  manageProvider,
  addNewProvider,
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
    path: '/add-playlist',
    name: RouteName.addPlaylist.name,
    builder: (context, state) => AddPlaylistScreen(),
  ),
  GoRoute(
    path: '/detail/:movieId',
    name: RouteName.detail.name,
    builder: (context, state) {
      return DetailScreen(movieId: state.pathParameters['movieId']!);
    },
  ),
  GoRoute(
    path: '/tv-player',
    name: RouteName.tvPlayer.name,
    builder: (context, state) {
      return TvPlayerScreen(channel: state.extra as ChannelData);
    },
  ),
  GoRoute(
    path: '/tv-player-full',
    name: RouteName.tvPlayerFull.name,
    builder: (context, state) {
      return TvPlayerFullScreen(channel: state.extra as ChannelData);
    },
  ),
  GoRoute(
    path: '/movie-detail',
    name: RouteName.movieDetail.name,
    builder: (context, state) {
      return MovieDetailScreen(channel: state.extra as ChannelData);
    },
  ),
  GoRoute(
    path: '/video-player-full',
    name: RouteName.videoPlayerFull.name,
    builder: (context, state) {
      return VideoPlayerFullScreen(channel: state.extra as ChannelData);
    },
  ),
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
    path: '/manage-provider',
    name: RouteName.manageProvider.name,
    builder: (context, state) {
      return ManageProviderScreen();
    },
  ),
  GoRoute(
    path: '/add-new-provider',
    name: RouteName.addNewProvider.name,
    builder: (context, state) {
      return AddNewProviderScreen();
    },
  ),
  // GoRoute(
  //   path: '/iptv-player-full',
  //   name: RouteName.iptvPlayerFull.name,
  //   builder: (context, state) {
  //     // return IPTVPlayerFullScreen(channel: state.extra as ChannelData);
  //   },
  // ),
];

final router = GoRouter(
  // initialLocation: '/',
  initialLocation: '/home',
  routes: [...defaultRouter],
);
