import 'package:flutter/material.dart';
import 'package:ukintensity_integration/ukintensity_integration.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GenMixChart extends StatefulWidget {
  final List<GenerationmixItem>? items;

  GenMixChart({Key? key, required List<GenerationmixItem>? this.items})
      : super(key: key) {
    items!.sort((a, b) => a.perc!.compareTo(b.perc!));
  }

  @override
  State<GenMixChart> createState() => _GenMixChartState();
}

class _GenMixChartState extends State<GenMixChart> {
  late List<GenerationmixItem>? items;

  @override
  void initState() {
    items = widget.items;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      children: <Widget>[
        SfCircularChart(
          legend: Legend(
              isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
          series: <DoughnutSeries<GenerationmixItem, String>>[
            DoughnutSeries<GenerationmixItem, String>(
                radius: '80%',
                explode: true,
                explodeOffset: '10%',
                dataSource: items,
                xValueMapper: (GenerationmixItem data, _) =>
                    data.fuel as String,
                yValueMapper: (GenerationmixItem data, _) => data.perc,
                dataLabelMapper: (GenerationmixItem data, _) => data.fuel,
                dataLabelSettings: const DataLabelSettings(isVisible: true))
          ],
        )
      ],
    ));
  }
}
