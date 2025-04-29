import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/light.dart';

class LightToggleSwitch extends StatelessWidget {
  const LightToggleSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Light>(
      builder: (context, light, child) {
        return SwitchListTile(
          title: Text('Light ON?OFF'),
          value: light.isOn,
          onChanged: (val) => light.toggleSwitch(),
        );
      },
    );
  }
}
