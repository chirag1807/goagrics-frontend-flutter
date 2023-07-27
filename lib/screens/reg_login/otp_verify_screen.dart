import 'package:flutter/material.dart';
import 'package:goagrics/utils/constants.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  List<String> otpDigits = List.filled(4, '');

  void _onNumberPadTap(String number) {
    setState(() {
      for (int i = 0; i < otpDigits.length; i++) {
        if (otpDigits[i].isEmpty) {
          otpDigits[i] = number;
          break;
        }
      }
    });
  }

  void _onBackspaceTap() {
    setState(() {
      for (int i = otpDigits.length - 1; i >= 0; i--) {
        if (otpDigits[i].isNotEmpty) {
          otpDigits[i] = '';
          break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: getWidth(context),
          height: getHeight(context),
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Verify Phone',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: themeColorDark),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              const Text(
                'Enter the OTP',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'We have Sent OTP to +91',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < otpDigits.length; i++)
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          otpDigits[i],
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 1.5,
                  children: [
                    ...List.generate(9, (index) {
                      return Center(
                        child: TextButton(
                          onPressed: () => _onNumberPadTap('${index + 1}'),
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(fontSize: 20, color: themeColorLight),
                          ),
                        ),
                      );
                    }),
                    const Center(),
                    Center(
                      child: TextButton(
                        onPressed: () => _onNumberPadTap('0'),
                        child: const Text(
                          '0',
                          style: TextStyle(fontSize: 20, color: themeColorLight),
                        ),
                      ),
                    ),
                    Center(
                      child: IconButton(
                        icon: const Icon(Icons.backspace, color: themeColorLight,),
                        onPressed: _onBackspaceTap,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: themeColorDark
                ),
                onPressed: () {
                  if(otpDigits.join().length == 4) {
                    print(otpDigits.join());
                  }
                  else{
                    //show snack bar
                  }
                },
                child: const Text('Verify OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
