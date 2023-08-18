import 'package:flutter/material.dart';
import 'package:goagrics/models/get_single_farmer.dart';
import 'package:goagrics/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

Widget LandList(
    LandDetails land, BidDetails bids, String place, BuildContext context) {
  // print(land.lArea);
  // print(bids.bPrice);
  return Card(
    child: Container(
      padding: const EdgeInsets.all(4.0),
      width: getWidth(context) * 0.4,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Column(
        children: [
          Image.network(
            land.lImages!.first.url!,
            height: 150.0,
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            "Located at ${place}",
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
            "Bid Amount: ${bids.bPrice.toString()}",
            style: GoogleFonts.urbanist(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
