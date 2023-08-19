import 'package:flutter/material.dart';
import 'package:goagrics/auth_database/Api.dart';
import 'package:goagrics/models/get_single_farmer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constants.dart';

class DealerLand extends StatefulWidget {
  LandDetails land;
  String place;
  String farmer;
  String fId;
  DealerLand(
      {super.key,
      required this.land,
      required this.place,
      required this.farmer,
      required this.fId,
      required String fphone});

  @override
  State<DealerLand> createState() => _DealerLandState();
}

class _DealerLandState extends State<DealerLand> {
  bool loading = false;
  TextEditingController bidController = TextEditingController();
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
      body: loading
          ? Lottie.asset('assets/animate/farm_animate.json')
          : SingleChildScrollView(
              child: Column(
                children: [
                  const Divider(
                    thickness: 1.5,
                    color: themeColorDark,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(children: [
                      Image.network(widget.land.lImages!.first.url!),
                      const SizedBox(height: 30),
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              enabled: false,
                              decoration: InputDecoration(
                                  label: Text(
                                    'Farmer Name: ${widget.farmer}',
                                    style: GoogleFonts.urbanist(
                                        color: themeColorBlack, fontSize: 15),
                                  ),
                                  prefixIcon: const Icon(
                                    LineAwesomeIcons.user,
                                    color: themeColorLight,
                                  )),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              enabled: false,
                              decoration: InputDecoration(
                                  label: Text(
                                    'Land Type : ${widget.land.lType}',
                                    style: GoogleFonts.urbanist(
                                        color: themeColorBlack, fontSize: 15),
                                  ),
                                  prefixIcon: const Icon(
                                      Icons.landslide_rounded,
                                      color: themeColorLight)),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              enabled: false,
                              decoration: InputDecoration(
                                  label: Text(
                                    "Place : ${widget.place}",
                                    style: GoogleFonts.urbanist(
                                        color: themeColorBlack, fontSize: 15),
                                  ),
                                  prefixIcon: const Icon(Icons.place,
                                      color: themeColorLight)),
                            ),
                            const SizedBox(height: 30),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  setState(() {
                                    loading = true;
                                  });
                                  // setState(() {
                                  //   editing = editing ? false : true;
                                  // });
                                  // print("Hello");
                                  if (bidController.text.isEmpty) {
                                    showSnackBar('Bid Must not be empty',
                                        context, themeColorSnackBarRed);
                                  } else {
                                    bool res = await Api.registerBid(
                                        bidController.text,
                                        widget.fId,
                                        widget.land.sId!);
                                    setState(() {
                                      loading = false;
                                    });
                                    if (res)
                                      showSnackBar('Bid Registered', context,
                                          themeColorSnackBarGreen);
                                    else
                                      showSnackBar('Bid Failed to Register',
                                          context, themeColorSnackBarGreen);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: themeColorLight,
                                    side: BorderSide.none,
                                    shape: const StadiumBorder()),
                                child: Text("Place Bid",
                                    style: GoogleFonts.prompt(
                                        color: themeColorWhite)),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            showBidCard()
                            // if (!editing)
                          ],
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
    );
  }

  Widget showBidCard() {
    return Container(
      child: Column(
        children: [
          TextFormField(
            controller: bidController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                label: Text(
                  "Enter your Bid",
                  style: GoogleFonts.urbanist(
                      color: themeColorBlack, fontSize: 15),
                ),
                prefixIcon: const Icon(Icons.currency_rupee_sharp,
                    color: themeColorLight)),
          ),
        ],
      ),
    );
  }
}
