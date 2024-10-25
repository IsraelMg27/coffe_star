import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ubicación de la Sucursal')),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(25.6738, -100.309),
          zoom: 15,
        ),
      ),
    );
  }
}