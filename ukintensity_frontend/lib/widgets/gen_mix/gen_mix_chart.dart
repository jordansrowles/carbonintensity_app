import 'package:flutter/material.dart';
import 'package:ukintensity_app/utils/icon_utils.dart';
import 'package:ukintensity_app/utils/utils.dart';
import 'package:ukintensity_integration/ukintensity_integration.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GenMixSwitchChart extends StatefulWidget {
  final List<GenerationMixItem>? items;
  final String title;

  GenMixSwitchChart({Key? key, required this.items, required this.title})
      : super(key: key) {
    items!.sort((b, a) => a.perc!.compareTo(b.perc!));
  }

  @override
  State<GenMixSwitchChart> createState() => _GenMixSwitchChartState();
}

class _GenMixSwitchChartState extends State<GenMixSwitchChart> {
  int status = 0; // 0 graph, 1 data, 2 hilo

  void changeStatus() {
    status++;
    if (status == 3) status = 0;
    //widget.items!.sort((a, b) => a.perc!.compareTo(b.perc!));
  }

  Widget pieChart() {
    return SfCircularChart(
      legend:
          Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
      series: <DoughnutSeries<GenerationMixItem, String>>[
        DoughnutSeries<GenerationMixItem, String>(
            radius: '80%',
            explode: true,
            explodeOffset: '10%',
            dataSource: widget.items,
            xValueMapper: (GenerationMixItem data, _) => data.fuel as String,
            yValueMapper: (GenerationMixItem data, _) => data.perc,
            dataLabelMapper: (GenerationMixItem data, _) => data.fuel,
            dataLabelSettings: const DataLabelSettings(isVisible: true))
      ],
    );
  }

  Widget table() {
    return DataTable(columns: const <DataColumn>[
      DataColumn(label: Expanded(child: Text('Fuel'))),
      DataColumn(label: Expanded(child: Text('Percentile')))
    ], rows: <DataRow>[
      for (var genItem in widget.items!)
        DataRow(cells: <DataCell>[
          DataCell(Row(
            children: [
              getGenMixIcon(genItem.fuel!),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(genItem.fuel!.toPascalCase()),
              )
            ],
          )),
          DataCell(Text(genItem.perc!.toString()))
        ])
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(10),
        child: SizedBox(
          child: Column(children: [
            Material(
              child: ListTile(
                title: Text(widget.title),
                trailing: IconButton(
                  icon: const Icon(Icons.tune),
                  onPressed: () {
                    setState(() {
                      changeStatus();
                    });
                  },
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    children: [
                      if (status == 0) pieChart(),
                      if (status == 1) table(),
                      if (status == 2)
                        Column(
                          children: [
                            pieChart(),
                            table(),
                          ],
                        )
                    ],
                  ),
                )
              ],
            ),
          ]),
        ));
  }
}
