import 'package:flutter/material.dart';
import 'package:goagrics/auth_database/Api.dart';
import 'package:goagrics/models/get_single_dealer.dart';
import 'package:goagrics/utils/ToolsList.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constants.dart';
import '../../../utils/weather.dart';
import '../../goagricbot.dart';

class DealerHome extends StatefulWidget {
  const DealerHome({super.key});

  @override
  State<DealerHome> createState() => _DealerHomeState();
}

class _DealerHomeState extends State<DealerHome> {
  GetSingleDealer? dealers;
  var isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isLoading = true;
    });
    fetchDealer();
  }

  void fetchDealer() async {
    dealers = await Api.getDealer('12345');
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: Lottie.asset('assets/animate/farm_animate.json'))
        : SafeArea(
            child: Scaffold(
              appBar: AppBar(
                leading: const Image(
                    image: AssetImage('assets/images/goagrics.png')),
                backgroundColor: themeColorWhite,
                elevation: 0.0,
                title: Text(
                  'GoAgrics',
                  style: AppTitle,
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GoAgricsBot(),
                          ));
                    },
                    icon: const Icon(Icons.smart_toy),
                    color: themeColorLight,
                  ),
                ],
              ),
              backgroundColor: themeColorWhite,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    const Divider(
                      thickness: 1.5,
                      color: themeColorDark,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: Text(
                              'Weather Analysis',
                              style: GoogleFonts.urbanist(
                                  color: themeColorLight, fontSize: 16.0),
                            ),
                          ),
                          const SizedBox(height: 8),
                          WeatherScreen(context),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 6.0),
                                child: Text(
                                  'Your Tools',
                                  style: GoogleFonts.urbanist(
                                      color: themeColorLight, fontSize: 16.0),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: double.infinity,
                            height: getHeight(context) * 0.20,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: dealers!.data!.toolDetails!.length,
                              itemBuilder: ((context, index) {
                                return ToolList(
                                    dealers!.data!.toolDetails![index], context);
                              }),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
