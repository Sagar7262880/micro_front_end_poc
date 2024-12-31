import 'dart:developer';
import 'package:flutter/material.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapsViewModel extends GetxController {
  late LatLng myLocation;
  late LatLng? destinationLocation;
  late GoogleMapController googleMapController;
  final Set<Marker> markers = {};
  final Set<Polyline> polylines = {};
  List<LatLng> points = [];

  MapsViewModel({required this.myLocation, this.destinationLocation});

  Future<void> getCurrentLocation() async {
    try {
      // Check if location services are enabled
      bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!isServiceEnabled) {
        await Geolocator.openLocationSettings();
        log('Location services are disabled.');
        return;
      }

      // Check location permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          log('Location permission denied.');
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        log('Location permission permanently denied.');
        return;
      }

      // Fetch current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      myLocation = LatLng(position.latitude, position.longitude);
      log('Current location: $myLocation');

      // Update markers and polyline
      updateMarkers();
      await getPolylinePoints();

      // Move map camera to the new location
      googleMapController.animateCamera(CameraUpdate.newLatLng(myLocation));
      log('Camera moved to current location');

      update();
    } catch (e) {
      log('Error getting current location: $e');
    }
  }

  Future<void> getPolylinePoints() async {
    try {
      points.clear();
      points.add(myLocation); // Source point
      points.add(destinationLocation!); // Destination point

      // Create polyline using the fetched points
      Polyline polyline = Polyline(
        polylineId: const PolylineId('route'),
        consumeTapEvents: true,
        color: Colors.blue,
        width: 3,
        points: points,
      );

      // Clear existing polylines
      polylines.clear();

      // Add new polyline
      polylines.add(polyline);

      // Update the markers (if required)
      updateMarkers();

      // Notify listeners
      update();
    } catch (e) {
      log('Error getting polyline points: $e');
    }
  }

  Future<void> updateMarkers() async {
    BitmapDescriptor customIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(
        size: Size(24, 24),
      ),
      'assets/pin.png',
    );
    markers.clear();
    markers.add(
      Marker(
        markerId: const MarkerId('currentLocation'),
        position: myLocation,
        infoWindow: const InfoWindow(title: 'My Location'),
        icon: customIcon,
      ),
    );
    markers.add(
      Marker(
        markerId: const MarkerId('destinationLocation'),
        position: destinationLocation!,
        infoWindow: const InfoWindow(title: 'Destination Location'),
        icon: customIcon,
      ),
    );
  }
}
