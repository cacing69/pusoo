import 'package:go_router/go_router.dart';
import 'package:pusoo/features/add_playlist/presentation/screens/add_playlist_screen.dart';
import 'package:pusoo/features/detail/presentation/screens/detail_screen.dart';
import 'package:pusoo/features/home/presentation/screens/home_screen.dart';
import 'package:pusoo/features/iptv_player/presentation/screens/iptv_player_screen.dart';
import 'package:pusoo/features/welcome/presentation/screens/welcome_screen.dart';

enum RouteName { welcome, home, detail, iptvPlayer, addPlaylist }

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
    path: '/iptv-player',
    name: RouteName.iptvPlayer.name,
    builder: (context, state) {
      return IPTVPlayerScreen(channel: state.extra as Map);
    },
  ),
];

final router = GoRouter(
  // initialLocation: '/',
  initialLocation: '/home',
  routes: [...defaultRouter],
);
