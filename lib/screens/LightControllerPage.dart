import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../provider/light.dart';
import '../utils/colorButton.dart';

class LightControllerPage extends StatelessWidget {
  const LightControllerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final light = Provider.of<Light>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Light Controller')),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Container(
            width: 150,
            height: 150,

            decoration: BoxDecoration(
              color: light.isOn ? light.color.withOpacity(light.brightness) : Colors.grey[800],

              shape: BoxShape.circle,
            ),
          ),

          SizedBox(height: 30),

          SwitchListTile(
            title: Text('Light ON/OFF'),

            value: light.isOn,
            onChanged: (val) {
              light.toggleSwitch();
            },
          ),

          SizedBox(height: 20),

          Column(
            children: [
              Text('Brightness : ${(light.brightness * 100).toInt()} %'),

              Slider(
                value: light.brightness,
                onChanged: (val) {
                  light.changeBrightness(val);
                },

                min: 0.0,

                max: 1.0,
              ),
            ],
          ),
          SizedBox(height: 20),

          //colr btn
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ColorButton(color: Colors.red),
              ColorButton(color: Colors.green),
              ColorButton(color: Colors.blue),
            ],
          ),
        ],
      ),
    );
  }
}
