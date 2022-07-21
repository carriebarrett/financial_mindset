import 'package:flutter/material.dart';
import '../constants.dart';

BoxDecoration gradientBackground() {
  return const BoxDecoration(
    // Box decoration takes a gradient
    gradient: LinearGradient(
      // Where the linear gradient begins and ends
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      // Add one stop for each color. Stops should increase from 0 to 1
      stops: [0.2, 0.8],
      colors: [
        // Colors are easy thanks to Flutter's Colors class.
        englishViolet,
        darkSlateBlue
      ],
    ),
  );
}
