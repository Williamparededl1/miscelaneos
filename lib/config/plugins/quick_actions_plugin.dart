import 'package:quick_actions/quick_actions.dart';

class QuickActionsPlugin {
  static registerActions() {
    const QuickActions quickActions = QuickActions();
    quickActions.initialize((shortcutType) {
      switch (shortcutType) {
        case 'biometric':
          break;
        case 'compass':
          break;
        case 'pokemons':
          break;
        case 'charmander':
          break;
      }
    });

    quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(
          type: 'biometric', localizedTitle: 'Biometric', icon: 'icon_main'),
      const ShortcutItem(
          type: 'compass', localizedTitle: 'Compass', icon: 'icon_main'),
      const ShortcutItem(
          type: 'pokemons', localizedTitle: 'Pokemons', icon: 'icon_main'),
      const ShortcutItem(
          type: 'charmander', localizedTitle: 'Charmander', icon: 'icon_main'),
    ]);
  }
}
