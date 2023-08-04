import 'package:flutter/material.dart';
import 'package:goagrics/auth_database/Api.dart';
import 'package:goagrics/utils/constants.dart';
import 'package:goagrics/utils/vertical_farmer.dart';
import 'package:google_fonts/google_fonts.dart';

class LaborList extends StatefulWidget {
  const LaborList({super.key});

  @override
  State<LaborList> createState() => _LaborListState();
}

class _LaborListState extends State<LaborList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Api.getFarmers();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            leading:
                const Image(image: AssetImage('assets/images/goagrics.png')),
            backgroundColor: themeColorWhite,
            elevation: 0.0,
            title: Text(
              'GoAgrics',
              style:
                  GoogleFonts.urbanist(fontSize: 18.0, color: themeColorLight),
            )),
        backgroundColor: themeColorWhite,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Labors Details: '),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return laborListCard();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
