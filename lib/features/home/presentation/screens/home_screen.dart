import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:pusoo/features/explore/presentation/screens/explore_screen.dart';
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
    final orientation = MediaQuery.of(context).orientation;
    final width = MediaQuery.of(context).size.width;
    final isPotrait = orientation == Orientation.portrait;

    return FScaffold(
      resizeToAvoidBottomInset: false,
      sidebar: isPotrait
          ? SizedBox.shrink()
          : FSidebar(
              children: [
                FSidebarGroup(
                  children: [
                    FSidebarItem(
                      icon: const Icon(FIcons.compass),
                      label: const Text('Explore'),
                      selected: selectedIndex == 0,
                      onPress: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                    ),
                    FSidebarItem(
                      icon: const Icon(FIcons.monitor),
                      selected: selectedIndex == 1,
                      label: const Text('Live TV'),
                      onPress: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                    ),
                    FSidebarItem(
                      icon: const Icon(FIcons.monitorPlay),
                      selected: selectedIndex == 2,
                      label: const Text('Movies'),
                      onPress: () {
                        setState(() {
                          selectedIndex = 2;
                        });
                      },
                    ),
                    FSidebarItem(
                      icon: const Icon(FIcons.monitorCheck),
                      selected: selectedIndex == 3,
                      label: const Text('TV Series'),
                      onPress: () {
                        setState(() {
                          selectedIndex = 3;
                        });
                      },
                    ),
                    FSidebarItem(
                      icon: const Icon(FIcons.settings),
                      selected: selectedIndex == 4,
                      label: const Text('Settings'),
                      onPress: () {
                        setState(() {
                          selectedIndex = 4;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
      footer: isPotrait
          ? FBottomNavigationBar(
              onChange: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              children: [
                FBottomNavigationBarItem(
                  icon: Icon(
                    FIcons.compass,
                    color: selectedIndex == 0
                        ? context.theme.colors.primary
                        : null,
                  ),
                  label: Text(
                    'Explore',
                    style: TextStyle(
                      color: selectedIndex == 0
                          ? context.theme.colors.primary
                          : null,
                      fontWeight: selectedIndex == 0 ? FontWeight.w600 : null,
                    ),
                  ),
                ),
                FBottomNavigationBarItem(
                  icon: Icon(
                    FIcons.monitor,
                    color: selectedIndex == 1
                        ? context.theme.colors.primary
                        : null,
                  ),
                  label: Text(
                    'Live TV',
                    style: TextStyle(
                      color: selectedIndex == 1
                          ? context.theme.colors.primary
                          : null,
                      fontWeight: selectedIndex == 1 ? FontWeight.w600 : null,
                    ),
                  ),
                ),
                FBottomNavigationBarItem(
                  icon: Icon(
                    FIcons.monitorPlay,
                    color: selectedIndex == 2
                        ? context.theme.colors.primary
                        : null,
                  ),
                  label: Text(
                    'Movies',
                    style: TextStyle(
                      color: selectedIndex == 2
                          ? context.theme.colors.primary
                          : null,
                      fontWeight: selectedIndex == 2 ? FontWeight.w600 : null,
                    ),
                  ),
                ),
                FBottomNavigationBarItem(
                  icon: Icon(
                    FIcons.monitorCheck,
                    color: selectedIndex == 3
                        ? context.theme.colors.primary
                        : null,
                  ),
                  label: Text(
                    'TV Series',
                    style: TextStyle(
                      color: selectedIndex == 3
                          ? context.theme.colors.primary
                          : null,
                      fontWeight: selectedIndex == 3 ? FontWeight.w600 : null,
                    ),
                  ),
                ),
                FBottomNavigationBarItem(
                  icon: Icon(
                    FIcons.settings,
                    color: selectedIndex == 4
                        ? context.theme.colors.primary
                        : null,
                  ),
                  label: Text(
                    'Settings',
                    style: TextStyle(
                      color: selectedIndex == 4
                          ? context.theme.colors.primary
                          : null,
                      fontWeight: selectedIndex == 4 ? FontWeight.w600 : null,
                    ),
                  ),
                ),
              ],
            )
          : SizedBox.shrink(),
      child: IndexedStack(
        index: selectedIndex,
        children: [
          ExploreScreen(),
          TvScreen(),
          MovieScreen(),
          SerieScreen(),
          SettingScreen(),
        ],
      ),
    );
  }
}
