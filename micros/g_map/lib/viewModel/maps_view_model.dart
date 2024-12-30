import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapsViewModel extends GetxController {
  late GoogleMapController googleMapController;
  final Set<Marker> markers = {};
  final Set<Polyline> polylines = {};
  List<LatLng> points = [];

  LatLng myLocation = const LatLng(18.534456, 73.883042);
  LatLng destinationLocation = const LatLng(19.874990, 75.367443);
  LatLng newLocation = const LatLng(19.879293, 75.366074);

  Future<void> getPolylinePoints() async {
    try {
      points.clear();
      points.add(myLocation); // Adding starting point
      points.add(destinationLocation); // Adding destination point
      points.add(newLocation);

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

  void updateMarkers() {
    markers.clear();
    markers.add(
      Marker(
        markerId: const MarkerId('currentLocation'),
        position: myLocation,
        infoWindow: const InfoWindow(title: 'My Location'),
      ),
    );
    markers.add(
      Marker(
        markerId: const MarkerId('destinationLocation'),
        position: destinationLocation,
        infoWindow: const InfoWindow(title: 'Destination Location'),
      ),
    );
    markers.add(
      Marker(
        markerId: const MarkerId('newlocation'),
        position: newLocation,
        infoWindow: const InfoWindow(title: 'New Location'),
        // onTap: () async {
        //   log('New Location tapped');
        //   // Fetch new location details or perform some action
        //   Position position = await Geolocator.getCurrentPosition(
        //     desiredAccuracy: LocationAccuracy.high,
        //   );

        //   newLocation = LatLng(position.latitude, position.longitude);

        //   // Update markers with new location
        //   updateMarkers();

        //   // Get new polyline points
        //   await getPolylinePoints();

        //   // Move camera to new location
        //   googleMapController
        //       .animateCamera(CameraUpdate.newLatLng(newLocation));

        //   update();
        // },
      ),
    );
  }

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      myLocation = LatLng(position.latitude, position.longitude);

      // Update markers with new location
      updateMarkers();

      // Get new polyline points
      await getPolylinePoints();

      // Move camera to current location
      googleMapController.animateCamera(CameraUpdate.newLatLng(myLocation));

      update();
    } catch (e) {
      print('Error getting current location: $e');
    }
  }
}
