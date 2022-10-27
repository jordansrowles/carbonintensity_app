import 'package:ukintensity_console/ukintensity_console.dart' as ukintensity_console;
import 'package:ukintensity_integration/ukintensity_integration.dart';

void main(List<String> arguments) async {
 NationalIntensityService service = NationalIntensityService();
 var data_current = await service.getCurrentHalfHour();
 var data_today = await service.getToday();

 GenerationMixService genService = GenerationMixService();
 var data_genmix = await genService.get();
}
