import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              height: 30,
            ),
            const Text('Seguimiento de Ubicacion'),
          ],
        ),
      ),
    );
  }
}
