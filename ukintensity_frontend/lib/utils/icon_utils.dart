import 'package:flutter/material.dart';

var intensityColours = {
  "very low": {"icon": Icons.looks, "colour": Colors.green},
  "low": {"icon": Icons.looks_one, "colour": Colors.greenAccent},
  "moderate": {"icon": Icons.looks_two, "colour": Colors.greenAccent},
  "high": {"icon": Icons.looks_3, "colour": Colors.red},
  "very high": {"icon": Icons.looks_4, "colour": Colors.black26}
};

Icon getIntensityDeltaIcon(int? delta) => Icon(
      // if delta is 0 = flat, negative = down, positive = up
      (delta == null || delta == 0)
          ? Icons.trending_flat
          : (delta.isNegative)
              ? Icons.trending_up
              : Icons.trending_down,
      size: 35,
      color: (delta!.isNegative) ? Colors.red : Colors.green,
    );

Icon getIntensityNumberIcon(String? index) =>
    Icon(intensityColours[index!]!["icon"] as IconData,
        size: 50, color: intensityColours[index!]!["colour"] as Color);
