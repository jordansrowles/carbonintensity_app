import 'dart:convert';
import 'package:carbon_intensity_uk/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ukintensity_integration/ukintensity_integration.dart';

class NationalIntensityWidget extends StatefulWidget {
  final int? forecast;
  final int? actual;
  final String? index;
  final IconData icon;

  NationalIntensityWidget(
      {Key? key,
      required int? this.forecast,
      required int? this.actual,
      required String? this.index,
      required IconData this.icon})
      : super(key: key);

  @override
  _NationalIntensityWidget createState() => _NationalIntensityWidget();
}

class _NationalIntensityWidget extends State<NationalIntensityWidget> {
  @override
  Widget build(BuildContext context) {
    final int delta = (widget.actual! - widget.forecast!);

    return Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.center,// make the number center of the column
              children: <Widget>[
                Icon(
                  widget.icon,
                  size: 50.0,
                  color: getColourFromIntensityIndex(widget.index),
                ),
                Text("${widget.index?.toPascalCase()}", style: Theme.of(context).textTheme.headline6,)
              ],

          ),

          // Forecast / Actual info row
          Row(
            // space the two columns evenly across the main column
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text('Forecast', style: Theme.of(context).textTheme.headline3,),
                  Text('${widget.forecast}', style: Theme.of(context).textTheme.headline4,),
                  Text("gCO2/kWh", style: Theme.of(context).textTheme.headline6,),
                ],
              ),
              Column(
                children: <Widget>[
                  Text('Actual', style: Theme.of(context).textTheme.headline3,),
                  Text('${widget.actual}', style: Theme.of(context).textTheme.headline4,),
                  Text("gCO2/kWh", style: Theme.of(context).textTheme.headline6,),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(50),
                /*decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                    color: Colors.black26,
                  )
                ),*/
                child: Column(children: <Widget>[
                  Text("$delta", style: Theme.of(context).textTheme.headline6,),
                  Icon(
                    determineDeltaChevron(delta),
                    size: 35,
                    color: determineDeltaChevronColour(delta),
                  ),
                ]),
              )
            ],
          )
        ],
      )
    );
  }
}
