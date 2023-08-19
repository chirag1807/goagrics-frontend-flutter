import 'dart:convert';

import 'package:goagrics/utils/constants.dart';
import 'package:http/http.dart' as http;

import '../utils/prefs.dart';
class UpdateLabor{
  Future<int?> updateLaborSkillPrice(List<String> skills, double price) async {
    String? id  = Prefs.getInstance().getString(ID);
    try{
      print(skills);
      print(price);
      var resp = await http.put(
          Uri.parse("${BASE_URI}labor/register/$id"),
        body: jsonEncode(
          {
            "skill": skills,
            "price": price
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