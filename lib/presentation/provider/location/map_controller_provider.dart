// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapState {
  final bool isReady;
  final bool followUser;
  final List<Marker> markers;
  final GoogleMapController? controller;

  MapState(
      {this.isReady = false,
      this.followUser = false,
      this.markers = const [],
      this.controller});

  MapState copyWith({
    bool? isReady,
    bool? followUser,
    List<Marker>? markers,
    GoogleMapController? controller,
  }) =>
      MapState(
        isReady: isReady ?? this.isReady,
        followUser: followUser ?? this.followUser,
        markers: markers ?? this.markers,
        controller: controller ?? this.controller,
      );
}

class MapNotifier extends StateNotifier<MapState> {
  MapNotifier() : super(MapState());

  void setMapController(GoogleMapController controller) {
    state = state.copyWith(controller: controller, isReady: true);
  }

  goToLocation() {}
}

final mapControllerProvider =
    StateNotifierProvider.autoDispose<MapNotifier, MapState>((ref) {
  return MapNotifier();
});
