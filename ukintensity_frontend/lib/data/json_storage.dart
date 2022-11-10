import 'package:json_store/json_store.dart';
import 'package:http/http.dart' as http;
import 'package:ukintensity_integration/ukintensity_integration.dart';

// Note: JsonStore is a singleton and instantiating with
// factory constructor JsonStore() will only ever have one instance

class JsonStorageNationalIntensity {
  JsonStore jsonStorage = JsonStore();

  Future<NationalIntensity?> getMostRecent() async {
    Map<String, dynamic>? json = await jsonStorage.getItem('nationalintensity_mostrecent_current');
    return json != null ? NationalIntensity.fromJson(json) : null;
  }

  setMostRecent(NationalIntensity intensity) async {
    await jsonStorage.setItem('nationalintensity_mostrecent_current', intensity.toJson());
  }
}

class JsonStorageGenMix {
  JsonStore jsonStorage = JsonStore();

  Future<GenerationMix?> getMostRecent() async {
    Map<String, dynamic>? json = await jsonStorage.getItem('nationalgenmix_mostrecent');
    return json != null ? GenerationMix.fromJson(json) : null;
  }

  setMostRecent(GenerationMix genmix) async {
    await jsonStorage.setItem('nationalgenmix_mostrecent', genmix.toJson());
  }
}

class AppDataService {
  // TODO test internet connection, if connection then query api and load data, save data
  // TODO into json store and display data, save down on every successful page load. If
  // TODO no internet then query store, if no data, display a no data no connection page

  Future<bool> _hasInternetConnection() async {
    try {
      final response = await http.get(Uri.parse("https://api.carbonintensity.org.uk/intensity"));
      return (response.statusCode == 200 || response.statusCode == 201) ? true : false;
    } catch (e) {
      return false;
    }
  }

  Future<GenerationMix?> nationalGenMix() async {
    if (await _hasInternetConnection()) {
      var data = await GenerationMixService.get();
      JsonStorageGenMix().setMostRecent(data);
      return data;
    }
    else {
      return JsonStorageGenMix().getMostRecent();
    }

  }

}