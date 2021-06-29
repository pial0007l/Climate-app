import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Position position;
  @override
  void initState() {
    super.initState();
    getPosition();
  }

  void getPosition() async {
    Location location = new Location();

    await location.getCurrentLocation();

    print(location.latitude);
    print(location.longitude);
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
