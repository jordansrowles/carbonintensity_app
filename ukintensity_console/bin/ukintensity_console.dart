import 'package:ukintensity_console/ukintensity_console.dart'
    as ukintensity_console;
import 'package:ukintensity_integration/ukintensity_integration.dart';

void main(List<String> arguments) async {
  //var wales = await NationIntensityService.wales();
  //var england = await NationIntensityService.england();
  //var data = await NationIntensityService.postcode("LU7 4DG");
  //var data = await NationalStatisticsService.range("2022-07-05T19:00Z", "2022-07-05T19:30Z");
  //var data = await GenerationMixService.getPast24Hr(DateTime.now().toIso8601String());
  var data = await NationalStatisticsService.range(
      "2018-01-20T12:00Z", "2018-01-20T12:30Z");

  print("test");
}
