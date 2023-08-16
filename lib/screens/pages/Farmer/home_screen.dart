import 'package:flutter/material.dart';
import 'package:goagrics/screens/goagricbot.dart';
import 'package:goagrics/utils/horizontal_labor.dart';
import 'package:goagrics/utils/constants.dart';
import 'package:goagrics/utils/weather.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../auth_database/Api.dart';
import '../../../models/get_all_labors.dart';
import '../../../models/weather_model.dart';

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
    fetchWeather();
    fetchLabors();
    // print(labors.length);
  }

  WeatherModel? weatherData;

  void fetchWeather() async {
    // weatherData = await WeatherRepo().getWeather("Ahmedabad");
    // print(weatherData!.weather![0].icon);
    setState(() {});
  }

  void fetchLabors() async {
    List<GetAllLabors> tempLabor = await Api.getLabors();
    setState(() {
      labors = tempLabor;
      isLoading = false;
    });
    // print(tempLabor);
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
                          SizedBox(height: 8),
                          WeatherScreen(context),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 6.0),
                                child: Text(
                                  'Labors Near you',
                                  style: GoogleFonts.urbanist(
                                      color: themeColorLight, fontSize: 16.0),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'View All',
                                  style: GoogleFonts.urbanist(
                                    color: themeColorLight,
                                    fontSize: 14.0,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 8),
                          // Text('Hello'),
                          // Text(labors[0].lname!),
                          Container(
                            width: double.infinity,
                            height: getHeight(context) * 0.22,
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
            ),
          );
  }
}
