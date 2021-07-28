import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '';

const apiKey = '4feb705cb38899c502cd0668fd35c7d0';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Position position;

  double latitude;
  dynamic longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = new Location();

    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;
  }

  void getData() async {
    var temperature = decodedData['main']['temp'];
    var condition = decodedData['weather'][0]['id'];
    var cityName = decodedData['name'];

    print(temperature - 273.15);
    print(condition);
    print(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //Get the current location
            getPosition();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
