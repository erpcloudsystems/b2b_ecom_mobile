import 'package:class_a_ec/core/resources/strings_manager.dart';
import 'package:class_a_ec/core/utils/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapViewScreen extends StatefulWidget {
  const MapViewScreen({super.key});

  @override
  State<MapViewScreen> createState() => _MapViewScreenState();
}

class _MapViewScreenState extends State<MapViewScreen> {
  late GoogleMapController _mapController;
  LatLng _selectedLocation =
      const LatLng(37.7749, -122.4194); // Default location
  final TextEditingController _searchController = TextEditingController();

  String _selectedAddress = "Fetching address...";
  Future<void> _getCurrentLocation() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;

    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _selectedLocation = LatLng(position.latitude, position.longitude);
    });

    _mapController.animateCamera(
      CameraUpdate.newLatLng(_selectedLocation),
    );
  }

  Future<bool> _handleLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
      await _getAddressFromLatLng(_selectedLocation);
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  Future<void> _getAddressFromLatLng(LatLng position) async {
    try {
      print(
          'Fetching address for: ${position.latitude}, ${position.longitude}');
      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      final placemark = placemarks.first;

      setState(() {
        _selectedAddress =
            "${placemark.street}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}";
      });
    } catch (e) {
      print('Error fetching address: $e');
      setState(() {
        _selectedAddress = "Unable to fetch address.";
      });
    }
  }

  void _searchAndNavigate(String query) async {
    try {
      final parts = query.split(',');
      final latitude = double.parse(parts[0].trim());
      final longitude = double.parse(parts[1].trim());

      setState(() {
        _selectedLocation = LatLng(latitude, longitude);
      });
      await _getAddressFromLatLng(_selectedLocation);
      _mapController.animateCamera(
        CameraUpdate.newLatLng(_selectedLocation),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Invalid location format. Use "lat, lng".')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick a Location'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText:
                    'أدخل خط العرض وخط الطول (على سبيل المثال، 37.7749، -122.4194)',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.my_location),
                  onPressed: _getCurrentLocation,
                ),
              ),
              onSubmitted: _searchAndNavigate,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _selectedLocation,
                zoom: 14,
              ),
              onMapCreated: (controller) => _mapController = controller,
              markers: {
                Marker(
                  markerId: const MarkerId('selected-location'),
                  position: _selectedLocation,
                ),
              },
              onTap: (position) async {
                setState(() {
                  _selectedLocation = position;
                });
                await _getAddressFromLatLng(position);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomElevatedButton(
                onPressed: () {
                  context.pop(_selectedAddress);
                },
                title: StringsManager.saveLocation,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
