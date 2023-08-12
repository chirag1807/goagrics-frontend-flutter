import 'package:flutter/cupertino.dart';
import 'package:goagrics/models/weather_model.dart';

import 'constants.dart';

Widget weather(WeatherModel? weatherModel, double width){
  return Container(
    margin: const EdgeInsets.all(8.0),
    width: width,
    height: 180,
    decoration: BoxDecoration(
        color: themeColorWhite,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: themeColorDark, width: 2.0)
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              weatherModel != null && weatherModel.main != null ?
              'High: ${weatherModel.main?.tempMax}°C, Low: ${weatherModel.main?.tempMin}°C'
                  : "High: __°C, Low: __°C",
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              weatherModel != null && weatherModel.main != null ?
              '${weatherModel.main?.temp}°C'
                  : "__°C",
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w600),

            ),
            Text(
              weatherModel != null && weatherModel.main != null ?
              'Feels Like: ${weatherModel.main?.feelsLike}°C'
                  : "Feels Like: __°C",
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
        const SizedBox(width: 25,),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            weatherModel != null && weatherModel.weather != null ?
            Image.network("https://openweathermap.org/img/wn/${weatherModel.weather![0].icon}@2x.png", height: 100,)
                : Text("data"),
            Text(
              weatherModel != null && weatherModel.main != null ?
              'Humidity: ${weatherModel.main?.humidity}%'
                  : "Humidity: __%",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        )
      ],
    ),
  );
}
