import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Position position;
  Location location;
  @override
  void initState() {
    super.initState();
    getPosition();
  }

  void getPosition() async {
    location = new Location();

    await location.getCurrentLocation();

    //print(location.latitude);
    //print(location.longitude);
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?lat=34.92&lon=138.60&appid=4feb705cb38899c502cd0668fd35c7d0'));

    if (response.statusCode == 200) {
      String data = response.body;
      var weatherDescription = jsonDecode(data)['weather'][0]['description'];
      var cityName = jsonDecode(data)['name'];
      print(cityName);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //Get the current location
            getPosition();
            getData();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
