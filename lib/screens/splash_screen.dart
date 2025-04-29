import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/light.dart';
import 'LightControllerPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final light = Provider.of<Light>(context, listen: false);
    await light.loadFromPrefs();
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (context) => LightControllerPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.lightbulb, size: 100, color: Colors.amber),
            SizedBox(height: 20),
            Text('Loading to Bring Your Light...', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
