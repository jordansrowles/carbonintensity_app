import 'package:carbon_intensity_uk/utils.dart';
import 'package:carbon_intensity_uk/widgets/intensity/intensity_row_widget.dart';
import 'package:carbon_intensity_uk/widgets/intensity/national_intensity_widget.dart';
import 'package:carbon_intensity_uk/widgets/nav_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:ukintensity_integration/ukintensity_integration.dart';

class NationalIntensityPage extends StatefulWidget {
  final NationalIntensity intensity;
  const NationalIntensityPage({super.key, required this.intensity});

  @override
  State<NationalIntensityPage> createState() => _NationalIntensityPage();
}

class _NationalIntensityPage extends State<NationalIntensityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(title: const Text("Today's National Intensity")),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: <Widget>[
                NationalIntensityWidget(
                  actual: widget.intensity.data![0]?.intensity?.actual,
                  forecast: widget.intensity.data![0]?.intensity?.forecast,
                  index: widget.intensity.data![0]?.intensity?.index,
                  icon: getIconFromIntensityIndex(
                      widget.intensity.data![0]?.intensity?.index),
                ),
                IntensityRowItemWidget(intensity: widget.intensity.data![0]),

                /*for (IntensityData item in widget.intensity.data!)
                  NationalIntensityWidget(
                      forecast: item.intensity?.forecast, 
                      actual: item.intensity?.actual, 
                      index: item.intensity?.index, 
                      icon: getIconFromIntensityIndex(item.intensity?.index))*/
              ],
            )


        )
        )
    );
  }
}
