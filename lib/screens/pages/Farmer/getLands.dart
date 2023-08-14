import 'package:flutter/material.dart';
import 'package:goagrics/models/get_single_farmer.dart';

import '../../../utils/constants.dart';
import '../../../utils/landList.dart';

class GetLands extends StatefulWidget {
  GetSingleFarmer farmer;
  GetLands({super.key, required this.farmer});

  @override
  State<GetLands> createState() => _GetLandsState();
}

class _GetLandsState extends State<GetLands> {
  @override
  Widget build(BuildContext context) {
    print(widget.farmer.data!.landDetails!.length);
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
          widget.farmer.data!.landDetails!.map((e) => LandList(e));
          // return null;
        },
        itemCount: widget.farmer.data!.landDetails!.length,
      ),
    );
  }
}
