import 'package:flutter/material.dart';
import 'package:ukintensity_app/utils/utils.dart';
import 'package:ukintensity_app/utils/icon_utils.dart';
import 'package:ukintensity_integration/ukintensity_integration.dart';

class IntensityCard extends StatelessWidget {
  final IntensityData snapshot;

  IntensityCard({super.key, required this.snapshot}) {
    snapshot.intensity?.actual ??= 0; // if in future time, otherwise returns null
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text(prettyDate(snapshot.from, snapshot.to), style: Theme.of(context).textTheme.bodyMedium)],
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
                    getIntensityDeltaIcon(snapshot.intensity!.forecast! - snapshot.intensity!.actual!),
                    getIntensityNumberIcon(snapshot.intensity!.index),
                    Text(
                      snapshot.intensity!.index!.toPascalCase(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                Column(children: <Widget>[
                  Text(
                    'Forecast',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    '${snapshot.intensity!.forecast}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "gCO2/kWh",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ]),
                Column(children: <Widget>[
                  Text(
                    'Actual',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    '${snapshot.intensity!.actual}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "gCO2/kWh",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ])
              ],
            )
          ],
        ));
  }
}
