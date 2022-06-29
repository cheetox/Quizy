import 'package:flutter/material.dart';
import 'package:quizlen/pages/main_pages/after_game_screen.dart';
import 'package:quizlen/pages/main_pages/edit_profile_screen.dart';
import 'package:quizlen/pages/main_pages/home_screen.dart';
import 'package:quizlen/pages/main_pages/leaderboard_screen.dart';

import 'categories_screen.dart';

void main() => runApp(MainBottomBarScreen());

class MainBottomBarScreen extends StatefulWidget {
  @override
  State<MainBottomBarScreen> createState() => _MainBottomBarScreenState();
}

class _MainBottomBarScreenState extends State<MainBottomBarScreen> {
  PageController _pageController = PageController();
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int _selectedIndex = 1;
  final tabs = [LeaderboardScreen(), AfterGameScreen(), EditProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        unselectedItemColor: Colors.grey,
        iconSize: 35,
        backgroundColor: Color(0xFF8E69B9),
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard_outlined),
            label: 'Leaderboard',
            backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
            backgroundColor: Colors.grey,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _selectedIndex = index);
          },
          children: <Widget>[
            LeaderboardScreen(),
            HomeScreen(),
            EditProfileScreen(),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      //
      //
      //using this page controller you can make beautiful animation effects
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.easeOut);
    });
  }
}
