import 'package:miscelaneos/domian/domain.dart';

abstract class LocalDbRepository {
  Future<List<Pokemon>> localPokemons();
  Future<int> pokemonCount();
  Future<void> insertPokemon(Pokemon pokemon);
}
