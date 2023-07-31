import 'package:flutter/material.dart';
import 'package:goagrics/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: themeColorWhite,
            elevation: 0.0,
            title: Text(
              'GoAgrics',
              style:
                  GoogleFonts.urbanist(fontSize: 18.0, color: themeColorLight),
            )),
        backgroundColor: themeColorWhite,
        body: const Column(
          children: [
            Divider(
              thickness: 1.5,
              color: themeColorDark,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text('Home Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
