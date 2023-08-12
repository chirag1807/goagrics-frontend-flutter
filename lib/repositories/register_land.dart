import 'dart:io';

import 'package:goagrics/utils/constants.dart';
import 'package:goagrics/utils/prefs.dart';
import 'package:http/http.dart' as http;

class RegisterLandRepo{
  Future<int?> registerFarmersLand(File? landImg, String type, String area, String price) async {
    // String? id = Prefs.getInstance().getString(ID);

    try{
      var request = http.MultipartRequest('PUT', Uri.parse("${BASE_URI}farmer/register/land/64ce072a0eb74333d629fb4a"));
      request.files.add(await http.MultipartFile.fromPath('landPhoto', landImg!.path));

      request.fields['type'] = type;
      request.fields['area'] = area;
      request.fields['l_price'] = price;

      var response = await request.send();
      print(response.statusCode);
      print(response.toString());
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