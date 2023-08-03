import 'package:flutter/material.dart';
import 'package:goagrics/models/weather_model.dart';
import 'package:goagrics/utils/constants.dart';

class WeatherScreen extends StatefulWidget {
  final WeatherModel weatherModel;
  const WeatherScreen({Key? key, required this.weatherModel}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(8.0),
          width: getWidth(context),
          height: 180,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: themeColorDark, width: 2.0)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'High: ${widget.weatherModel.main?.tempMax}°C, Low: ${widget.weatherModel.main?.tempMin}°C',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    '${widget.weatherModel.main?.temp}°C',
                    style: const TextStyle(
                        fontSize: 36, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Feels Like: ${widget.weatherModel.main?.feelsLike}°C',
                    style: const TextStyle(fontSize: 14),
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
                    "https://openweathermap.org/img/wn/${widget.weatherModel.weather![0].icon}@2x.png",
                    height: 100,
                  ),
                  Text(
                    'Humidity: ${widget.weatherModel.main?.humidity}%',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
