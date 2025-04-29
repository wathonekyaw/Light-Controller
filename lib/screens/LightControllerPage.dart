import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/light.dart';
import '../utils/colorButton.dart';

class LightControllerPage extends StatelessWidget {
  const LightControllerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Light Controller'),

        actions: [
          IconButton(
            onPressed: () {
              context.read<Light>().reset();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Consumer<Light>(
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
          ),
          SizedBox(height: 30),

          Consumer<Light>(
            builder: (context, light, child) {
              return SwitchListTile(
                title: Text('Light ON/OFF'),
                value: light.isOn,
                onChanged: (val) {
                  light.toggleSwitch();
                },
              );
            },
          ),
          SizedBox(height: 20),
          Column(
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

                    onChanged: (val) {
                      context.read<Light>().changeBrightness(val);
                    },
                    min: 0.0,
                    max: 1.0,
                  );
                },
              ),
            ],
          ),

          Wrap(
            spacing: 10,
            runSpacing: 10,

            children: [
              ColorButton(color: Colors.red),
              ColorButton(color: Colors.green),
              ColorButton(color: Colors.blue),
              ColorButton(color: Colors.yellow),
              ColorButton(color: Colors.purple),
              ColorButton(color: Colors.cyan),
            ],
          ),
        ],
      ),
    );
  }
}
