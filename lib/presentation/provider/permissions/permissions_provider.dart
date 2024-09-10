// state notifier provider

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsNotifier extends StateNotifier<PermissionsState> {
  PermissionsNotifier() : super(PermissionsState());
}

class PermissionsState {
  final PermissionStatus camera;
  final PermissionStatus photoLibrary;
  final PermissionStatus sensors;

  final PermissionStatus location;
  final PermissionStatus locationAlways;
  final PermissionStatus locationWhenInUse;

  PermissionsState({
    this.camera = PermissionStatus.denied,
    this.photoLibrary = PermissionStatus.denied,
    this.sensors = PermissionStatus.denied,
    this.location = PermissionStatus.denied,
    this.locationAlways = PermissionStatus.denied,
    this.locationWhenInUse = PermissionStatus.denied,
  });

  get cameraGranted {
    return camera == PermissionStatus.granted;
  }

  get photoLibraryGranted {
    return photoLibrary == PermissionStatus.granted;
  }

  get sensorsGranted {
    return sensors == PermissionStatus.granted;
  }

  get locationGranted {
    return location == PermissionStatus.granted;
  }

  get locationAlwaysGranted {
    return locationAlways == PermissionStatus.granted;
  }

  get locationWhenInUseGranted {
    return locationWhenInUse == PermissionStatus.granted;
  }

  copyWith({
    PermissionStatus? camera,
    PermissionStatus? photoLibrary,
    PermissionStatus? sensors,
    PermissionStatus? location,
    PermissionStatus? locationAlways,
    PermissionStatus? locationWhenInUse,
  }) =>
      PermissionsState(
        camera: camera ?? this.camera,
        photoLibrary: photoLibrary ?? this.photoLibrary,
        sensors: sensors ?? this.sensors,
        location: location ?? this.location,
        locationAlways: locationAlways ?? this.locationAlways,
        locationWhenInUse: locationWhenInUse ?? this.locationWhenInUse,
      );
}
