import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthServices {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<String> verifyPhone(String number, BuildContext context) async {
    String verifyId = "";

    try {
      auth.verifyPhoneNumber(
        phoneNumber: number,
        verificationCompleted: (_) {},
        verificationFailed: (e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              e.toString(),
            ),
          ));
          verifyId = "error $e";
        },
        codeSent: ((verificationId, token) {
          print("Id here: $token");
          verifyId = verificationId;
          print(verifyId);
        }),
        codeAutoRetrievalTimeout: (e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              e.toString(),
            ),
          ));

          verifyId = "error " + e.toString();
        },
      );
    } catch (e) {

      verifyId = "error " + e.toString();
    }

    return verifyId;
  }
}
