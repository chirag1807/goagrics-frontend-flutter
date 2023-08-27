import 'dart:convert';

import 'package:goagrics/utils/constants.dart';
import 'package:http/http.dart' as http;

import '../utils/prefs.dart';
class UpdateDealer{
  Future<int?> updateDealerDetails(String dname, String address, String pincode) async {
    String? id  = Prefs.getInstance().getString(ID);
    try{
      var resp = await http.put(
        Uri.parse("${BASE_URI}dealer/update/$id"),
        body: jsonEncode(
            {
              "dname": dname,
              "address": address,
              "pincode": pincode
            }
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Connection': 'keep-alive',
          'Accept': 'application/json',
        },
      );
      print(resp.body);
      if(resp.statusCode == 200){
        return 1;
      }
      else{
        return 0;
      }
    } catch(e){
      print(e);
      return 0;
    }
  }
}