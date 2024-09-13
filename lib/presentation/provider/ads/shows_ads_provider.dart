import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/config/config.dart';

const storeKey = 'showAds';

class ShowsAdsNotifier extends StateNotifier<bool> {
  ShowsAdsNotifier() : super(false) {
    checkAdsState();
  }

  void checkAdsState() async {
    state = await SharedPreferencesPlugin.getBool(storeKey) ?? true;
  }

  void removeAds() {
    SharedPreferencesPlugin.setbool(storeKey, false);
    state = false;
  }

  void showAds() {
    SharedPreferencesPlugin.setbool(storeKey, true);
    state = true;
  }

  void toggleAds() {
    state ? removeAds() : showAds();
  }
}

final showsAdsProvider = StateNotifierProvider<ShowsAdsNotifier, bool>((ref) {
  return ShowsAdsNotifier();
});
