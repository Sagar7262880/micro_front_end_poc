import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../viewModel/maps_view_model.dart';

class GglMaps extends StatefulWidget {
  const GglMaps({super.key});

  @override
  State<GglMaps> createState() => _GglMapsState();
}

class _GglMapsState extends State<GglMaps> {
  final mapsController = Get.put(MapsViewModel());

  @override
  void initState() {
    super.initState();
    // Initialize polylines when widget is created
    WidgetsBinding.instance.addPostFrameCallback((_) {
      mapsController.getPolylinePoints();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MapsViewModel>(
        builder: (controller) {
          return Column(
            children: [
              Expanded(
                child: GoogleMap(
                  polylines: mapsController.polylines,
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: mapsController.myLocation,
                    zoom: 15.0,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    mapsController.googleMapController = controller;
                    mapsController.getCurrentLocation();
                  },
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  markers: mapsController.markers,
                ),
              ),
              // Add a button to refresh polylines if needed
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    mapsController.getPolylinePoints();
                  },
                  child: const Text('Refresh Route'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
