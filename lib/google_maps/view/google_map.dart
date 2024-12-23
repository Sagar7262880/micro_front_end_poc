import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

import '../viewModel/mapsViewModel.dart';

class GglMaps extends StatefulWidget {
  const GglMaps({super.key});

  @override
  State<GglMaps> createState() => _GglMapsState();
}

class _GglMapsState extends State<GglMaps> {
  final mapsController = Get.put(MapsViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 300,
              width: double.infinity,
              child: Card(
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: mapsController.myLocation,
                    zoom: 14.0,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    mapsController.googleMapController = controller;
                    mapsController
                        .getCurrentLocation(); // Ensure location is updated when map is created
                  },
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  markers: mapsController.markers,
                  onCameraMove: (CameraPosition position) {
                    setState(() {
                      mapsController.myLocation = position.target;
                    });
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Current Location: (${mapsController.myLocation.latitude}, ${mapsController.myLocation.longitude})',
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
