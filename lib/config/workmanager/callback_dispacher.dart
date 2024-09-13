import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    //simpleTask will be emitted here.
    return Future.value(true);
  });
}
