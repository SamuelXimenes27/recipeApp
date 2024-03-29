import 'package:flutter/material.dart';
import 'package:meals/app/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChanged;
  const SettingsScreen({
    super.key,
    required this.settings,
    required this.onSettingsChanged,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings? settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
      String title, String subtitle, bool value, Function(bool)? onChanged) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged!(value);
        widget.onSettingsChanged(settings!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
            child: ListView(
          children: [
            _createSwitch(
              'Gluten free',
              'Only displays gluten-free meals!',
              settings!.isGlutenFree!,
              (value) => {setState(() => settings!.isGlutenFree = value)},
            ),
            _createSwitch(
              'Lactose free',
              'Only displays lactose-free meals!',
              settings!.isLactoseFree!,
              (value) => {setState(() => settings!.isLactoseFree = value)},
            ),
            _createSwitch(
              'Vegan',
              'Only displays vegan meals!',
              settings!.isVegan!,
              (value) => {setState(() => settings!.isVegan = value)},
            ),
            _createSwitch(
              'Vegetarian',
              'Only displays vegetarian meals!',
              settings!.isVegetarian!,
              (value) => {setState(() => settings!.isVegetarian = value)},
            ),
          ],
        ))
      ]),
    );
  }
}
