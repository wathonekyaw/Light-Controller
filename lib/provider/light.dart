import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Light with ChangeNotifier {
  Color _color = Colors.red;
  double _brightness = 0.5;
  bool _isOn = true;

  Color get color => _color;
  double get brightness => _brightness;
  bool get isOn => _isOn;

  Light() {
    loadFromPrefs();
  }

  Future<void> changeColor(Color newColor) async {
    _color = newColor;
    notifyListeners();
    await saveToPrefs();
  }

  Future<void> changeBrightness(double newBrightness) async {
    _brightness = newBrightness;
    notifyListeners();
    await saveToPrefs();
  }

  Future<void> toggleSwitch() async {
    _isOn = !_isOn;
    notifyListeners();
    await saveToPrefs();
  }

  Future<void> reset() async {
    _color = Colors.red;
    _brightness = 0.5;
    _isOn = true;
    notifyListeners();
    await saveToPrefs();
  }

  // Save the data to SharedPreferences
  Future<void> saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('color', _color.value); // color as int
    prefs.setDouble('brightness', _brightness);
    prefs.setBool('isOn', _isOn);
  }

  // Load the data from SharedPreferences
  Future<void> loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final savedColor = prefs.getInt('color');
    final savedBrightness = prefs.getDouble('brightness');
    final savedIsOn = prefs.getBool('isOn');

    if (savedColor != null) {
      _color = Color(savedColor);
    }
    if (savedBrightness != null) {
      _brightness = savedBrightness;
    }
    if (savedIsOn != null) {
      _isOn = savedIsOn;
    }

    notifyListeners(); // After loading, update UI
  }
}
