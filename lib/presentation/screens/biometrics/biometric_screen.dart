import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/provider/providers.dart';

class BiometricScreen extends ConsumerWidget {
  const BiometricScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canCheckBiometric = ref.watch(canCheckBiometricsProvider);
    final localAuthState = ref.watch(localAuthProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biometric'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  ref.read(localAuthProvider.notifier).authenticateUser();
                },
                child: const Text('Auntenticar')),
            canCheckBiometric.when(
                data: (canCheck) =>
                    Text('Puede revisar biometricos: $canCheck'),
                error: (error, _) => Text('Error: ${error.toString()}'),
                loading: () => const CircularProgressIndicator()),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Estado del Biometrico',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              'Estado $localAuthState',
              style: const TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
