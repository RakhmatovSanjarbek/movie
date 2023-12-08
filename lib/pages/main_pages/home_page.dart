import 'dart:developer';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie/pages/main_pages/favorite_page.dart';
import 'package:movie/pages/main_pages/movie_page.dart';
import 'package:movie/pages/main_pages/profile_page.dart';
import 'package:movie/provider/app_provider.dart';
import 'package:provider/provider.dart';

import '../../data/movie_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<MovieModel> movieList = [];
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 1);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 1);

  int maxCount = 3;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = [
    SavedPage(),
    MoviePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final themBool = context.watch<AppProvider>();
    return Scaffold(
      body: PageView(

        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
        /// Provide NotchBottomBarController
        notchBottomBarController: _controller,
        showLabel: false,
        notchColor: Colors.blueGrey,



        /// restart app if you change removeMargins
        removeMargins: false,
        bottomBarWidth: 500,
        durationInMilliSeconds: 300,
        bottomBarItems: const [
          BottomBarItem(
            inActiveItem: Icon(
            Icons.favorite_border,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.favorite,
              color: Color(0xffe50707),
            ),
            itemLabel: 'Page 1',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              CupertinoIcons.home,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              CupertinoIcons.house_fill,
              color: Colors.blue,
            ),
            itemLabel: 'Page 2',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              CupertinoIcons.person,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              CupertinoIcons.person_fill,
              color: Colors.blue,
            ),
            itemLabel: 'Page 3',
          ),
        ],
        onTap: (index) {
          /// perform action on tab change and to update pages you can update pages without pages
          log('current selected index $index');
          _pageController.jumpToPage(index);
        },
      )
          : null,
    );
  }
}