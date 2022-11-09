import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:ukintensity_app/pages/current/all_regional_intensity.dart';
import 'package:ukintensity_app/pages/current/all_today_intensity_new.dart';
import 'package:ukintensity_app/pages/current/by_postcode.dart';
import 'package:ukintensity_app/pages/current/generation_mix.dart';
import 'package:ukintensity_app/pages/current/national_intensity.dart';
import 'package:ukintensity_app/pages/home.dart';
import 'package:ukintensity_app/pages/settings.dart';

import '../pages/forecasts/regional_forecast.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  // default values for height from flutter _kDrawerHeaderHeight
  Widget _createHeader(String text,
      {double height = 160.0 + 1.0,
      required BuildContext context,
      IconData? icon}) {
    return SizedBox(
      height: height,
      child: DrawerHeader(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            /*image: DecorationImage(
                fit: BoxFit.fill,
                image:  AssetImage('path/to/header_background.png'))*/
          ),
          child: Stack(children: <Widget>[
            Positioned(
                bottom: 12.0,
                left: 16.0,
                child: Wrap(
                  spacing: 20,
                  children: <Widget>[
                    Icon(
                      icon,
                      color: Colors.white,
                    ),
                    Text(text,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500))
                  ],
                )),
          ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _createHeader("", context: context),
          ListTile(
            title: const Text(
              "Home",
              style: TextStyle(fontSize: 18),
            ),
            leading: const Icon(Icons.house),
            onTap: () async {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MyHomePage(
                        title: "Carbon Intensity UK",
                      )));
            },
          ),
          _createHeader("Carbon Intensity",
              height: 50, context: context, icon: Icons.co2_outlined),
          ListTile(
            title: const Text(
              "Current National",
              style: TextStyle(fontSize: 18),
            ),
            leading: const Icon(Icons.bolt),
            onTap: () async {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CurrentNationalIntensityPage(
                        title: "Current National Intensity",
                      )));
            },
          ),
          ListTile(
            title: const Text(
              "List National",
              style: TextStyle(fontSize: 18),
            ),
            leading: const Icon(Icons.list),
            onTap: () async {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AllNationalIntensityPage(
                        title: "Current National Intensity",
                      )));
            },
          ),
          ListTile(
            title: const Text(
              "By Postcode",
              style: TextStyle(fontSize: 18),
            ),
            leading: const Icon(Icons.pin_drop),
            onTap: () async {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CurrentByPostCodePage(
                        title: "Intensity By Postcode",
                      )));
            },
          ),
          _createHeader("Generation Mix",
              height: 50, context: context, icon: Icons.bolt),
          ListTile(
            title: const Text(
              "Current National",
              style: TextStyle(fontSize: 18),
            ),
            leading: const Icon(Icons.language_outlined),
            onTap: () async {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CurrentGenMixPage(
                        title: "Current Gen Mix Data",
                      )));
            },
          ),
          ListTile(
            title: const Text(
              "By Region",
              style: TextStyle(fontSize: 18),
            ),
            leading: const Icon(Icons.map),
            onTap: () async {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AllRegionalIntensityPage(
                        title: "All Regions",
                      )));
            },
          ),
          _createHeader("Forecast Data",
              height: 50, context: context, icon: Icons.calendar_month),
          ListTile(
            title: const Text(
              "Regional (+24hr)",
              style: TextStyle(fontSize: 18),
            ),
            leading: const Icon(Icons.co2),
            onTap: () async {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const RegionalForecastPage(
                        title: "Regional Intensity (+24hr)",
                      )));
            },
          ),
          /*
          ListTile(
            title: const Text(
              "Settings",
              style: TextStyle(fontSize: 18),
            ),
            leading: const Icon(Icons.co2),
            onTap: () async {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SettingsPage(
                        title: "App Settings",
                      )));
            },
          ),*/
        ],
      ),
    );
  }
}
