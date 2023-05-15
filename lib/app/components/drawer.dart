import 'package:flutter/material.dart';
import 'package:meals/app/utils/routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _createIcon(IconData icon, String label, Function()? onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 120,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.bottomCenter,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'Recipe App',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          _createIcon(
            Icons.restaurant,
            'Refeições',
            () => Navigator.pushNamed(
              context,
              RoutesConst.home,
            ),
          ),
          _createIcon(
            Icons.settings,
            'Configurações',
            () => Navigator.pushNamed(
              context,
              RoutesConst.settings,
            ),
          ),
        ],
      ),
    );
  }
}
