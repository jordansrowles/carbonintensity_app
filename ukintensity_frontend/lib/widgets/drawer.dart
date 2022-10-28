import 'package:flutter/material.dart';
import 'package:ukintensity_app/pages/current/all_today_intensity.dart';
import 'package:ukintensity_app/pages/current/generation_mix.dart';
import 'package:ukintensity_app/pages/current/national_intensity.dart';
import 'package:ukintensity_app/pages/home.dart';
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
            title: const Text("Home"),
            leading: const Icon(Icons.house),
            onTap: () async {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MyHomePage(
                        title: "National Intensity UK",
                      )));
            },
          ),
          ListTile(
            title: const Text("National Intensity"),
            leading: const Icon(Icons.bolt),
            onTap: () async {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CurrentNationalIntensityPage(
                        title: "Current National Intensity",
                      )));
            },
          ),
          ListTile(
            title: const Text("List National Intensity"),
            leading: const Icon(Icons.list),
            onTap: () async {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AllNationalIntensityPage(
                        title: "Current National Intensity",
                      )));
            },
          ),
          ListTile(
            title: const Text("Generation Mix"),
            leading: const Icon(Icons.factory),
            onTap: () async {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CurrentGenMixPage(
                        title: "Current Gen Mix Data",
                      )));
            },
          ),
        ],
      ),
    );
  }
}
