import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:goagrics/config.dart';
import 'package:goagrics/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

class GetAddress extends StatefulWidget {
  const GetAddress({super.key});

  @override
  _GetAddressState createState() => _GetAddressState();
}

class _GetAddressState extends State<GetAddress> {
  String _address = "";

  Future<void> getAddressFromCoordinates(double latitude, double longitude) async {
    const apiKey = geocodingApiKey;
    final apiUrl = "https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$apiKey";

    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
      if (data['status'] == "OK") {
        setState(() {
          _address = data['results'][0]['formatted_address'];
        });
        print(data['results'][0]['formatted_address']);
      }
      else{
        print(data['status']);
      }
    }
  }

  String _latitude = "Fetching...";
  String _longitude = "Fetching...";

  Future<void> _getLocation() async {
    var status = await Permission.location.request();
    if(status.isGranted){
      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _latitude = position.latitude.toString();
        _longitude = position.longitude.toString();
      });
      print(_latitude);
      print(_longitude);
    }
    else{
      showSnackBar("Please Enable Location...", context, themeColorSnackBarRed);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("GPS to Address"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  // Replace these values with your actual GPS coordinates
                  double latitude = 37.7749;
                  double longitude = -122.4194;
                  getAddressFromCoordinates(latitude, longitude);
                },
                child: Text("Get Address From Co-Ordinates"),
              ),
              SizedBox(height: 20),
              Text("Address: $_address"),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: (){
                    _getLocation();
                  }, child: Text("Get Address From GPS"),)
            ],
          ),
        ),
      ),
    );
  }
}
