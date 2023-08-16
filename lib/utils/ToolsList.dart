import 'package:flutter/material.dart';
import 'package:goagrics/models/get_single_farmer.dart';
import 'package:google_fonts/google_fonts.dart';

Widget ToolList(ToolDetails tools) {
  return Card(
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          Image.network(
            tools.tImages!.first.url!,
            width: 50,
            height: 90,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            "Price: ${tools.tPrice.toString()}/-",
            style: GoogleFonts.urbanist(fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
  );
}
