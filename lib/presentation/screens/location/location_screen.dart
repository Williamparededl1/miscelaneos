import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/provider/providers.dart';

class LocationScreen extends ConsumerWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userLocationAsync = ref.watch(userLocationProvider);

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
            userLocationAsync.when(
                data: (data) => Text('$data'),
                error: (error, stackTrace) => Text('$error'),
                loading: () => const CircularProgressIndicator()),
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
