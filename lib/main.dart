import 'package:flutter/material.dart';
import 'package:light_controller/screens/LightControllerPage.dart';
import 'package:provider/provider.dart';
import './provider/light.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => Light(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LightControllerPage());
  }
}
