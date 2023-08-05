import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/get_all_labors.dart';
import 'constants.dart';

Widget laborListCard(GetAllLabors labor) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(labor.avatar!.url!),
            radius: 40,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10)
                .copyWith(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  labor.lname!,
                  style: GoogleFonts.urbanist(
                      color: themeColorLight,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${labor.wage.toString()}/- Per Day",
                  style: GoogleFonts.urbanist(
                      color: themeColorLight,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Contact at ${labor.phoneNo.toString()}",
                  style: GoogleFonts.urbanist(
                      color: themeColorLight,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  '${labor.skills.toString()}',
                  style: GoogleFonts.urbanist(
                      color: themeColorLight,
                      fontSize: 15,
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
