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
    return Icon(intensityColours[index]!["icon"] as IconData,
        size: size, color: intensityColours[index]!["colour"] as Color);
  } catch (e) {
    return Icon(Icons.looks, size: size, color: Colors.green);
  }
}

var genMixIcons = {
  "wind": {"icon": Icons.air, "colour": Colors.red},
  "gas": {"icon": Icons.propane, "colour": Colors.red},
  //"imports" : { "icon": Icons.directions_boat, "colour": Colors.red },
  "imports": {"icon": Icons.oil_barrel, "colour": Colors.red},
  "nuclear": {"icon": Icons.data_thresholding, "colour": Colors.red},
  "biomass": {"icon": Icons.compost, "colour": Colors.red},
  "hydro": {"icon": Icons.water, "colour": Colors.red},
  "coal": {"icon": Icons.air, "colour": Colors.red},
  "solar": {"icon": Icons.solar_power, "colour": Colors.red}
};

Icon getGenMixIcon(String? index, {double size = 20.0}) {
  try {
    return Icon(genMixIcons[index]!["icon"] as IconData,
        size: size, color: genMixIcons[index]!["colour"] as Color);
  } catch (e) {
    return Icon(Icons.looks, size: size, color: Colors.green);
  }
}
