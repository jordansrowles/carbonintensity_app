import 'package:flutter/material.dart';
import 'package:ukintensity_integration/ukintensity_integration.dart';

class RegionsForecastWidget extends StatelessWidget {
  final String title;
  final List<Regions> regions;
  const RegionsForecastWidget(
      {super.key, required this.title, required this.regions});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20, left: 5, right: 5),
        child: DataTable(columns: const <DataColumn>[
          DataColumn(label: Expanded(child: Text('#'))),
          DataColumn(label: Expanded(child: Text('Region'))),
          DataColumn(label: Expanded(child: Text('Forecast'))),
        ], rows: <DataRow>[
          for (var region in regions)
            DataRow(cells: <DataCell>[
              DataCell(Text(region.regionid!.toString())),
              DataCell(Text(region.shortname!)),
              DataCell(
                Text(
                    "${region.intensity!.index!} (${region.intensity!.forecast.toString()})"),
              ),
            ])
        ]));
  }
}
