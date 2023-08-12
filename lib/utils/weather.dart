import 'package:flutter/material.dart';
import 'package:goagrics/models/weather_model.dart';
import 'package:goagrics/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

Widget WeatherScreen(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(10.0),
    width: getWidth(context),
    height: getHeight(context) * 0.2,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: themeColorLight, width: 1.0)),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              // 'High: ${weatherModel.main?.tempMax}°C, Low: ${weatherModel.main?.tempMin}°C',
              'High: 29.2 °C, Low: 29.02 °C',
              style: GoogleFonts.urbanist(fontSize: 16),
            ),
            Text(
              // '${weatherModel.main?.temp}°C',
              '32°C',
              style: GoogleFonts.urbanist(
                fontSize: 36,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              // 'Feels Like: ${weatherModel.main?.feelsLike}°C',
              'Feels Like: 37.02 °C',
              style: GoogleFonts.urbanist(fontSize: 14),
            ),
          ],
        ),
        const SizedBox(
          width: 25,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              "https://openweathermap.org/img/wn/50n@2x.png",
              height: 100,
              width: 100,
            ),
            Text(
              // 'Humidity: ${weatherModel.main?.humidity}%',
              'Humidity: 80%',
              style: GoogleFonts.urbanist(fontSize: 16),
            ),
          ],
        )
      ],
    ),
  );
}
