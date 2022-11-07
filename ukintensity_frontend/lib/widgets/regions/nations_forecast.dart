import 'package:flutter/material.dart';
import 'package:ukintensity_integration/ukintensity_integration.dart';

class NationsForecastWidget extends StatelessWidget {
  final String title;
  const NationsForecastWidget({super.key, required this.title});

  Future<List<NationIntensity>> getIntensities() {
    throw Future.error("");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(children: <Widget>[
          FutureBuilder<List<NationIntensity>>(
            future:
                getIntensities(), // a previously-obtained Future<String> or null
            builder: (BuildContext context,
                AsyncSnapshot<List<NationIntensity>> snapshot) {
              List<Widget> children;
              if (snapshot.hasData) {
                children = <Widget>[
                  /*
                        Text(prettySingleDate(snapshot.data!.data![0].from)),
                        for (var i = 0; i < snapshot.data!.data![0].regions!.length; i++)
                          RegionCard(snapshot: snapshot.data!.data![0].regions![i])
                        //if (snapshot.data!.data![i].intensity!.actual! != null)
                        //IntensityCard(snapshot: snapshot.data!.data![i])*/
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
        ]));
  }
}
