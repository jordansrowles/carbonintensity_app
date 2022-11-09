import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ukintensity_app/utils/settings.dart';

class SettingsPage extends StatefulWidget {
  final String title;
  const SettingsPage({super.key, required this.title});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool settingGMShowZero = false;
  bool settingGMExtended = false;

  _loadSettings() async {
    setState(() async {
      final prefs = await SharedPreferences.getInstance();
      settingGMShowZero = prefs.getBool("genmix_showzero") ?? false;
      settingGMExtended = prefs.getBool("genmix_extended") ?? false;
    });
  }

  @override
  initState()  {
    _loadSettings();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SettingsList(
          sections: [
            SettingsSection(
              title: const Text("Generation Mix Chart Settings"),
              tiles: [
                SettingsTile.switchTile(
                  title: const Text("Show extended options"),
                  leading: const Icon(Icons.fingerprint),
                  initialValue: settingGMExtended,
                  onToggle: (value) async {
                    setState(() async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setBool("genmix_extended", value);
                    });
                  },
                ),
                SettingsTile.switchTile(
                  title: const Text("Show null/0 values"),
                  leading: const Icon(Icons.fingerprint),
                  initialValue: settingGMShowZero,
                  onToggle: (value) async {
                    setState(() async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setBool("genmix_showzero", value);
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
