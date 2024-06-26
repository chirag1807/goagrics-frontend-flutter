import 'package:flutter/material.dart';
import 'package:goagrics/screens/reg_login/otp_verify_screen.dart';
import 'package:goagrics/screens/splash_screen.dart';
import 'package:goagrics/utils/prefs.dart';

void main() async {
  // await Prefs.createInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ).copyWith(useMaterial3: true),
      home: OtpVerifyScreen(
        generatedCode: '202020',
      ),
    );
  }
}
