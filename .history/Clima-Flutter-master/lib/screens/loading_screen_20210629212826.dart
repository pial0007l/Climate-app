import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = '4feb705cb38899c502cd0668fd35c7d0';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Position position;

  double lat;
  dynamic lon;

  @override
  void initState() {
    super.initState();
    getPosition();
  }

  void getPosition() async {
    Location location = new Location();

    await location.getCurrentLocation();

    //print(location.latitude);
    //print(location.longitude);
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?lat=-34.920288&lon=138.628874&appid=$apiKey'));

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      var temperature = decodedData['main']['tamp'];
      var condition = decodedData['weather'][0]['id'];
      var cityName = decodedData['name'];
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
