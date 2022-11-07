import 'package:flutter/material.dart';
import 'package:ukintensity_app/utils/icon_utils.dart';
import 'package:ukintensity_app/utils/utils.dart';
import 'package:ukintensity_integration/ukintensity_integration.dart';

class GenMixTable extends StatelessWidget {
  final List<GenerationMixItem>? items;

  GenMixTable({Key? key, required this.items}) : super(key: key) {
    items!.sort((a, b) => b.perc!.compareTo(a.perc!));
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
        ])
      ],
    ));
  }
}
