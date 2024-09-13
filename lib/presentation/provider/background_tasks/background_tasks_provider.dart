import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/config/config.dart';
import 'package:workmanager/workmanager.dart';

class BackgroundFectchNotifier extends StateNotifier<bool?> {
  final String processKeyName;

  BackgroundFectchNotifier({required this.processKeyName}) : super(false) {
    checkCurrentStatus();
  }

  checkCurrentStatus() async {
    state = await SharedPreferencesPlugin.getBool(processKeyName) ?? false;
  }

  activateProcess() async {
    await Workmanager().registerPeriodicTask(processKeyName, processKeyName,
        frequency: const Duration(seconds: 10),
        constraints: Constraints(networkType: NetworkType.connected),
        tag: processKeyName);
    await SharedPreferencesPlugin.setbool(processKeyName, true);
    state = true;
  }

  deactivateProcess() async {
    await Workmanager().cancelByTag(processKeyName);
    await SharedPreferencesPlugin.setbool(processKeyName, false);
    state = false;
  }

  toggleProcess() {
    if (state == true) {
      deactivateProcess();
    } else {
      activateProcess();
    }
  }
}

final backgroundPokemonFetchProvider =
    StateNotifierProvider<BackgroundFectchNotifier, bool?>((ref) {
  return BackgroundFectchNotifier(
      processKeyName: fetchPeriodicBackgroundTaskKey);
});
