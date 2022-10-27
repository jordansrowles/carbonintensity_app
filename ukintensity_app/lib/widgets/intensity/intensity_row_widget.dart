import 'dart:convert';
import 'package:carbon_intensity_uk/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:ukintensity_integration/ukintensity_integration.dart';

class IntensityRowItemWidget extends StatefulWidget {
  final IntensityData intensity;

  const IntensityRowItemWidget({super.key, required this.intensity});

  @override
  State<StatefulWidget> createState() => _IntensityRowItemWidgetState();

}

class _IntensityRowItemWidgetState extends State<IntensityRowItemWidget> {
  late IntensityData intensity;
  late int delta;
  late String prettyStart, prettyEnd;

  _IntensityRowItemWidgetState() {
    update();
  }

  @override
  void setState(VoidCallback fn) {
    update();
    super.setState(fn);
  }

  void update() {
    intensity = widget.intensity;
    delta = (intensity.intensity!.forecast! - intensity.intensity!.actual!);
    prettyStart = DateFormat("yyyy MM dd (HH:MM -").format(DateTime.parse(intensity.from!));
    prettyEnd = DateFormat("HH:MM)").format(DateTime.parse(intensity.to!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(bottom: 15, left: 30, right: 30),
        /*
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: Colors.black12,
          style: BorderStyle.solid
        ),
        borderRadius: BorderRadius.circular(20),
        color: Colors.black12
      ),*/
        child: Center(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("$prettyStart $prettyEnd")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(children: <Widget>[
                      Text("$delta", style: Theme.of(context).textTheme.headline6,),
                      Icon(
                        determineDeltaChevron(delta),
                        size: 35,
                        color: determineDeltaChevronColour(delta),
                      ),
                      Icon(
                        getIconFromIntensityIndex(intensity.intensity?.index),
                        size: 50.0,
                        color: getColourFromIntensityIndex(intensity.intensity?.index),
                      ),
                      Text("${intensity.intensity?.index?.toPascalCase()}", style: Theme.of(context).textTheme.headline6,),
                    ],
                    ),
                    Column(children: <Widget>[
                      Text('Forecast', style: Theme.of(context).textTheme.headline3,),
                      Text('${intensity.intensity!.forecast}', style: Theme.of(context).textTheme.headline4,),
                      Text("gCO2/kWh", style: Theme.of(context).textTheme.headline6,),
                    ]),
                    Column(children: <Widget>[
                      Text('Actual', style: Theme.of(context).textTheme.headline3,),
                      Text('${intensity.intensity!.actual}', style: Theme.of(context).textTheme.headline4,),
                      Text("gCO2/kWh", style: Theme.of(context).textTheme.headline6,),
                    ])
                  ],
                )
              ],
            )
        ),
      )
    );


  }

}