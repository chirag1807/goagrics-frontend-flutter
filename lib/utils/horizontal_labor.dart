import 'package:flutter/material.dart';
import 'package:goagrics/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/get_all_labors.dart';

Widget showCard(BuildContext context, GetAllLabors labor) {
  print("Labor name is ${labor.lname!}");
  return InkWell(
    onTap: () {},
    child: Container(
      width: getWidth(context) * 0.5,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: themeColorLight,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              labor.lname!,
              style: GoogleFonts.urbanist(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'City Name | State',
              style: GoogleFonts.urbanist(),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Rs. ${labor.wage.toString()} /-',
              style: GoogleFonts.urbanist(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(5),
              height: getHeight(context) * 0.05,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: themeColorDark),
              child: Text(
                '${labor.skills.toString()}',
                style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w500,
                    color: themeColorWhite,
                    fontSize: 12),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
