import 'dart:convert';

import 'package:goagrics/models/get_all_farmers.dart';
import 'package:goagrics/models/get_all_labors.dart';
import 'package:goagrics/utils/constants.dart';
import 'package:http/http.dart' as http;

class Api {
  //GetFarmers from Database
  static Future<List<GetAllFarmers>> getFarmers() async {
    List<GetAllFarmers> allFarmers = [];

    try {
      List<GetAllFarmers> allFarmers = [];
      var res =
          await http.get(Uri.parse('https://go-agrics.vercel.app/api/farmers'));
      if (res.statusCode == 200) {
        var responseData = jsonDecode(res.body);
        print(responseData);
        var rest = responseData["data"] as List;
        allFarmers = rest
            .map<GetAllFarmers>((json) => GetAllFarmers.fromJson(json))
            .toList();
        print(allFarmers[0].sId);
      } else
        print("Failed");
    } on Exception catch (_, e) {
      print("Erro => ${e.toString()}");
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
    }

    return allFarmers;
  }

  //Get Labors from Database
  static Future<List<GetAllLabors>> getLabors() async {
    List<GetAllLabors> allLabors = [];

    try {
      List<GetAllLabors> allLabors = [];
      var res =
          await http.get(Uri.parse('https://go-agrics.vercel.app/api/labor'));
      if (res.statusCode == 200) {
        var responseData = jsonDecode(res.body);
        print(responseData);
        var rest = responseData["data"];
        allLabors = rest.map<GetAllLabors>((json) => GetAllLabors.fromJson(json)).toList();
        print(allLabors[0].sId);
      } else
        print("Failed");
    } on Exception catch (_, e) {
      print("Erro => ${e.toString()}");
      var respString = await http.get(Uri.parse(BASE_URI + "/labor"));
      if (respString.statusCode == 200) {
        var respJson = jsonDecode(respString.body);
        var data = respJson["data"] as List;

        allLabors = data
            .map<GetAllLabors>((json) => GetAllLabors.fromJson(json))
            .toList();
      }
    }

    return allLabors;
  }
}
