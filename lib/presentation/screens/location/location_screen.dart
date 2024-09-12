import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/provider/providers.dart';

class LocationScreen extends ConsumerWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = ref.read(userLocationProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubicacion'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Ubicacion Actual'),
            const SizedBox(
              height: 10,
            ),
            location.when(
              data: (location) => Text('$location'),
              error: (error, stackTrace) => Text('Error: ${error.toString()}'),
              loading: () => const CircularProgressIndicator(),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text('Seguimiento de Ubicacion'),
          ],
        ),
      ),
    );
  }
}
