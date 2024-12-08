import 'package:favorite_places/models/place.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    this.location = const PlaceLocation(
      latitude: 37.422,
      langitude: -122.084,
      address: '',
    ),
    this.isSelecting = true,
  });

  final PlaceLocation location;
  final bool isSelecting;

  @override
  State<MapScreen> createState() {
    return _MapScreenState();
  }
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.isSelecting ? 'Pick your Location' : 'Your Location'),
        actions: [
          if (widget.isSelecting)
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.save),
            )
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.location.latitude,
            widget.location.langitude,
          ),
          zoom: 16,
        ),
        markers: {
          const Marker(
            markerId: MarkerId('m1'),
            position: LatLng(
              widget.location.latitude,
              widget.location.langitude,
            ),
          ),
        },
      ),
    );
  }
}
