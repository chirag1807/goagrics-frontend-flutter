import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goagrics/screens/pages/Farmer/register_land.dart';
import 'package:goagrics/screens/pages/profile_user.dart';
import 'package:goagrics/utils/constants.dart';

import 'Farmer/home_screen.dart';
import 'Farmer/labor_screen.dart';

class FarmerDash extends StatefulWidget {
  const FarmerDash({super.key});

  @override
  State<FarmerDash> createState() => _FarmerDashState();
}

class _FarmerDashState extends State<FarmerDash> {
  late PageController _pageController;

  int page = 2;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void navTapped(int page) {
    _pageController.jumpToPage(page);
  }

  void onPageChanged(int val) {
    setState(() {
      page = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Home(),
          LaborList(),
          RegisterLand(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: page == 0 ? themeColorDark : themeColorLight,
            ),
            label: '',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.work,
              color: page == 1 ? themeColorDark : themeColorLight,
            ),
            label: '',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outlined,
              textDirection: TextDirection.rtl,
              color: page == 2 ? themeColorDark : themeColorLight,
            ),
            label: '',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: page == 3 ? themeColorDark : themeColorLight,
            ),
            label: '',
            backgroundColor: Colors.black,
          ),
        ],
        onTap: navTapped,
      ),
    );
  }
}
