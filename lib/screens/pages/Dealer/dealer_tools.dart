import 'package:flutter/material.dart';
import 'package:goagrics/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../models/get_all_farmers.dart';
import '../../../utils/FarmersList.dart';
import '../../../utils/LaborsList.dart';

class DealerTools extends StatefulWidget {
  const DealerTools({super.key});

  @override
  State<DealerTools> createState() => _DealerToolsState();
}

class _DealerToolsState extends State<DealerTools> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelColor: themeColorLight,
            indicatorColor: themeColorLight,
            tabs: [
              Tab(
                child: Text(
                  "Farmers",
                  style: GoogleFonts.urbanist(
                    fontSize: 15.0,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Labors",
                  style: GoogleFonts.urbanist(
                    fontSize: 15.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          FarmersList(),
          LaborsList(),
        ]),
      ),
    );
  }
}
