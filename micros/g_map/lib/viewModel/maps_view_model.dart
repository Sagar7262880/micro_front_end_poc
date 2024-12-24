import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:utility/utility.dart';

class MapsViewModel extends GetxController {
  LatLng myLocation = const LatLng(18.520430, 73.856743);
  late GoogleMapController googleMapController;
  Set<Marker> markers = {};

  Future<void> getCurrentLocation() async {
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

    myLocation = LatLng(position.latitude, position.longitude);
    if (kDebugMode) {
      print("MyLocation : $myLocation");
      print("latitude: ${myLocation.latitude}");
      print("Longitude: ${myLocation.longitude}");
    }

    markers.add(
      Marker(
        markerId: const MarkerId('currentLocation'),
        position: myLocation,
        infoWindow: const InfoWindow(title: 'My Location'),
      ),
    );
    googleMapController.animateCamera(CameraUpdate.newLatLng(myLocation));
  }
}
