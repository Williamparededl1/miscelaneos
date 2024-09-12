import 'package:flutter/material.dart';

class BiometricScreen extends StatelessWidget {
  const BiometricScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biometric'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {}, child: const Text('Auntenticar')),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Estado del Biometrico',
              style: TextStyle(fontSize: 30),
            ),
            const Text(
              'Estado XXXXX',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
