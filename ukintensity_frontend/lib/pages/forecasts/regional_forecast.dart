import 'package:flutter/material.dart';
import 'package:ukintensity_app/widgets/drawer.dart';
import 'package:ukintensity_app/widgets/regions/nations_forecast.dart';
import 'package:ukintensity_integration/ukintensity_integration.dart';

class RegionalForecastPage extends StatelessWidget {
  final String title;
  const RegionalForecastPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        drawer: const DrawerWidget(),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(children: <Widget>[
                  const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                          "Average forecasted carbon intensity for each region in the UK over the next 24 hours.")),
                  FutureBuilder<RegionalIntensity>(
                      future: RegionalIntensityService.all(),
                      builder: (BuildContext ctx,
                              AsyncSnapshot<RegionalIntensity> snapshot) =>
                          snapshot.hasData
                              ? Center(
                                  child: Column(
                                  children: [
                                    RegionsForecastWidget(
                                        title: "title",
                                        regions:
                                            snapshot.data!.data![0].regions!)
                                  ],
                                ))
                              : const Center(
                                  // render the loading indicator
                                  child: CircularProgressIndicator(),
                                ))
                ]))));
  }
}
