import 'package:flutter/material.dart';
import 'package:goagrics/utils/horizontal_labor.dart';
import 'package:goagrics/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../auth_database/Api.dart';
import '../../../models/get_all_labors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<GetAllLabors> labors = [];
  var isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isLoading = true;
    });
    fetchLabors();
  }

  void fetchLabors() async {
    List<GetAllLabors> tempLabor = await Api.getLabors();
    setState(() {
      labors = tempLabor;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Lottie.asset('assets/animate/farm_animate.json')
        : SafeArea(
            child: Scaffold(
              appBar: AppBar(
                  leading: const Image(
                      image: AssetImage('assets/images/goagrics.png')),
                  backgroundColor: themeColorWhite,
                  elevation: 0.0,
                  title: Text(
                    'GoAgrics',
                    style: GoogleFonts.urbanist(
                        fontSize: 18.0, color: themeColorLight),
                  )),
              backgroundColor: themeColorWhite,
              body: Column(
                children: [
                  const Divider(
                    thickness: 1.5,
                    color: themeColorDark,
                  ),
                  // const SizedBox(
                  //   height: 50,
                  // ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        //   'Labors Near You',
                        //   style: GoogleFonts.notoSansJavanese(
                        //       color: themeColorDark, fontSize: 18),
                        // ),
                        // SizedBox(
                        //   height: 5.0,
                        // ),
                        // Container(
                        //   width: getWidth(context) * 0.42,
                        //   decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     border: Border.all(
                        //       color: themeColorLight,
                        //       width: 1,
                        //     ),
                        //     borderRadius: BorderRadius.circular(8.0),
                        //   ),
                        //   child: Padding(
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 20.0, vertical: 20.0),
                        //     child: Column(
                        //       crossAxisAlignment: CrossAxisAlignment.center,
                        //       children: [
                        //         Text(
                        //           'Name of Farmer',
                        //           style: GoogleFonts.urbanist(
                        //               fontWeight: FontWeight.bold),
                        //         ),
                        //         const SizedBox(
                        //           height: 10,
                        //         ),
                        //         Text(
                        //           'City Name | State',
                        //           style: GoogleFonts.urbanist(),
                        //           overflow: TextOverflow.ellipsis,
                        //         ),
                        //         const SizedBox(
                        //           height: 10,
                        //         ),
                        //         Text(
                        //           'Rs. XXX/Day',
                        //           style: GoogleFonts.urbanist(
                        //               fontWeight: FontWeight.w500),
                        //         ),
                        //         const SizedBox(
                        //           height: 10,
                        //         ),
                        //         ElevatedButton(
                        //           style: ElevatedButton.styleFrom(
                        //               backgroundColor: themeColorDark),
                        //           child: Text(
                        //             'Skills',
                        //             style: GoogleFonts.acme(color: themeColorWhite),
                        //           ),
                        //           onPressed: () {},
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        Container(
                          width: double.infinity,
                          height: getHeight(context) * 0.24,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: labors.length,
                            itemBuilder: ((context, index) {
                              return showCard(context, labors[index]);
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
