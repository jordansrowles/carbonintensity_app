import 'package:flutter/material.dart';
import 'package:ukintensity_app/widgets/accordian.dart';
import 'package:ukintensity_app/widgets/gen_mix/gen_mix_chart.dart';
import 'package:ukintensity_integration/ukintensity_integration.dart';

class RegionCard extends StatelessWidget {
  final Regions snapshot;

  RegionCard({super.key, required this.snapshot}) {
    //snapshot.intensity?.actual ??= 0; // if in future time, otherwise returns null
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Accordion(
                title:
                    "${snapshot.regionid.toString()}) ${snapshot.shortname.toString()} (${snapshot.dnoregion.toString()})",
                content: <Widget>[
                  GenMixSwitchChart(items: snapshot.generationmix, title: "Generation Mix Data"),
                  /*Accordion(title: "Generation Mix (Chart)", content: <Widget>[
                    GenMixChart(items: snapshot.generationmix)
                  ]),
                  Accordion(title: "Generation Mix (Table)", content: <Widget>[
                    GenMixTable(items: snapshot.generationmix)
                  ])*/
                ])
          ]),
    );
  }
}
