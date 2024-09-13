import 'package:miscelaneos/domian/domain.dart';

abstract class LocalDbDatasource {
  Future<List<Pokemon>> loadPokemons();
  Future<int> pokemonCount();
  Future<void> insertPokemon(Pokemon pokemon);
}
