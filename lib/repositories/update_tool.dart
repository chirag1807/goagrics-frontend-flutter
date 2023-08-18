import 'dart:io';

import 'package:goagrics/utils/constants.dart';
// import 'package:goagrics/utils/prefs.dart';
import 'package:http/http.dart' as http;

import '../utils/prefs.dart';

class UpdateToolRepo {
  Future<int?> updateFarmersTool(File? toolImg, String price, String toolId) async {
    String? id = Prefs.getInstance().getString(ID);

    try {
      var request = http.MultipartRequest(
          'PUT',
          Uri.parse(
              "${BASE_URI}farmer/$id/tool/$toolId"));
      request.files
          .add(await http.MultipartFile.fromPath('toolPhoto', toolImg!.path));

      request.fields['t_price'] = price;

      var response = await request.send();
      print(response.statusCode);
      if (response.statusCode == 200) {
        return 1;
      } else {
        return 0;
      }
    } catch (e) {
      print(e);
      return 0;
    }
  }

  Future<int?> deleteFarmersTool(String toolId) async {
    String? id = Prefs.getInstance().getString(ID);

    try{
      var response = await http.delete(Uri.parse("${BASE_URI}farmer/$id/tool/$toolId"));
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
