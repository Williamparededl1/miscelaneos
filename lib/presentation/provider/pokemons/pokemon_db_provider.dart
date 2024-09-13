import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/domian/domain.dart';
import 'package:miscelaneos/infrastructure/infrastructure.dart';

final pokemonsDbProvider =
    FutureProvider.autoDispose<List<Pokemon>>((ref) async {
  final localDB = LocalDbRepositoryImpl();
  return await localDB.loadPokemons();
});
