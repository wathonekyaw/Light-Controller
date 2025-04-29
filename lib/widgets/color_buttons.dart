import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/light.dart';

class ColorButtons extends StatelessWidget {
  ColorButtons({super.key});

  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.cyan,
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,

      children:
          colors.map((color) {
            return GestureDetector(
              onTap: () => context.read<Light>().changeColor(color),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: Colors.black),
                ),
              ),
            );
          }).toList(),
    );
  }
}
