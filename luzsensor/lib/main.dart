import 'dart:wasm';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:light/light.dart';
import 'package:settings/settings.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _luxString = 'Unknown';
  String _pos ;
  double _distanceInMeters;
  Light _light;
  StreamSubscription _subscription;


  void onData(int luxValue) async {
    print("Lux value: $luxValue");
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print("positicion : $position");
    double distanceInMeters = await Geolocator().distanceBetween(-0.198465,-78.503067, position.latitude, position.longitude);
    print("meros : $distanceInMeters");
    setState(() {
      _luxString = "$luxValue";
      _pos = "$position";
      _distanceInMeters = distanceInMeters;
    });
  }



  void stopListening() {
    _subscription.cancel();
  }

  void startListening() {
    _light = new Light();
    try {
      _subscription = _light.lightSensorStream.listen(onData);
    }
    on LightException catch (exception) {
      print(exception);
    }
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    startListening();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: <Widget>[
            Text('Running on: $_luxString\n'),
            Text('Running on: $_pos\n'),
            Text('Running on: $_distanceInMeters\n'),
          ],
        ) ,
      ),
    );
  }
}
