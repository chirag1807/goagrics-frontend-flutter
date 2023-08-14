import 'dart:convert';

import 'package:goagrics/models/get_all_farmers.dart';
import 'package:goagrics/models/get_all_labors.dart';
import 'package:goagrics/utils/constants.dart';
import 'package:http/http.dart' as http;

import '../models/get_single_farmer.dart';

class Api {
  //GetFarmers from Database
  static Future<List<GetAllFarmers>> getFarmers() async {
    List<GetAllFarmers> allFarmers = [];

    try {
      var respString = await http.get(Uri.parse(BASE_URI + "/farmers"));
      if (respString.statusCode == 200) {
        var respJson = jsonDecode(respString.body);
        var data = respJson["data"] as List;

        allFarmers = data
            .map<GetAllFarmers>((json) => GetAllFarmers.fromJson(json))
            .toList();
        // print(allFarmers.length);
        // print("Here is ${allFarmers.runtimeType}");
      }
    } on Exception catch (_) {
      allFarmers = [];
    }

    return allFarmers;
  }

  //Get Labors from Database
  static Future<List<GetAllLabors>> getLabors() async {
    List<GetAllLabors> allLabors = [];

    try {
      var respString = await http.get(Uri.parse(BASE_URI + "/labor"));
      if (respString.statusCode == 200) {
        var respJson = jsonDecode(respString.body);
        var data = respJson["data"] as List;

        allLabors = data
            .map<GetAllLabors>((json) => GetAllLabors.fromJson(json))
            .toList();
        // print(allFarmers.length);
        // print("Here is ${allFarmers.runtimeType}");
      }
    } on Exception catch (_) {
      allLabors = [];
    }

    return allLabors;
  }

  static Future<GetSingleFarmer> getFarmer() async {
    late GetSingleFarmer currFarmer;

    try {
      // String? currId = Prefs.getInstance().getString(ID);
      // print(currId);
      var respStr = await http
          .get(Uri.parse(BASE_URI + "farmer/64cb45d79e63a8037b6e2ab0"));
      var resJson = jsonDecode(respStr.body);
      currFarmer = GetSingleFarmer.fromJson(resJson);
      // print(currFarmer.data!.fname);
    } catch (error) {}
    return currFarmer;
  }
}
