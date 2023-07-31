import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goagrics/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class OtpVerifyScreen extends StatefulWidget {
  String generatedCode;
  OtpVerifyScreen({super.key, required this.generatedCode});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  List<String> otpDigits = List.filled(4, '');
  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: getHeight(context) * 0.05,
            ),
            const Text(
              'Verify Phone',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: themeColorDark),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            const Text(
              'We have Sent OTP to +91 XXX XXX XXXX',
              style: TextStyle(fontSize: 16, color: themeColorLight),
            ),

            SizedBox(
              height: getHeight(context) * 0.05,
            ),

            //Pinput Package Code
            SizedBox(
              width: getWidth(context),
              child: Pinput(
                androidSmsAutofillMethod:
                    AndroidSmsAutofillMethod.smsRetrieverApi,
                showCursor: true,
                controller: pinController,
                length: 6,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                defaultPinTheme: PinTheme(
                  height: 60.0,
                  width: 60.0,
                  textStyle: GoogleFonts.urbanist(
                    fontSize: 24.0,
                    color: themeColorLight,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black.withOpacity(0.5),
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Expanded(child: SizedBox()),
            InkWell(
              onTap: () {
                try {
                  final credential = PhoneAuthProvider.credential(
                    verificationId: widget.generatedCode,
                    smsCode: pinController.text,
                  );
                  FirebaseAuth.instance.signInWithCredential(credential);
                  print("Successs");
                } catch (e) {
                  print("Failed!!" + e.toString());
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      e.toString(),
                    ),
                  ));
                }
                print(pinController.text);
              },
              borderRadius: BorderRadius.circular(30.0),
              child: Ink(
                height: 55.0,
                width: getWidth(context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: themeColorDark,
                ),
                child: Center(
                  child: Text(
                    'Continue',
                    style: GoogleFonts.urbanist(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: getHeight(context) * 0.1,
            ),
          ],
        ),
      ),
    ));
  }
}
