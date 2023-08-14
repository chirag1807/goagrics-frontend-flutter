import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/weather_model.dart';
import '../../../utils/constants.dart';
import '../../../utils/weather.dart';

class LaborHome extends StatefulWidget {
  const LaborHome({super.key});

  @override
  State<LaborHome> createState() => _LaborHomeState();
}

class _LaborHomeState extends State<LaborHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchWeather();
  }

  WeatherModel? weatherData;

  void fetchWeather() async {
    // weatherData = await WeatherRepo().getWeather("Ahmedabad");
    // print(weatherData!.weather![0].icon);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Image(image: AssetImage('assets/images/goagrics.png')),
          backgroundColor: themeColorWhite,
          elevation: 0.0,
          title: Text(
            'GoAgrics',
            style: AppTitle,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.smart_toy),
              color: themeColorLight,
            ),
          ],
        ),
        backgroundColor: themeColorWhite,
        body: Column(
          children: [
            const Divider(
              thickness: 1.5,
              color: themeColorDark,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
