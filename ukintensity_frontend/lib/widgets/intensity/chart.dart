import 'package:flutter/material.dart';
import 'package:ukintensity_integration/ukintensity_integration.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class IntensityChart extends StatelessWidget {
  final List<IntensityData> data;

  const IntensityChart({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: <Widget>[
          SfCartesianChart(
            legend: Legend(isVisible: true, position: LegendPosition.bottom),
            primaryXAxis: DateTimeAxis(),
            //primaryYAxis: DateTimeAxis(),
            series: <AreaSeries<IntensityData, DateTime>>[
              AreaSeries(
                  dataSource: data,
                  xValueMapper: (IntensityData intensity, _) =>
                      DateTime.parse(intensity.from as String),
                  yValueMapper: (IntensityData intensity, _) =>
                      intensity.intensity!.forecast,
                  color: Colors.blue,
                  legendItemText: "Forecast"),
              AreaSeries(
                  dataSource: data,
                  xValueMapper: (IntensityData intensity, _) =>
                      DateTime.parse(intensity.from as String),
                  yValueMapper: (IntensityData intensity, _) =>
                      intensity.intensity!.actual,
                  color: Colors.red,
                  opacity: 0.8,
                  legendItemText: "Actual"),
            ],
          )
        ],
      ),
    );
  }
}
