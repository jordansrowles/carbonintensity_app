import 'package:flutter/material.dart';
import 'package:ukintensity_app/utils/utils.dart';
import 'package:ukintensity_app/utils/icon_utils.dart';
import 'package:ukintensity_integration/ukintensity_integration.dart';

class IntensityCard extends StatelessWidget {
  final IntensityData snapshot;

  IntensityCard({super.key, required this.snapshot}) {
    snapshot.intensity?.actual ??= 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(prettyDate(snapshot.to,
                  snapshot.from))
            ],
          ),
          // widget info row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "${snapshot.intensity!.actual! - snapshot.intensity!.forecast!}",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  getIntensityDeltaIcon(snapshot.intensity!.forecast! -
                      snapshot.intensity!.actual!),
                  getIntensityNumberIcon(
                      snapshot.intensity!.index),
                  Text(
                    snapshot.intensity!.index!
                        .toPascalCase(),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
              Column(children: <Widget>[
                Text(
                  'Forecast',
                  style: Theme.of(context).textTheme.headline3,
                ),
                Text(
                  '${snapshot.intensity!.forecast}',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  "gCO2/kWh",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ]),
              Column(children: <Widget>[
                Text(
                  'Actual',
                  style: Theme.of(context).textTheme.headline3,
                ),
                Text(
                  '${snapshot.intensity!.actual}',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  "gCO2/kWh",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ])
            ],
          )
        ],
      ),
    );
  }
}
