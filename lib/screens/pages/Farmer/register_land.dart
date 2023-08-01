import 'package:flutter/material.dart';

class RegisterLand extends StatefulWidget {
  const RegisterLand({super.key});

  @override
  State<RegisterLand> createState() => _RegisterLandState();
}

class _RegisterLandState extends State<RegisterLand> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
        body: Text('Register My Land'),
      ),
    );
  }
}
