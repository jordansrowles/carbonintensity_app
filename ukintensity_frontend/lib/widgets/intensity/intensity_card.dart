import 'package:flutter/material.dart';
import 'package:ukintensity_app/utils/colours.dart';
import 'package:ukintensity_app/utils/utils.dart';
import 'package:ukintensity_app/utils/icon_utils.dart';
import 'package:ukintensity_integration/ukintensity_integration.dart';

class IntensityCard extends StatelessWidget {
  final IntensityData snapshot;

  /// show datetime string at top
  final bool showDate;

  /// display forecast and actual in the same column
  final bool isCompact;

  /// display actual column
  final bool showActual;

  /// display forecast column
  final bool showForecast;

  IntensityCard(
      {super.key,
      required this.snapshot,
      this.isCompact = false,
      this.showDate = false,
      this.showActual = true,
      this.showForecast = true}) {
    snapshot.intensity?.actual ??=
        0; // if in future time, otherwise returns null
  }

  @override
  Widget build(BuildContext context) {
    if (!isCompact) {
      // return a compact style container, with 2 columns
      return Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              if (showDate == true)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(prettyDate(snapshot.from, snapshot.to),
                        style: Theme.of(context).textTheme.bodyMedium)
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
                      getIntensityNumberIcon(snapshot.intensity!.index),
                      Text(
                        snapshot.intensity!.index!.toPascalCase(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  if (showForecast)
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
                  if (showActual)
                    Column(children: <Widget>[
                      Text(
                        'Actual',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      if (snapshot.intensity!.actual == null ||
                          snapshot.intensity!.actual == 0)
                        Text(
                          'No data',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      if (snapshot.intensity!.actual != null &&
                          snapshot.intensity!.actual! > 0)
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
              ),
            ],
          ));
    } else {
      // return a full sized container, with 3 columns
      return Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              if (showDate == true)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(prettyDate(snapshot.from, snapshot.to),
                        style: Theme.of(context).textTheme.bodyMedium)
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
                      getIntensityDeltaIcon(
                          snapshot.intensity!.forecast! -
                              snapshot.intensity!.actual!,
                          size: 15),
                      getIntensityNumberIcon(snapshot.intensity!.index,
                          size: 35),
                      Text(
                        snapshot.intensity!.index!.toPascalCase(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  if (showForecast)
                    Column(children: <Widget>[
                      Column(
                        children: <Widget>[
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
                        ],
                      ),
                      if (showActual)
                        Column(
                          children: <Widget>[
                            Text(
                              'Actual',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            if (snapshot.intensity!.actual == null ||
                                snapshot.intensity!.actual == 0)
                              Text(
                                'No data',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            if (snapshot.intensity!.actual != null &&
                                snapshot.intensity!.actual! > 0)
                              Text(
                                '${snapshot.intensity!.actual}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            Text(
                              "gCO2/kWh",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                    ]),
                ],
              ),
              Row(
                children: <Widget>[
                  Divider(
                    thickness: 2,
                    height: 2,
                    color: mySwatch.shade400,
                  )
                ],
              )
            ],
          ));
    }
  }
}
