import 'package:flutter/material.dart';
import 'package:goagrics/utils/horizontal_labor.dart';
import 'package:goagrics/utils/constants.dart';
import 'package:goagrics/utils/weather.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../auth_database/Api.dart';
import '../../../models/get_all_labors.dart';
import '../../../models/weather_model.dart';
import '../weather_repo.dart';

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
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WeatherScreen(context),
                        SizedBox(height: 20),
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
