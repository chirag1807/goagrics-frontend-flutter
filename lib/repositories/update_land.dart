import 'dart:io';
import 'package:http/http.dart' as http;

import '../utils/constants.dart';
import '../utils/prefs.dart';

class UpdateLandRepo{
  Future<int?> updateFarmersLand(File? landImg, String type, String area, String price, String landId) async {
    String? id = Prefs.getInstance().getString(ID);

    try{
      var request = http.MultipartRequest('PUT', Uri.parse("${BASE_URI}farmer/$id/land/$landId"));
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