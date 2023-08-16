import 'dart:convert';
import 'dart:developer';
import 'package:goagrics/utils/constants.dart';
import '../models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherRepo {
  Future<WeatherModel?> getWeather(String city) async {
    try {
      var queryParams = {"q": city, "appid": apikey, "units": "metric"};
      final uri =
          Uri.https("api.openweathermap.org", "/data/2.5/weather", queryParams);
      var response = await http.get(uri);

      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);

        WeatherModel weatherModel = WeatherModel.fromJson(body);
        return weatherModel;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
