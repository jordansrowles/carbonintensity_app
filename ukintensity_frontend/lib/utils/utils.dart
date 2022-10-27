import 'package:intl/intl.dart';

String prettyDate(String? start, String? end) {
  var s = (DateTime.parse(start!));
  var e = DateTime.parse(end!);

  if (s.year == e.year && s.month == s.month && e.day == s.day) {
    var prettyStart =
        DateFormat("yyyy MM dd (HH:MM - ").format(DateTime.parse(start!));
    var prettyEnd = DateFormat("HH:MM)").format(DateTime.parse(end!));
    return prettyStart + prettyEnd;
  } else {
    var prettyStart =
        DateFormat("yyyy MM dd (HH:MM - ").format(DateTime.parse(start!));
    var prettyEnd =
        DateFormat("HH:MM) YYYY MM dd").format(DateTime.parse(end!));
    return prettyStart + prettyEnd;
  }
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

const String homeDetails = """
National Grid ESO, in partnership with Environmental Defense Fund Europe, University of Oxford Department of Computer Science and WWF, have developed the world's first Carbon Intensity forecast with a regional breakdown.

The Carbon Intensity API uses state-of-the-art Machine Learning and sophisticated power system modelling to forecast the carbon intensity and generation mix 96+ hours ahead for each region in Great Britain. 

Our OpenAPI allows consumers and smart devices to schedule and minimise CO
""";
