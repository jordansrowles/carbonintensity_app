import 'package:flutter/material.dart';
import 'package:ukintensity_app/utils/utils.dart';
import 'package:ukintensity_app/utils/icon_utils.dart';
import 'package:ukintensity_app/widgets/drawer.dart';
import 'package:ukintensity_app/widgets/intensity/intensity_card.dart';
import 'package:ukintensity_integration/ukintensity_integration.dart';

class CurrentNationalIntensityPage extends StatefulWidget {
  final String title;

  const CurrentNationalIntensityPage({super.key, required this.title});

  @override
  State<CurrentNationalIntensityPage> createState() => _CurrentNationalIntensityPageState();
}

class _CurrentNationalIntensityPageState extends State<CurrentNationalIntensityPage> {
  @override
  Widget build(BuildContext context) {
    Widget content;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.black12,
          centerTitle: true,
        ),
        drawer: const DrawerWidget(),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(children: <Widget>[
                FutureBuilder<NationalIntensity>(
                  future: NationalIntensityService.getCurrentHalfHour(), // a previously-obtained Future<String> or null
                  builder: (BuildContext context, AsyncSnapshot<NationalIntensity> snapshot) {
                    List<Widget> children;
                    if (snapshot.hasData) {
                      children = <Widget>[
                        // datetime row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[Text(prettyDate(snapshot.data!.data![0].from, snapshot.data!.data![0].to))],
                        ),
                        // widget info row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  "${snapshot.data!.data![0].intensity!.actual! - snapshot.data!.data![0].intensity!.forecast!}",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                getIntensityDeltaIcon(
                                    snapshot.data!.data![0].intensity!.forecast! - snapshot.data!.data![0].intensity!.actual!),
                                getIntensityNumberIcon(snapshot.data!.data![0].intensity!.index),
                                Text(
                                  snapshot.data!.data![0].intensity!.index!.toPascalCase(),
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
                                '${snapshot.data!.data![0].intensity!.forecast}',
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
                                '${snapshot.data!.data![0].intensity!.actual}',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              Text(
                                "gCO2/kWh",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ])
                          ],
                        )
                        /*
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(prettyDate(snapshot.data!.data![0].to, snapshot.data!.data![0].from)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Icon(
                    getIconFromIntensityIndex(snapshot.data!.data![0].intensity!.index),
                    color: getColourFromIntensityIndex(snapshot.data!.data![0].intensity!.index),
                    size: 80,
                  ),
                  Text(
                      snapshot.data!.data![0].intensity!.index!.toPascalCase(),
                      style: Theme.of(context).textTheme.headline3
                  )
                ]),*/
                      ];
                    } else if (snapshot.hasError) {
                      children = <Widget>[
                        const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text('Error: ${snapshot.error}'),
                        ),
                      ];
                    } else {
                      children = const <Widget>[
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: CircularProgressIndicator(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Text('Awaiting result...'),
                        ),
                      ];
                    }
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: children,
                      ),
                    );
                  },
                )
              ])),
        ));
  }
}
