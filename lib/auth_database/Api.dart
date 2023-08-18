import 'dart:convert';

import 'package:goagrics/models/get_all_farmers.dart';
import 'package:goagrics/models/get_all_labors.dart';
import 'package:goagrics/models/get_single_dealer.dart';
import 'package:goagrics/models/get_single_labor.dart';
import 'package:goagrics/utils/constants.dart';
import 'package:goagrics/utils/prefs.dart';
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

  static Future<GetSingleDealer> getDealer(String id) async {
    late GetSingleDealer dealer;
    try {
      var resStr = await http
          .get(Uri.parse(BASE_URI + "dealer/64d0b6657b3cc2784e91c95e"));
      var resJson = jsonDecode(resStr.body);
      dealer = GetSingleDealer.fromJson(resJson);
    } catch (err) {
      dealer.data = null;
    }
    return dealer;
  }

  static Future<GetSingleLabor> getLabor() async {
    late GetSingleLabor currLabor;

    try {
      // String? currId = Prefs.getInstance().getString(ID);
      var respStr = await http
          .get(Uri.parse(BASE_URI + "labor/64cc8ca2370666f1b9226457"));
      var resJson = jsonDecode(respStr.body);
      currLabor = GetSingleLabor.fromJson(resJson);
    } catch (error) {
      currLabor.data = null;
    }
    return currLabor;
  }

  static Future<bool> registerBid(String price, String fid, String lid) async {
    bool ans = false;
    String? did = Prefs.getInstance().getString(ID);
    try {
      var res = await http.put(
          Uri.parse(
              BASE_URI + "dealer/" + did! + "/farmer/" + fid + "/land/" + lid),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Connection': 'keep-alive',
          },
          body: jsonEncode(<String, String>{'bid_price': price}));
      // var resBod = jsonDecode(res.body);
      if (res.statusCode == 200) ans = true;
    } catch (e) {
      ans = false;
    }
    return ans;
  }
}
