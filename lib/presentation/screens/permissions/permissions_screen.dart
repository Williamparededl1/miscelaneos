import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/provider/providers.dart';

class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permisos'),
      ),
      body: const _PermissionsView(),
    );
  }
}

class _PermissionsView extends ConsumerWidget {
  const _PermissionsView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final permissions = ref.watch(permissionsProvider);

    return ListView(
      children: [
        CheckboxListTile(
          secondary: const Icon(Icons.camera_alt_outlined),
          value: permissions.cameraGranted,
          title: const Text('Camara'),
          subtitle: Text('Estado ${permissions.camera}'),
          onChanged: (value) {
            ref.read(permissionsProvider.notifier).requestCameraAccess();
          },
        ),
        CheckboxListTile(
          secondary: const Icon(Icons.photo_album_outlined),
          value: permissions.photoLibraryGranted,
          title: const Text('Galeria de Fotos'),
          subtitle: Text('Estado ${permissions.photoLibrary}'),
          onChanged: (value) {
            ref.read(permissionsProvider.notifier).requestPhotoLibraryAccess();
          },
        ),
        CheckboxListTile(
          secondary: const Icon(Icons.monitor_heart_outlined),
          value: permissions.sensorsGranted,
          title: const Text('Sensores'),
          subtitle: Text('Estado ${permissions.sensors}'),
          onChanged: (value) {
            ref.read(permissionsProvider.notifier).requestSensorsAccess();
          },
        ),
        CheckboxListTile(
          secondary: const Icon(Icons.location_on_outlined),
          value: permissions.locationGranted,
          title: const Text('Ubicacion'),
          subtitle: Text('Estado ${permissions.location}'),
          onChanged: (value) {
            ref.read(permissionsProvider.notifier).requestLocationAccess();
          },
        ),
      ],
    );
  }
}
