import 'package:workmanager/workmanager.dart';

const fetchBackgroundTaskKey =
    'com.williamParedes.miselanios.fetch-background-pokemon';
const fetchPeriodicBackgroundTaskKey =
    'com.williamParedes.miselanios.fetch-periodic-background-pokemon';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case fetchBackgroundTaskKey:
        print('fetchBackgroundTaskKey');
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
