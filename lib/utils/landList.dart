import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goagrics/models/get_single_farmer.dart';

Widget LandList(LandDetails land) {
  return Card(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, style: BorderStyle.solid),
      ),
      child: Column(
        children: [
          Image.network(
            land.lImages!.first.url!,
            width: 100.0,
            height: 100.0,
          ),
          const SizedBox(
            height: 5.0,
          ),
        ],
      ),
    ),
  );
}
