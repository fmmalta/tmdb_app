import 'package:flutter/material.dart';
import 'package:movie_app/features/content/presentation/widgets/active_icon_widget.dart';
import 'package:movie_app/features/content/presentation/widgets/confirm_logout.dart';
import 'package:movie_app/features/content/presentation/widgets/default_bottom_bar_icon.dart';
import 'package:movie_app/features/content/presentation/widgets/movies_tab_view.dart';
import 'package:movie_app/features/content/presentation/widgets/tvshows_tab_view.dart';
import 'package:movie_app/features/list/presentation/pages/favorite_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _tabBarItems = <Widget>[
    const MoviesTabView(),
    const TVShowsTabView(),
    FavoriteListTabView()
  ];

  final List<String> _tabBarTitle = ["Filmes", "Séries", "Minhas listas"];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tabBarTitle[_currentIndex]),
        actions: [
          IconButton(
            onPressed: () => ConfirmLogout.execute(context),
            icon: const Icon(Icons.exit_to_app_outlined),
          )
        ],
      ),
      body: _tabBarItems[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: DefaultBottomBarIcon('assets/bottomMovieIcon.svg'),
            activeIcon: ActiveIconWidget('assets/bottomMovieIcon.svg'),
            label: "Filmes",
          ),
          BottomNavigationBarItem(
            icon: DefaultBottomBarIcon('assets/bottomTvIcon.svg'),
            activeIcon: ActiveIconWidget('assets/bottomTvIcon.svg'),
            label: "Séries",
          ),
          BottomNavigationBarItem(
            icon: DefaultBottomBarIcon('assets/bottomListIcon.svg'),
            activeIcon: ActiveIconWidget('assets/bottomListIcon.svg'),
            label: "Listas",
          ),
        ],
      ),
    );
  }
}
