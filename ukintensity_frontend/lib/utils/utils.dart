import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ukintensity_app/pages/home.dart';
import 'package:flutter/foundation.dart';

// https://stackoverflow.com/questions/62432229/how-to-assign-hexadecimal-color-code-in-primaryswatch-in-flutter
MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

String prettyDate(String? start, String? end) {
  var s = DateTime.parse(start!);
  var e = DateTime.parse(end!);

  if (s.isSameDate(e)) {
    return DateFormat("dd-MM-yyyy (HH:MM - ").format(s) + DateFormat("HH:MM)").format(e);
  } else {
    return DateFormat("dd-MM-yyyy (HH:MM - ").format(s) + DateFormat("HH:MM) dd-MM-yyyy").format(e);
  }
}

String prettySingleDate(String? date) {
  var s = DateTime.parse(date!);
  return DateFormat("dd-MM-yyyy (HH:MM)").format(s);
}

extension ToPascalCase on String {
  String toPascalCase() => this[0].toUpperCase() + substring(1);
}

// https://stackoverflow.com/questions/52978195/comparing-only-dates-of-datetimes-in-dart
extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}

// todo. 0-45 verylow. 46-130 low. 131-215 moderate. 216-319 high. 320-420 veryhigh.
//  https://www.nationalgrideso.com/future-energy/our-progress/carbon-intensity-dashboard
String getIndexStringFromIntensityValue(int? value) {
  if (value! >= 0 && value >= 45) return "very low";
  throw Exception();
}

tryConnection() async {
  final Connectivity _connectivity = Connectivity();
  ConnectivityResult result = await _connectivity.checkConnectivity();
  if(result == ConnectivityResult.none) {
    if (kDebugMode) {
      print("No internet");
    }
    return false;
  } else {
    return true;
  }
}

tryConnectionNavigate(BuildContext context) async {
  final Connectivity _connectivity = Connectivity();
  ConnectivityResult result = await _connectivity.checkConnectivity();
  if(result == ConnectivityResult.none) {
    if (kDebugMode) {
      print("No internet");
    }
  } else {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const MyHomePage(
          title: "All Regions",
        )));
  }
}

const String homeDetails = """
National Grid ESO, in partnership with Environmental Defense Fund Europe, University of Oxford Department of Computer Science and WWF, have developed the world's first Carbon Intensity forecast with a regional breakdown.

The Carbon Intensity API uses state-of-the-art Machine Learning and sophisticated power system modelling to forecast the carbon intensity and generation mix 96+ hours ahead for each region in Great Britain. 

Our OpenAPI allows consumers and smart devices to schedule and minimise CO2 emissions at a local level.
""";

const String whatIsGenMix = """
Power Generation Mix is a group of different primary and secondary fuel sources of the UK's generation of power: be it coal, oil, wind, nuclear or imports. The generation mix data is current, so things like solar and wind will fluctuate throughout the day parts.
""";
