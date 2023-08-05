import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const themeColorDark = Color(0xff005400);
const themeColorLight = Color(0xff009300);
const themeColorWhite = Color(0xffFFFFFF);
const themeColorBlack = Color(0xff000000);
const themeColorSnackBarRed = Color(0xffff0000);
const themeColorSnackBarGreen = Color(0xff00d759);

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      content,
      style: GoogleFonts.prompt(color: themeColorWhite, fontSize: 14),
    ),
    backgroundColor: themeColorDark,
  ));
}

// ignore: constant_identifier_names
const ACCESS_TOKEN = "accessToken";
// ignore: constant_identifier_names
const REFRESH_TOKEN = "refreshToken";
// ignore: constant_identifier_names
const IS_LOGGED_IN = "isLoggedIn";
// ignore: constant_identifier_names
const IS_REGISTERED = "isRegistered";
// ignore: constant_identifier_names

const BASE_URI = "https://go-agrics.vercel.app/api/";
const apikey = "4cc41342b133bba8a995e077ca6769a0";
