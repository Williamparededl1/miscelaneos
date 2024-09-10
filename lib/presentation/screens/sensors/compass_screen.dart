import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/provider/permissions/permissions_provider.dart';
import 'package:miscelaneos/presentation/screens/screens.dart';

class CompassScreen extends ConsumerWidget {
  const CompassScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationGrented = ref.watch(permissionsProvider).locationGranted;

    if (!locationGrented) return const AskLocationScreen();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Brujula', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: const Compass(),
    );
  }
}

class Compass extends StatelessWidget {
  const Compass({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          '155',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        const SizedBox(
          height: 20,
        ),
        Stack(
          children: [],
        )
      ],
    );
  }
}
