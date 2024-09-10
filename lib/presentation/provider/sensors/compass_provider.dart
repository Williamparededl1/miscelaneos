import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final compassProvider = StreamProvider<double?>((ref) async* {
  if (FlutterCompass.events == null) {
    throw Exception('No tienes los sensores');
  }

  try {
    await for (final event in FlutterCompass.events!) {
      yield event.heading;
    }
  } catch (e) {
    throw Exception('Error inesperado ${e.toString()}');
  }
  return;
});
