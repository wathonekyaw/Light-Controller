import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/widgets.dart';
import '../provider/light.dart';

class BrightnessSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Selector<Light, double>(
          selector: (context, light) => light.brightness,
          builder: (context, brightness, child) {
            return Text('Brightness: ${(brightness * 100).toInt()}%');
          },
        ),
        Selector<Light, double>(
          selector: (context, light) => light.brightness,
          builder: (context, brightness, child) {
            return Slider(
              value: brightness,
              onChanged: (val) => context.read<Light>().changeBrightness(val),
              min: 0.0,
              max: 1.0,
            );
          },
        ),
      ],
    );
  }
}
