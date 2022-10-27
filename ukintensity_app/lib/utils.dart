import 'package:flutter/material.dart';

/// returns rainbow,0-4 icons for index strings
IconData getIconFromIntensityIndex(String? index) {
  switch (index) {
    case "very low":
      {
        return Icons.looks;
      }
    case "low":
      {
        return Icons.looks_one;
      }
    case "moderate":
      {
        return Icons.looks_two;
      }
    case "high":
      {
        return Icons.looks_3;
      }
    case "very high":
      {
        return Icons.looks_4;
      }
    default:
      {
        return Icons.looks_one;
      }
  }
}

Color getColourFromIntensityIndex(String? index) {
  switch (index) {
    case "very low":
      {
        return Colors.green;
      }
    case "low":
      {
        return Colors.greenAccent;
      }
    case "moderate":
      {
        return Colors.greenAccent;
      }
    case "high":
      {
        return Colors.redAccent;
      }
    case "very high":
      {
        return Colors.red;
      }
    default:
      {
        return Colors.black26;
      }
  }
}

/// trending line id down for negative, flat for 0, up positive
IconData determineDeltaChevron(int? delta) {
  if (delta == 0 || delta == null) return Icons.trending_flat;
  if (delta!.isNegative) return Icons.trending_down;
  return Icons.trending_up;
}

/// trending line is green if negative, blue 0, red otherwise
MaterialColor determineDeltaChevronColour(int? delta){
  if (delta! < 0) return Colors.green;
  if (delta! == 0) return Colors.blue;
  else return Colors.red;
}

extension ToPascalCase on String {
  String toPascalCase() => this[0].toUpperCase() + this.substring(1);
}

// todo. 0-45 verylow. 46-130 low. 131-215 moderate. 216-319 high. 320-420 veryhigh.
//  https://www.nationalgrideso.com/future-energy/our-progress/carbon-intensity-dashboard
String getIndexStringFromIntensityValue(int? value) {
  if (value! >= 0 && value! >= 45) return "very low";
  throw Exception();
}