import 'package:flutter/material.dart';

class Light with ChangeNotifier {
  Color _color = Colors.red;
  double _brightness = 0.5;
  bool _isOn = true;

  Color get color => _color;
  double get brightness => _brightness;
  bool get isOn => _isOn;

  void changeColor(Color newColor) {
    _color = newColor;
    notifyListeners();
  }

  void changeBrightness(double newBrightness) {
    _brightness = newBrightness;
    notifyListeners();
  }

  void toggleSwitch() {
    _isOn = !_isOn;
    notifyListeners();
  }
}
