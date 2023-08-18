import 'package:flutter/material.dart';
import 'package:goagrics/models/get_single_farmer.dart';
import 'package:goagrics/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/pages/Dealer/dealer_land.dart';

Widget LandList(LandDetails land, String location, String farName,
    String contact, String fid, BuildContext context) {
  return InkWell(
    onTap: () => Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DealerLand(
        land: land,
        place: location,
        farmer: farName,
        fphone: contact,
        fId: fid,
      ),
    )),
    child: Card(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        width: getWidth(context) * 0.4,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
        ),
        child: Row(
          children: [
            land.lImages!.isEmpty
                ? Image.asset(
                    'assets/images/goagrics.png',
                    height: 80.0,
                    width: 80,
                  )
                : Image.network(
                    land.lImages!.first.url!,
                    height: 80.0,
                    width: 80,
                  ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  "Located at ${location}",
                  style: GoogleFonts.urbanist(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  "${land.lArea!.toString()} Acres",
                  style: GoogleFonts.urbanist(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  "Land Price: ${land.lPrice}",
                  style: GoogleFonts.urbanist(fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
