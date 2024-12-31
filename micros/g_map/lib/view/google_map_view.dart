import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../viewModel/maps_view_model.dart';

class GglMaps extends StatefulWidget {
  final double sourceLat;
  final double sourceLong;
  final double? destLat;
  final double? destLong;
  const GglMaps({
    super.key,
    required this.sourceLat,
    required this.sourceLong,
    this.destLat,
    this.destLong,
  });

  @override
  State<GglMaps> createState() => _GglMapsState();
}

class _GglMapsState extends State<GglMaps> {
  late MapsViewModel mapsController;

  @override
  void initState() {
    super.initState();
    mapsController = Get.put(
      MapsViewModel(
        myLocation: LatLng(widget.sourceLat, widget.sourceLong),
        destinationLocation: widget.destLat != null && widget.destLong != null
            ? LatLng(widget.destLat!, widget.destLong!)
            : null,
        // destinationLocation:
        //     LatLng(widget.destLat ?? 0.0, widget.destLong ?? 0.0),
      ),
    );
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
