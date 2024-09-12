import 'package:flutter/material.dart';

class AdRewardedScreen extends StatelessWidget {
  const AdRewardedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdRewardedScreen'),
      ),
      body: const Center(
        child: Text('Tienes esta cantidad de puntos XX'),
      ),
    );
  }
}
