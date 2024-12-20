import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class GoogleMps extends StatefulWidget {
  const GoogleMps({super.key});

  @override
  State<GoogleMps> createState() => _GoogleMpsState();
}

class _GoogleMpsState extends State<GoogleMps> {
  LatLng myLocation = const LatLng(18.520430, 73.856743);
  late GoogleMapController mapController;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, don't continue
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, don't continue
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, don't continue
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      myLocation = LatLng(position.latitude, position.longitude);
      _markers.add(
        Marker(
          markerId: const MarkerId('currentLocation'),
          position: myLocation,
          infoWindow: const InfoWindow(title: 'My Location'),
        ),
      );
      mapController.animateCamera(CameraUpdate.newLatLng(myLocation));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: myLocation,
                zoom: 14.0,
              ),
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
                _getCurrentLocation(); // Ensure location is updated when map is created
              },
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              markers: _markers,
              onCameraMove: (CameraPosition position) {
                setState(() {
                  myLocation = position.target;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Current Location: (${myLocation.latitude}, ${myLocation.longitude})',
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
