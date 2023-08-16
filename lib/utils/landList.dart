import 'package:flutter/material.dart';
import 'package:goagrics/models/get_single_farmer.dart';
import 'package:goagrics/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

Widget LandList(BuildContext context) {
  // print(land.lArea);
  // print(bids.bPrice);
  return Card(
    child: Container(
      padding: const EdgeInsets.all(4.0),
      width: getWidth(context) * 0.4,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Column(
        children: [
          // Image.network(
          //   land.lImages!.first.url!,
          //   width: getWidth(context) * 0.3,
          //   height: 100.0,
          // ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            'Ahmedabad',
            style: GoogleFonts.urbanist(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            '21000',
            style: GoogleFonts.urbanist(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
