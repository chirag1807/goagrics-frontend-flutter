import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:goagrics/models/login.dart';
import 'package:goagrics/models/registration.dart';
import 'package:goagrics/utils/constants.dart';
import 'package:http/http.dart' as http;

import '../utils/prefs.dart';

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
      showSnackBar(error.toString(), context, themeColorSnackBarRed);
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
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      print(body);
      Login data = Login.fromJson(body);
      if (data.data != null) {
        await Prefs.getInstance().setString(ID, data.data!.sId!);
        await Prefs.getInstance().setString(CATEGORY, data.data!.category!);
      }
      await Prefs.getInstance().setBool(IS_LOGGED_IN, true);
      status = true;
    }
    return status;
  }

  Future<bool> registration(File? Avatar, String name, String category,
      String address, String pincode, String mobno) async {
    try {
      var request =
          http.MultipartRequest('POST', Uri.parse("${BASE_URI}register"));
      request.files
          .add(await http.MultipartFile.fromPath('Avatar', Avatar!.path));

      request.fields['name'] = name;
      request.fields['category'] = category;
      request.fields['address'] = address;
      request.fields['pincode'] = pincode;
      request.fields['mobno'] = mobno;

      var response = await request.send();

      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        var body = jsonDecode(responseBody);
        Registration data = Registration.fromJson(body);
        print(data.toString());
        await Prefs.getInstance().setString(ID, data.data!.sId!);
        await Prefs.getInstance().setString(CATEGORY, data.data!.category!);
        await Prefs.getInstance().setBool(IS_REGISTERED, true);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
