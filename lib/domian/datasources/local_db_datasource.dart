import 'package:miscelaneos/domian/domain.dart';

abstract class LocalDbDatasource {
  Future<List<Pokemon>> localPokemons();
  Future<int> pokemonCount();
  Future<void> insertPokemon(Pokemon pokemon);
}
