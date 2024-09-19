import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/add_post_screen.dart';
import 'package:instagram_clone/util/colors.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController pageController;

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
      _page = page;
    });
  }

  @overridea
  Widget build(BuildContext context) {
    // User user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: const [
          Text('feed'),
          Text('search'),
          AddPostScreen(),
          Text('favourite'),
          Text('profile'),
        ],
        physics: const NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: navigationTapped,
        currentIndex: _page,
        backgroundColor: mobileBackgroundColor,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home,
            ),
            label: '',
            backgroundColor: (_page == 0) ? primaryColor : secondaryColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.search,
            ),
            label: '',
            backgroundColor: (_page == 1) ? primaryColor : secondaryColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.add_circle,
            ),
            label: '',
            backgroundColor: (_page == 2) ? primaryColor : secondaryColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.favorite,
            ),
            label: '',
            backgroundColor: (_page == 3) ? primaryColor : secondaryColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.person,
            ),
            label: '',
            backgroundColor: (_page == 4) ? primaryColor : secondaryColor,
          ),
        ],
      ),
    );
  }
}
