import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goagrics/models/get_single_farmer.dart';
import 'package:goagrics/utils/ToolsList.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/constants.dart';

class GetTools extends StatefulWidget {
  GetSingleFarmer farmer;
  GetTools({super.key, required this.farmer});

  @override
  State<GetTools> createState() => _GetToolsState();
}

class _GetToolsState extends State<GetTools> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: themeColorDark,
              )),
        ]),
        backgroundColor: themeColorWhite,
        elevation: 0.0,
        title: Row(
          children: [
            const Image(
              image: AssetImage('assets/images/goagrics.png'),
              height: 50,
              width: 50,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              'GoAgrics',
              style: AppTitle,
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          widget.farmer.data!.toolDetails!.map((e) => ToolList(e));
          return null;
        },
        itemCount: widget.farmer.data!.landDetails!.length,
      ),
    );
  }
}