import 'dart:async';
import 'package:flutter/material.dart';
import 'package:goagrics/screens/pages/farmer_dash.dart';
import 'package:goagrics/providers/splash_screen_provider.dart';
import 'package:goagrics/screens/reg_login/login_screen.dart';
import 'package:goagrics/screens/reg_login/registration_screen.dart';
import 'package:goagrics/utils/constants.dart';
import 'package:provider/provider.dart';

import '../utils/prefs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SplashScreenProvider())
      ],
      child: Scaffold(
        body: SafeArea(
          child: Consumer<SplashScreenProvider>(
            builder: (context, provider, _) {
              void checkLoginReg() async {
                int? a = await provider.checkLoginAndReg();
                print("a: $a");
                if (a == 1) {
                  Timer(const Duration(seconds: 2), () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegistrationScreen()));
                  });
                } else if (a == 2) {
                  Timer(const Duration(seconds: 2), () {
                    String? category = Prefs.getInstance().getString(CATEGORY);
                    if(category == "Farmer"){
                      print("Ha Bhai ha.............");
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const FarmerDash()));
                    }
                    else if(category == "Labor"){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const FarmerDash()));
                    }
                    else if(category == "Dealer"){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const FarmerDash()));
                    }
                    else{
                      showSnackBar("Something Went Wrong...Please Try Again Later...", context, themeColorSnackBarRed);
                    }
                  });
                } else {
                  Timer(const Duration(seconds: 2), () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                  });
                }

                // WeatherModel? weather = await provider.checkLoginAndReg();
                // if(weather != null){
                //   Timer(const Duration(seconds: 3), () {
                //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WeatherScreen(weatherModel: weather)));
                //   });
                // }
              }

              checkLoginReg();
              return Container(
                color: themeColorWhite,
                width: getWidth(context),
                height: getHeight(context),
                alignment: Alignment.center,
                child: Image.asset("assets/images/logo.jpeg"),
              );
            },
          ),
        ),
      ),
    );
}
}
