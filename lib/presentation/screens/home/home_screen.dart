import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:miscelaneos/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: const Text('Miscelanios'),
                    actions: [
                      IconButton(
                          onPressed: () {
                            context.push('/permissions');
                          },
                          icon: const Icon(Icons.settings))
                    ],
                  ),
                  const MainMenu(),
                ],
              ),
            ),
          ),

          // Ad banner
          Container(
            color: Colors.amber,
            height: 75,
          )
        ],
      ),
    );
  }
}
