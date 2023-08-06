import 'dart:convert';

import 'package:goagrics/models/get_all_farmers.dart';
import 'package:goagrics/models/get_all_labors.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<void> getFarmers() async {
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
    }
  }

  static Future<void> getLabors() async {
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
    }
  }
}
