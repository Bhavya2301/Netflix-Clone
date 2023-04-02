import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/home_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    const HomeScreen(
      key: PageStorageKey('homeScreen'),
    ),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];

  final Map<String, IconData> _icons = {
    'Home': Icons.home,
    'Search': Icons.search,
    'News & Hot': Icons.queue_play_next,
    'Download': Icons.file_download,
    'Fast Laughs': Icons.emoji_emotions,
  };

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        duration: const Duration(milliseconds: 400),
        selectedItemColor: const Color(0xFFE50914),
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: _icons
            .map((title, icon) => MapEntry(
                title,
                SalomonBottomBarItem(
                  icon: Icon(
                    icon,
                    size: 25.0,
                  ),
                  title: Text(title),
                )))
            .values
            .toList(),
      ),
    );
  }
}
