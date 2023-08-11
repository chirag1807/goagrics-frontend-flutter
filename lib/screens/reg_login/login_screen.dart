import 'package:flutter/material.dart';
import 'package:goagrics/auth_database/AuthServices.dart';
import 'package:goagrics/screens/reg_login/otp_verify_screen.dart';
import 'package:goagrics/utils/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneNoController = TextEditingController();

  void _onNumberPadTap(String number) {
    if (_phoneNoController.text.length < 10) {
      setState(() {
        _phoneNoController.text += number;
      });
    }
  }

  void _onBackspaceTap() {
    if (_phoneNoController.text.isNotEmpty) {
      setState(() {
        _phoneNoController.text = _phoneNoController.text
            .substring(0, _phoneNoController.text.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            width: getWidth(context),
            height: getHeight(context),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: themeColorDark),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Enter your mobile number',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                InputDecorator(
                  decoration: const InputDecoration(
                    hintText: 'Mobile Number',
                    border: OutlineInputBorder(),
                    prefix: Text('+91 '),
                  ),
                  child: AbsorbPointer(
                    absorbing: true,
                    child: TextFormField(
                      controller: _phoneNoController,
                      cursorColor: themeColorDark,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration.collapsed(
                          hintText: 'Mobile Number'),
                    ),
                  ),
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
                              style: const TextStyle(
                                  fontSize: 20, color: themeColorLight),
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
                            style:
                            TextStyle(fontSize: 20, color: themeColorLight),
                          ),
                        ),
                      ),
                      Center(
                        child: IconButton(
                          icon: const Icon(
                            Icons.backspace,
                            color: themeColorDark,
                          ),
                          onPressed: _onBackspaceTap,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style:
                  ElevatedButton.styleFrom(backgroundColor: themeColorDark),
                  onPressed: () async {
                    int code = await AuthServices()
                        .generateOTP(_phoneNoController.text, context);
                    String message = "";
                    print(code);
                    if (code == 200) {
                      message = "OTP Sent Successfully";
                      showSnackBar(message, context, themeColorSnackBarGreen);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OtpVerifyScreen(
                          phone: _phoneNoController.text,
                        ),
                      ));
                    } else if (code == 400) {
                      showSnackBar(message, context, themeColorSnackBarRed);
                      message = "Please Try Again with Correct Phone Number";
                    } else if (code == 500) {
                      showSnackBar(message, context, themeColorSnackBarRed);
                      message = "Internal Server Error, try again later";
                    }
                  },
                  child: const Text('Get OTP'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}