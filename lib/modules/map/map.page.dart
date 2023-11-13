import 'package:e_begal_shield_rewritten/modules/map/repositories/.env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController _googleMapController;
  Marker? _origin;
  Marker? _destination;

  static const LatLng _sourceLocation =
      LatLng(-7.292152303879701, 112.59487577424785);
  static const LatLng _destinationLocation =
      LatLng(-7.310470755195055, 112.7286617657947);
  LocationData? _currentLocation;

  List<LatLng> polylineCoordinates = [];

  void _getPolypoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPIKey,
      PointLatLng(
        _sourceLocation.latitude,
        _sourceLocation.longitude,
      ),
      PointLatLng(
        _destinationLocation.latitude,
        _destinationLocation.longitude,
      ),
    );

    if (result.points.isEmpty) {
      return;
    }

    result.points.toList().forEach(
          (PointLatLng point) => polylineCoordinates.add(
            LatLng(
              point.latitude,
              point.longitude,
            ),
          ),
        );

    setState(() {});
  }

  void _getCurrentLocation() {
    Location location = Location();

    location.getLocation().then((location) => _currentLocation = location);
  }

  @override
  void initState() {
    setState(() {
      _getCurrentLocation();
    });
    _getPolypoints();
    super.initState();
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find your motorcycle!'),
        titleTextStyle: Theme.of(context).textTheme.titleSmall,
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 2,
      ),
      body: _currentLocation == null
          ? const Center(
              child: Text("Loading"),
            )
          : GoogleMap(
              padding: const EdgeInsets.only(bottom: 32),
              onMapCreated: (controller) => _googleMapController = controller,
              initialCameraPosition: CameraPosition(
                target: LatLng(
                    _currentLocation!.latitude!, _currentLocation!.longitude!),
                zoom: 14.5,
              ),
              myLocationButtonEnabled: false,
              zoomControlsEnabled: true,
              markers: {
                Marker(
                  markerId: const MarkerId("current"),
                  infoWindow: const InfoWindow(title: "Current Location"),
                  position: LatLng(
                    _currentLocation!.latitude!,
                    _currentLocation!.longitude!,
                  ),
                ),
                const Marker(
                  markerId: MarkerId("source"),
                  infoWindow: InfoWindow(title: "Source"),
                  position: _sourceLocation,
                ),
                const Marker(
                  markerId: MarkerId("destination"),
                  infoWindow: InfoWindow(title: "Destination"),
                  position: _destinationLocation,
                ),
              },
              polylines: {
                Polyline(
                  polylineId: const PolylineId("route"),
                  points: polylineCoordinates,
                ),
              },
              onLongPress: _addMarker,
            ),
    );
  }

  void _addMarker(LatLng pos) {
    if (_origin == null || (_origin != null && _destination != null)) {
      setState(() {
        _origin = Marker(
          markerId: const MarkerId("origin"),
          infoWindow: const InfoWindow(title: "Origin"),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen,
          ),
          position: pos,
        );

        _destination = null;
      });
    } else {
      setState(() {
        _destination = Marker(
          markerId: const MarkerId("destination"),
          infoWindow: const InfoWindow(title: "Destination"),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueBlue,
          ),
          position: pos,
        );
      });
    }
  }
}
