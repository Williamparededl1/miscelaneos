import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final String route;

  MenuItem(this.title, this.icon, this.route);
}

final menuItems = <MenuItem>[
  MenuItem('Giroscopio', Icons.downloading, '/gyroscope'),
  MenuItem('Acelerometro', Icons.speed, '/accelerometer'),
  MenuItem('Magnetometro', Icons.explore_outlined, '/magnetometer'),
  MenuItem(
      'Giroscopio Ball', Icons.sports_basketball_outlined, '/gyroscope-ball'),
  MenuItem('Brujula', Icons.explore, '/compass'),
  MenuItem('Pokemons', Icons.catching_pokemon_outlined, '/pokemons'),
  MenuItem('Biometricos', Icons.fingerprint_outlined, '/biometric'),
  MenuItem('Ubicacion', Icons.pin_drop_outlined, '/location'),
  MenuItem('Mapa', Icons.map_outlined, '/map'),
  MenuItem('Seguimiento', Icons.gamepad_outlined, '/controlled-map'),
  MenuItem('Ad Full', Icons.ad_units_outlined, '/ad-screen'),
  MenuItem('Ad Reward', Icons.monetization_on_outlined, '/ad-rewarded'),
  MenuItem('Pokedex', Icons.book_rounded, '/db-pokemons'),
];

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: menuItems
          .map(
            (item) => HomeMenuItem(
                title: item.title, icon: item.icon, route: item.route),
          )
          .toList(),
    );
  }
}

class HomeMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String route;
  final List<Color> bgColors;

  const HomeMenuItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.route,
      this.bgColors = const [Colors.lightBlue, Colors.blue]});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(route),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                colors: bgColors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
