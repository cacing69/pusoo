import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:pusoo/features/movie/presentation/screens/movie_screen.dart';
import 'package:pusoo/features/serie/presentation/screens/serie_screen.dart';
import 'package:pusoo/features/setting/presentation/screens/setting_screen.dart';
import 'package:pusoo/features/tv/presentation/screens/tv_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      footer: FBottomNavigationBar(
        onChange: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        children: [
          FBottomNavigationBarItem(
            icon: Icon(FIcons.earth),
            label: Text('Explore'),
          ),
          FBottomNavigationBarItem(
            icon: Icon(FIcons.monitor),
            label: Text('Live TV'),
          ),
          FBottomNavigationBarItem(
            icon: Icon(FIcons.monitorPlay),
            label: Text('Movie'),
          ),
          FBottomNavigationBarItem(
            icon: Icon(FIcons.monitorCheck),
            label: Text('Series'),
          ),
          // FBottomNavigationBarItem(
          //   icon: Icon(FIcons.boomBox),
          //   label: Text('Radio'),
          // ),
          // FBottomNavigationBarItem(
          //   icon: Icon(FIcons.heart),
          //   label: Text('Favorites'),
          // ),
          // FBottomNavigationBarItem(
          //   icon: Icon(FIcons.list),
          //   label: Text('Playlist'),
          // ),
          FBottomNavigationBarItem(
            icon: Icon(FIcons.settings),
            label: Text('Setting'),
          ),
        ],
      ),
      child: IndexedStack(
        index: selectedIndex,
        children: [
          Placeholder(),
          TvScreen(),
          MovieScreen(),
          SerieScreen(),
          SettingScreen(),
        ],
      ),
    );
  }
}
