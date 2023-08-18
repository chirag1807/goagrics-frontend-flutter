import 'package:flutter/material.dart';
import 'package:goagrics/models/get_single_farmer.dart';
import 'package:goagrics/repositories/update_tool.dart';
import 'package:google_fonts/google_fonts.dart';

import '../repositories/update_land.dart';
import 'constants.dart';

Widget ToolList(ToolDetails tools, BuildContext context) {
  return Card(
    child: InkWell(
      onLongPress: (){
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
                'Are you sure, you want to delete this tool?',
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
                    int? a = await UpdateToolRepo().deleteFarmersTool(tools.sId!);
                    if(a == 1){
                      showSnackBar("Tool Deleted Successfully", context, themeColorSnackBarGreen);
                    }
                    else{
                      showSnackBar("Something Went Wrong...Please Try Again Later...", context, themeColorSnackBarRed);
                    }
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
    ),
  );
}
