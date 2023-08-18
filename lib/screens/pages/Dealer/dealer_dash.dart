import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goagrics/models/get_all_farmers.dart';
import 'package:goagrics/utils/FarmersList.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../auth_database/Api.dart';
import '../../../utils/constants.dart';
import '../../../utils/prefs.dart';
import 'dealer_home.dart';
import 'dealer_profile.dart';
import 'dealer_tools.dart';

class DealerDash extends StatefulWidget {
  const DealerDash({super.key});

  @override
  State<DealerDash> createState() => _DealerDashState();
}

class _DealerDashState extends State<DealerDash> {
  late PageController _pageController;

  int page = 0;
  List<GetAllFarmers>? farmers;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    // print(Prefs.getInstance().getString(ID));
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
          DealerHome(),
          // FarmersList(),
          DealerTools(),
          DealerProfile(),
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(
                  Icons.home,
                  color: page == 0 ? themeColorDark : themeColorLight,
                ),
                // const SizedBox(height: 3),
                // Text('Home')
              ],
            ),
            label: '',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.supervised_user_circle_rounded,
              color: page == 1 ? themeColorDark : themeColorLight,
            ),
            label: '',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outlined,
              // textDirection: TextDirection.rtl,
              color: page == 2 ? themeColorDark : themeColorLight,
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
