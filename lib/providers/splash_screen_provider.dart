import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/prefs.dart';

class SplashScreenProvider extends ChangeNotifier{
  Future<int?> checkLoginAndReg() async {
    bool? isLoggedIn = Prefs.getInstance().getBool(IS_LOGGED_IN);
    bool? isRegistered = Prefs.getInstance().getBool(IS_REGISTERED);

    //login done => 1, registration done => 2, else 0
    print(isRegistered);
    if(isLoggedIn == true){
      if(isRegistered == true){
        return 2;
      }
      else{
        return 1;
      }
    }
    else{
      return 0;
    }

    // var result = await WeatherRepo().getWeather("ahmedabad");
    // if(result != null){
    //   return result;
    // }
    // return WeatherModel();
  }
}