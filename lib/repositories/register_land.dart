import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:goagrics/utils/constants.dart';
import 'package:goagrics/utils/prefs.dart';
import 'package:http/http.dart' as http;

class RegisterLand{
  Future<int?> registerFarmersLand(File? landImg, String type, String area, double price) async {
    String? id = Prefs.getInstance().getString(ID);

    try{
      var request = http.MultipartRequest('POST', Uri.parse("uri"));
      request.files.add(await http.MultipartFile.fromPath('image', landImg!.path));

      request.fields['type'] = type;
      request.fields['area'] = area;
      request.fields['price'] = price.toString();

      var response = await request.send();

      if(response.statusCode == 200){
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