import 'package:flutter/material.dart';
import 'package:goagrics/models/get_single_farmer.dart';
import 'package:goagrics/repositories/update_land.dart';
import 'package:goagrics/screens/pages/Farmer/update_land_tool.dart';
import 'package:goagrics/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

Widget LandList(
    LandDetails land, BidDetails bids, String place, BuildContext context) {
  return Card(
    child: InkWell(
      onDoubleTap: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UpdateLandTool(
            area: land.lArea!, type: land.lType!, price: land.lPrice.toString(), toolPrice: '', pickedImg: land.lImages!.first.url!,
            landId: land.sId!, toolId: '', indicator: 0))
        );
      },
      onLongPress: () async {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: themeColorWhite,
              title: Text(
                'Delete',
                style: GoogleFonts.prompt(fontSize: 16.0),
              ),
              content: Text(
                'Are you sure, you want to delete this land?',
                style: GoogleFonts.prompt(fontSize: 15.0),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'CANCEL',
                    style: GoogleFonts.prompt(
                        color: themeColorLight),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    int? a = await UpdateLandRepo().deleteFarmersLand(land.sId!);
                    if(a == 1){
                      showSnackBar("Land Deleted Successfully", context, themeColorSnackBarGreen);
                    }
                    else{
                      showSnackBar("Something Went Wrong...Please Try Again Later...", context, themeColorSnackBarRed);
                    }
                    Navigator.pop(context);
                  },
                  child: Text(
                    'YES',
                    style: GoogleFonts.prompt(
                        color: themeColorSnackBarRed),
                  ),
                ),
              ],
            );
          },
        );
      },
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
    ),
  );
}
