import 'package:carbon_intensity_uk/pages/gen_mix.dart';
import 'package:carbon_intensity_uk/pages/intensity/today.dart';
import 'package:carbon_intensity_uk/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:ukintensity_integration/ukintensity_integration.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 50,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              padding: EdgeInsets.zero,
              child: Text(""),
            ),
          ),
          ListTile(
            title: const Text("National Intensity"),
            leading: Icon(Icons.bolt),
            onTap: () async {
              GenerationMixService service = GenerationMixService();
              final data = await service.get();

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NationalTodayPage(
                        genMix: data,
                      )));
            },
          ),
          ListTile(
            title: const Text("Generation Mix"),
            leading: Icon(Icons.bolt),
            onTap: () async {
              GenerationMixService service = GenerationMixService();
              final data = await service.get();

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => GenMixPage(
                        genMix: data,
                      )));
            },
          ),
          ListTile(
            title: const Text("Settings"),
            leading: Icon(Icons.settings),
            onTap: () async {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            },
          ),
        ],
      ),
    );
  }
}
