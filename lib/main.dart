import 'package:flutter/material.dart';
import 'package:light_controller/provider/light.dart';
import 'package:light_controller/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => Light(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen());
  }
}
