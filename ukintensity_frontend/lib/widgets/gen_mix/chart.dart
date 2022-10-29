import 'package:flutter/material.dart';
import 'package:ukintensity_integration/ukintensity_integration.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GenMixChart extends StatelessWidget {
  final List<GenerationMixItem>? items;

  GenMixChart({Key? key, required this.items}) : super(key: key) {
    items!.sort((a, b) => a.perc!.compareTo(b.perc!));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      children: <Widget>[
        SfCircularChart(
          legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
          series: <DoughnutSeries<GenerationMixItem, String>>[
            DoughnutSeries<GenerationMixItem, String>(
                radius: '80%',
                explode: true,
                explodeOffset: '10%',
                dataSource: items,
                xValueMapper: (GenerationMixItem data, _) => data.fuel as String,
                yValueMapper: (GenerationMixItem data, _) => data.perc,
                dataLabelMapper: (GenerationMixItem data, _) => data.fuel,
                dataLabelSettings: const DataLabelSettings(isVisible: true))
          ],
        )
      ],
    ));
  }
}
