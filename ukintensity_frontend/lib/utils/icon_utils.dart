import 'package:community_material_icon/community_material_icon.dart';
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

var genMixIconColour = const Color(0xff0d43ff);
var genMixIcons = {
  "wind": {
    "icon": CommunityMaterialIcons.wind_turbine,
    "colour": genMixIconColour
  },
  "gas": {"icon": Icons.propane, "colour": genMixIconColour},
  //"imports" : { "icon": Icons.directions_boat, "colour": Colors.red },
  "imports": {"icon": Icons.directions_ferry, "colour": genMixIconColour},
  "nuclear": {"icon": CommunityMaterialIcons.atom, "colour": genMixIconColour},
  "biomass": {"icon": Icons.compost, "colour": genMixIconColour},
  "hydro": {
    "icon": CommunityMaterialIcons.hydro_power,
    "colour": genMixIconColour
  },
  "coal": {
    "icon": CommunityMaterialIcons.fireplace,
    "colour": genMixIconColour
  },
  "solar": {"icon": Icons.solar_power, "colour": genMixIconColour}
};

Icon getGenMixIcon(String? index, {double size = 35.0}) {
  try {
    return Icon(genMixIcons[index]!["icon"] as IconData,
        size: size, color: genMixIcons[index]!["colour"] as Color);
  } catch (e) {
    return Icon(Icons.looks, size: size, color: Colors.green);
  }
}
