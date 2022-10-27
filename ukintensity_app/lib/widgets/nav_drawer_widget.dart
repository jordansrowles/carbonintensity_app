import 'package:carbon_intensity_uk/pages/genmix_page.dart';
import 'package:carbon_intensity_uk/pages/national_intensity_page.dart';
import 'package:carbon_intensity_uk/main.dart';
import 'package:flutter/material.dart';
import 'package:ukintensity_integration/ukintensity_integration.dart';

class NavigationDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // divider
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
            title: const Text('Home'),
            leading: Icon(Icons.home),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      const MyHomePage(title: "UK Carbon Intensity")));
            },
          ),

          const ListTile(
            title: Text(
              'Current Data',
              style: TextStyle(color: Colors.black26, fontSize: 18)
            ),
          ),

          ListTile(
            title: const Text("National Carbon"),
            leading: Icon(Icons.factory),
            onTap: () async {
              NationalIntensityService service = NationalIntensityService();
              final data = await service.getToday();

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      NationalIntensityPage(intensity: data)));
            },
          ),

          ListTile(
            title: const Text("Generation Mix"),
            leading: Icon(Icons.bolt),
            onTap: () async {
              GenerationMixService service = GenerationMixService();
              final data = await service.get();

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      GenMixPage(genmix: data,)));
            },
          ),
        ],
      ),
    );
  }
}
