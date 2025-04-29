import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/light.dart';

class LightDisplay extends StatelessWidget {
  const LightDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Light>(
      builder: (context, light, child) {
        return Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: light.isOn ? light.color.withOpacity(light.brightness) : Colors.grey[800],

            shape: BoxShape.circle,
          ),
        );
      },
    );
  }
}
