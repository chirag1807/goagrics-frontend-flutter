import 'package:flutter/material.dart';
import 'package:goagrics/screens/splash_screen.dart';
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

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ).copyWith(useMaterial3: true),
        home: const SplashScreen()
    );
  }
}
