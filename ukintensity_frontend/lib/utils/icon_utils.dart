import 'package:flutter/material.dart';

var intensityColours = {
  "very low": {"icon": Icons.looks, "colour": Colors.green},
  "low": {"icon": Icons.looks_one, "colour": Colors.greenAccent},
  "moderate": {"icon": Icons.looks_two, "colour": Colors.greenAccent},
  "high": {"icon": Icons.looks_3, "colour": Colors.red},
  "very high": {"icon": Icons.looks_4, "colour": Colors.black26}
};

Icon getIntensityDeltaIcon(int? delta, {double size = 35.0}) => Icon(
      // if delta is 0 = flat, negative = down, positive = up
      (delta == null || delta == 0)
          ? Icons.trending_flat
          : (delta.isNegative)
              ? Icons.trending_up
              : Icons.trending_down,
      size: size,
      color: (delta!.isNegative) ? Colors.red : Colors.green,
    );

Icon getIntensityNumberIcon(String? index, {double size = 50.0}) {
  try {
    return Icon(intensityColours[index]!["icon"] as IconData, size: size, color: intensityColours[index]!["colour"] as Color);
  } catch (e) {
    return Icon(Icons.looks, size: size, color: Colors.green);
  }
}
