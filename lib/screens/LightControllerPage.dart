import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/light.dart';
import '../widgets/brightness_slider.dart';
import '../widgets/color_buttons.dart';
import '../widgets/light_display.dart';
import '../widgets/light_toggle_switch.dart';

class LightControllerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Light Controller'),
        actions: [
          IconButton(icon: Icon(Icons.refresh), onPressed: () => context.read<Light>().reset()),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LightDisplay(),
          SizedBox(height: 30),
          LightToggleSwitch(),
          SizedBox(height: 20),
          BrightnessSlider(),
          SizedBox(height: 20),
          ColorButtons(),
        ],
      ),
    );
  }
}
