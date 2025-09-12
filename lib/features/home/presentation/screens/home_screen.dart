import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:pusoo/features/explore/presentation/screens/explore_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return FScaffold(
      footer: FBottomNavigationBar(
        children: [
          FBottomNavigationBarItem(
            icon: Icon(FIcons.monitor),
            label: Text('TV'),
          ),
          FBottomNavigationBarItem(
            icon: Icon(FIcons.monitorPlay),
            label: Text('Movie'),
          ),
          FBottomNavigationBarItem(
            icon: Icon(FIcons.monitorCheck),
            label: Text('Series'),
          ),
          FBottomNavigationBarItem(
            icon: Icon(FIcons.boomBox),
            label: Text('Radio'),
          ),
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
      child: IndexedStack(index: 0, children: [ExploreScreen()]),
    );
  }
}
