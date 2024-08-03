import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'map_style.dart';

class MapViewDisplay extends StatefulWidget {
  const MapViewDisplay({super.key});

  @override
  MapViewDisplayState createState() => MapViewDisplayState();
}

class MapViewDisplayState extends State<MapViewDisplay> {
  late Future<LatLng> _currentPositionFuture;
  GoogleMapController? _mapController;

  @override
  void initState() {
    super.initState();
    _currentPositionFuture = _getCurrentLocation();
  }

  Future<LatLng> _getCurrentLocation() async {
    Position position = await _determinePosition();
    log(position.toString(), name: 'User Location');
    return LatLng(position.latitude, position.longitude);
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _mapController?.setMapStyle(mapStyle);
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LatLng>(
      future: _currentPositionFuture,
      builder: (BuildContext context, AsyncSnapshot<LatLng> snapshot) {
        inspect(snapshot);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          return GoogleMap(
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
            initialCameraPosition: CameraPosition(
              target: snapshot.data!,
              zoom: 16.0,
            ),
          );
        } else {
          return const Center(child: Text('Unable to fetch location'));
        }
      },
    );
  }
}
