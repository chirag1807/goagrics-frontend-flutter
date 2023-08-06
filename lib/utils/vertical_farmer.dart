import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

Widget laborListCard() {
  return Card(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 40,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name of Labor',
                  style: GoogleFonts.urbanist(
                      color: themeColorLight,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Wages',
                  style: GoogleFonts.urbanist(
                      color: themeColorLight,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Skills',
                  style: GoogleFonts.urbanist(
                      color: themeColorLight,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ))
        ],
      ),
    ),
  );
}
