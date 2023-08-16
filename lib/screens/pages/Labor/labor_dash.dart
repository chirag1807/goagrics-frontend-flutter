import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goagrics/screens/pages/Labor/labor_home.dart';
import 'package:goagrics/screens/pages/Labor/labor_profile.dart';
import 'package:goagrics/screens/pages/profile_user.dart';

import '../../../models/weather_model.dart';
import '../../../utils/constants.dart';

class LaborDash extends StatefulWidget {
  const LaborDash({super.key});

  @override
  State<LaborDash> createState() => _LaborDashState();
}

class _LaborDashState extends State<LaborDash> {
  late PageController _pageController;

  int page = 0;

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
      backgroundColor: themeColorWhite,
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          LaborHome(),
          LaborProfileScreen(),
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
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.add_circle_outlined,
          //     textDirection: TextDirection.rtl,
          //     color: page == 2 ? themeColorDark : themeColorLight,
          //   ),
          //   label: '',
          //   backgroundColor: Colors.black,
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.person,
          //     color: page == 3 ? themeColorDark : themeColorLight,
          //   ),
          //   label: '',
          //   backgroundColor: Colors.black,
          // ),
        ],
        onTap: navTapped,
      ),
    );
  }
}
