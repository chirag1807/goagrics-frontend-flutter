import 'dart:convert';

import 'package:goagrics/models/get_all_farmers.dart';
import 'package:goagrics/utils/constants.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<void> getFarmers() async {
    try {
      print("Hello2");
      List<GetAllFarmers> allFarmers = [];
      var res =
          await http.get(Uri.parse('https://go-agrics.vercel.app/api/farmers'));
      if (res.statusCode == 200) {
        var responseData = jsonDecode(res.body);
        var rest = responseData["data"] as List;
        allFarmers = rest
            .map<GetAllFarmers>((json) => GetAllFarmers.fromJson(json))
            .toList();
        print(allFarmers[0]);
      } else
        print("Failed");
    } on Exception catch (_, e) {
      print("Erro => ${e.toString()}");
    }
  }

  static Future<void> getLabors() async {
    try {
      print("Hello2");
      var res =
          await http.get(Uri.parse('https://go-agrics.vercel.app/api/labors'));
      if (res.statusCode == 200) {
        print("Success");
      } else
        print("Failed");
    } on Exception catch (_, e) {
      print("Erro => ${e.toString()}");
    }
  }
}
