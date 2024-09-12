import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:miscelaneos/presentation/provider/providers.dart';

class ControlledMapScreen extends ConsumerWidget {
  const ControlledMapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userLocationAsync = ref.watch(userLocationProvider);

    return Scaffold(
      body: userLocationAsync.when(
        data: (data) => MapAndControls(
          latitude: data.$1,
          longitude: data.$2,
        ),
        error: (error, stackTrace) => Center(
          child: Text('$error'),
        ),
        loading: () => const Center(
          child: Text('Cargando Mapa'),
        ),
      ),
    );
  }
}

class MapAndControls extends ConsumerWidget {
  final double latitude;
  final double longitude;

  const MapAndControls(
      {super.key, required this.latitude, required this.longitude});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapControllerState = ref.watch(mapControllerProvider);
    return Stack(
      children: [
        _MapView(
          initialLat: latitude,
          initialLng: longitude,
        ),
        Positioned(
          top: 50,
          left: 5,
          child: IconButton.filledTonal(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(Icons.arrow_back_outlined)),
        ),
        Positioned(
          bottom: 40,
          left: 5,
          child: IconButton.filledTonal(
              onPressed: () {
                ref
                    .read(mapControllerProvider.notifier)
                    .goToLocation(latitude, longitude);
              },
              icon: const Icon(Icons.location_searching_outlined)),
        ),
        Positioned(
          bottom: 90,
          left: 5,
          child: IconButton.filledTonal(
              onPressed: () {
                ref.read(mapControllerProvider.notifier).toogleFollowUser();
              },
              icon: mapControllerState.followUser
                  ? const Icon(Icons.directions_run)
                  : const Icon(Icons.accessibility_new_outlined)),
        ),
        Positioned(
          bottom: 140,
          left: 5,
          child: IconButton.filledTonal(
              onPressed: () {}, icon: const Icon(Icons.pin_drop_outlined)),
        ),
      ],
    );
  }
}

class _MapView extends ConsumerStatefulWidget {
  final double initialLat;
  final double initialLng;

  const _MapView({required this.initialLat, required this.initialLng});

  @override
  MapViewState createState() => MapViewState();
}

class MapViewState extends ConsumerState<_MapView> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
          target: LatLng(widget.initialLat, widget.initialLng), zoom: 25),
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        // _controller.complete(controller);
        ref.read(mapControllerProvider.notifier).setMapController(controller);
      },
    );
  }
}
