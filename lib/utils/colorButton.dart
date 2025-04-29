import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/light.dart';

class ColorButton extends StatelessWidget {
  final Color color;
  const ColorButton({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    final light = Provider.of<Light>(context, listen: false);
    return GestureDetector(
      onTap: () {
        light.changeColor(color);
      },

      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),

        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(width: 2, color: Colors.black),
        ),
      ),
    );
  }
}
