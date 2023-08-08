import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goagrics/utils/constants.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  Future<int> generateOTP(String phone, BuildContext context) async {
    int otp = 0;
    String url = "generate";
    try {
      var response = await http.post(
        Uri.parse(BASE_URI + url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Connection': 'keep-alive',
          'Accept': 'application/json',
        },
        body: jsonEncode(<String, String>{'mobno': phone}),
      );
      otp = response.statusCode;
    } catch (error) {
      showSnackBar(error.toString(), context);
    }
    return otp;
  }

  Future<bool> verifyOTP(String phone, String otp) async {
    bool status = false;
    String url = "verify";
    var response = await http.post(
      Uri.parse(BASE_URI + url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Connection': 'keep-alive',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, String>{'phone': phone, 'otp': otp}),
    );
    // response.
    if (response.statusCode == 200) status = true;

    return status;
  }
}
