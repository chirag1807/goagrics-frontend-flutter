import 'package:flutter/material.dart';
import 'package:goagrics/screens/pages/farmer_dash.dart';
import 'package:goagrics/screens/reg_login/login_screen.dart';

import 'package:goagrics/utils/prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.createInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("Hello");
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ).copyWith(useMaterial3: true),
        home: FarmerDash());
  }
}
