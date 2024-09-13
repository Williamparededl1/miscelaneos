import 'package:miscelaneos/infrastructure/infrastructure.dart';
import 'package:workmanager/workmanager.dart';

const fetchBackgroundTaskKey =
    'com.williamParedes.miselanios.fetch-background-pokemon';
const fetchPeriodicBackgroundTaskKey =
    'com.williamParedes.miselanios.fetch-background-pokemon';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case fetchBackgroundTaskKey:
        await loadNextPokemon();
        break;
      case fetchPeriodicBackgroundTaskKey:
        print('fetchPeriodicBackgroundTaskKey');
        break;
      case Workmanager.iOSBackgroundTask:
        print('Workmanager.iOSBackgroundTask');
        break;
    }
    return true;
  });
}

Future loadNextPokemon() async {
  final localDbRepository = LocalDbRepositoryImpl();
  final pokemonRepository = PokemonsRepositoryImpl();
  final lastPokemonId = await localDbRepository.pokemonCount() + 1;
  try {
    final (pokemon, message) =
        await pokemonRepository.getPokemon('$lastPokemonId');
    if (pokemon == null) throw message;
    await localDbRepository.insertPokemon(pokemon);
    print('pokemon insertado ${pokemon.name}');
  } catch (e) {
    print('$e');
  }
}
