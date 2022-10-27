import 'package:flutter/material.dart';
import 'package:ukintensity_integration/ukintensity_integration.dart';

class GenMixTable extends StatelessWidget {
  final List<GenerationmixItem>? items;

  GenMixTable({Key? key, required List<GenerationmixItem>? this.items})
      : super(key: key) {
    items!.sort((a, b) => a.perc!.compareTo(b.perc!));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      children: <Widget>[
        DataTable(columns: const <DataColumn>[
          DataColumn(label: Expanded(child: Text('Fuel'))),
          DataColumn(label: Expanded(child: Text('Percentile')))
        ], rows: <DataRow>[
          for (var genItem in items!)
            DataRow(cells: <DataCell>[
              DataCell(Text(genItem.fuel!)),
              DataCell(Text(genItem.perc!.toString()))
            ])
        ])
      ],
    ));
  }
}
