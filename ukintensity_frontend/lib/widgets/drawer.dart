import 'package:flutter/material.dart';
import 'package:ukintensity_app/pages/current/all_regional_intensity.dart';
import 'package:ukintensity_app/pages/current/all_today_intensity_new.dart';
import 'package:ukintensity_app/pages/current/generation_mix.dart';
import 'package:ukintensity_app/pages/current/national_intensity.dart';
import 'package:ukintensity_app/pages/home.dart';

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
            title: const Text("Home", style: TextStyle(fontSize: 18),),
            leading: const Icon(Icons.house),
            onTap: () async {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MyHomePage(
                        title: "National Intensity UK",
                      )));
            },
          ),
          ListTile(
            title: const Text("Current National", style: TextStyle(fontSize: 18),),
            leading: const Icon(Icons.bolt),
            onTap: () async {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CurrentNationalIntensityPage(
                        title: "Current National Intensity",
                      )));
            },
          ),
          ListTile(
            title: const Text("List National", style: TextStyle(fontSize: 18),),
            leading: const Icon(Icons.list),
            onTap: () async {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AllNationalIntensityPage(
                        title: "Current National Intensity",
                      )));
            },
          ),
          ListTile(
            title: const Text("Current GenMix", style: TextStyle(fontSize: 18),),
            leading: const Icon(Icons.factory),
            onTap: () async {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CurrentGenMixPage(
                        title: "Current Gen Mix Data",
                      )));
            },
          ),
          ListTile(            title: const Text("All Regions", style: TextStyle(fontSize: 18),),
            leading: const Icon(Icons.map),
            onTap: () async {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AllRegionalIntensityPage(
                        title: "All Regions",
                      )));
            },
          ),
          const Divider(
            height: 10,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
