import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsContext {
  Future<bool> genMixShowZeroValues() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("genmix_showzero") ?? true;
  }

  Future<bool> genMixShowExtended() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("genmix_extended") ?? true;
  }
}
