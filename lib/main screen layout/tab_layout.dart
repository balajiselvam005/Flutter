import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:peakpulse_test1/core/util/theme/themes.dart';

class TabLayout extends StatefulWidget {
  const TabLayout({super.key});

  @override
  State<TabLayout> createState() => _TabLayoutState();
}

class _TabLayoutState extends State<TabLayout> {
  late PageController pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _pageIndex = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: const [
          Center(
            child: Text('Home'),
          ),
          Center(
            child: Text('Feedback'),
          ),
          Center(
            child: Text('Create post'),
          ),
          Center(
            child: Text('Chat'),
          ),
          Center(
            child: Text('Your account'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        enableFeedback: false,
        onTap: navigationTapped,
        currentIndex: _pageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon:
                SvgPicture.asset('assets/icons/bottom_navigation_bar/home.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
                'assets/icons/bottom_navigation_bar/feedback.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
                'assets/icons/bottom_navigation_bar/create_post.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon:
                SvgPicture.asset('assets/icons/bottom_navigation_bar/chat.svg'),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.circle_outlined),
            label: '',
          ),
        ],
      ),
    );
  }
}
