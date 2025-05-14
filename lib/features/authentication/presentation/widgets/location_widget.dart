import 'package:class_a_ec/core/resources/strings_manager.dart';
import 'package:class_a_ec/core/router/app_routes.dart';
import 'package:class_a_ec/core/utils/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key});

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  late GoogleMapController mapController;
  String _selectedAddress = '';
  Future<bool> _handleLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringsManager.facilityLocationOnMap,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const Gutter(),
        Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              GoogleMap(
                onMapCreated: (controller) => mapController = controller,
                initialCameraPosition: const CameraPosition(
                  target: LatLng(0.0, 0.0),
                  zoom: 14,
                ),
                markers: {
                  const Marker(
                    markerId: MarkerId('selected-location'),
                    position: LatLng(0.0, 0.0),
                  ),
                },
              ),
              CustomElevatedButton(
                width: 170.w,
                height: 50.h,
                title: StringsManager.getCurrentLocation,
                onPressed: () async {
                  final hasPermission = await _handleLocationPermission();
                  if (!hasPermission) return;
                  if (mounted) {
                    /// Use location after pop from map screen using go_router
                    final selectedLocation =
                        await GoRouter.of(context).pushNamed(
                      AppRoutes.mapViewScreen,
                    );
                    if (selectedLocation != null) {
                      setState(() {
                        _selectedAddress = selectedLocation.toString();
                      });
                    }
                  }
                },
              ),
            ],
          ),
        ),
        const Gutter.small(),
        Text(
          _selectedAddress,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
