import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gmap;
import 'package:utility/utility.dart';

import '../viewModel/maps_view_model.dart';

class GglMaps extends StatefulWidget {
  const GglMaps({super.key});

  @override
  State<GglMaps> createState() => _GglMapsState();
}

class _GglMapsState extends State<GglMaps> {
  final mapsController = Get.put(MapsViewModel());
  Color bgColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 300,
              width: double.infinity,
              child: Card(
                child: gmap.GoogleMap(
                  mapType: gmap.MapType.normal,
                  initialCameraPosition: gmap.CameraPosition(
                    target: mapsController.myLocation,
                    zoom: 14.0,
                  ),
                  onMapCreated: (gmap.GoogleMapController controller) {
                    mapsController.googleMapController = controller;
                    mapsController
                        .getCurrentLocation(); // Ensure location is updated when map is created
                  },
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  markers: mapsController.markers,
                  onCameraMove: (gmap.CameraPosition position) {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomSwitchButton(
                initialValue: true,
                label: 'Change Color',
                onChanged: (value) {
                  setState(() {
                    bgColor = value ? Colors.green : Colors.red;
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          CustomIconButton(
            onPressed: () {},
            label: 'Custom Icon Button',
            hugeIcon: HugeIcons.strokeRoundedAbacus,
            backgroundColor: bgColor,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomElevatedButton(
            onPressed: () {},
            label: 'Custom Elevated Button',
            // backgroundColor: Colors.red,
            color: Colors.greenAccent,
            backgroundColor: bgColor,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomOutlinedButton(
            onPressed: () {
              Get.toNamed('/applyOutDuty');
            },
            label: 'Punch Out',
          ),
        ]),
      ),
    );
  }
}
