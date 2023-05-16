import 'package:flutter/material.dart';
import 'package:meals/app/components/drawer.dart';
import 'package:meals/app/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var settings = Settings();

  Widget _createSwitch(
      String title, String subtitle, bool? value, Function(bool)? onChanged) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value!,
      onChanged: onChanged!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      drawer: const MainDrawer(),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Configurações',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            _createSwitch(
              'Sem Glutén',
              'Só exibe refeições sem glutén!',
              settings.isGlutenFree,
              (value) => {setState(() => settings.isGlutenFree = value)},
            ),
            _createSwitch(
              'Sem Lactose',
              'Só exibe refeições sem lactose!',
              false,
              (value) => {setState(() => settings.isLactoseFree = value)},
            ),
            _createSwitch(
              'Vegana',
              'Só exibe refeições veganas!',
              false,
              (value) => {setState(() => settings.isVegan = value)},
            ),
            _createSwitch(
              'Vegetariana',
              'Só exibe refeições vegetarianas!',
              false,
              (value) => {setState(() => settings.isVegetarian = value)},
            ),
          ],
        ))
      ]),
    );
  }
}
