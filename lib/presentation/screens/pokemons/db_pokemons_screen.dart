import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/config/config.dart';
import 'package:miscelaneos/domian/domain.dart';
import 'package:miscelaneos/presentation/provider/providers.dart';
import 'package:workmanager/workmanager.dart';

class DbPokemonsScreen extends ConsumerWidget {
  const DbPokemonsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonsAsync = ref.watch(pokemonsDbProvider);
    final isBackgroundFetchActive = ref.watch(backgroundPokemonFetchProvider);
    if (pokemonsAsync.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    final List<Pokemon> pokemons = pokemonsAsync.value ?? [];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Backgound Process'),
        actions: [
          IconButton(
              onPressed: () {
                Workmanager().registerOneOffTask(
                    fetchBackgroundTaskKey, fetchBackgroundTaskKey,
                    initialDelay: const Duration(seconds: 3),
                    inputData: {'Preuba': 'Task'});
              },
              icon: const Icon(Icons.add_alarm_sharp))
        ],
      ),
      body: CustomScrollView(
        slivers: [
          _PokemonsGrid(
            pokemons: pokemons,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ref.read(backgroundPokemonFetchProvider.notifier).toggleProcess();
        },
        label: (isBackgroundFetchActive == true)
            ? const Text('Desactivar Periodico')
            : const Text('Activar Periodico'),
        icon: const Icon(Icons.av_timer),
      ),
    );
  }
}

class _PokemonsGrid extends StatelessWidget {
  final List<Pokemon> pokemons;
  const _PokemonsGrid({required this.pokemons});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 2, mainAxisSpacing: 2),
      itemCount: pokemons.length,
      itemBuilder: (context, index) {
        final pokemon = pokemons[index];
        return Column(
          children: [
            Image.network(
              pokemon.spriteFront,
              fit: BoxFit.cover,
            ),
            Text(pokemon.name)
          ],
        );
      },
    );
  }
}
