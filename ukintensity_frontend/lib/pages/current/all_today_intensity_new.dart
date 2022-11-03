import 'package:flutter/material.dart';
import 'package:ukintensity_app/widgets/accordian.dart';
import 'package:ukintensity_app/widgets/drawer.dart';
import 'package:ukintensity_app/widgets/intensity/chart.dart';
import 'package:ukintensity_app/widgets/intensity/intensity_card.dart';
import 'package:ukintensity_integration/ukintensity_integration.dart';

class AllNationalIntensityPage extends StatefulWidget {
  final String title;

  const AllNationalIntensityPage({super.key, required this.title});

  @override
  State<AllNationalIntensityPage> createState() => _AllNationalIntensityPageState();
}

class _AllNationalIntensityPageState extends State<AllNationalIntensityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: const DrawerWidget(),
        body: ListView(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(children: <Widget>[
                  FutureBuilder<NationalIntensity>(
                    future: NationalIntensityService.getToday(), // a previously-obtained Future<String> or null
                    builder: (BuildContext context, AsyncSnapshot<NationalIntensity> snapshot) {
                      List<Widget> children;
                      if (snapshot.hasData) {
                        children = <Widget>[
                          IntensityChart(data: snapshot.data!.data!),
                          Accordion(title: "Breakdown", content: <Widget>[
                            for (var i = 0; i < snapshot.data!.data!.length; i++)
                              //if (snapshot.data!.data![i].intensity!.actual! != null)
                              IntensityCard(snapshot: snapshot.data!.data![i], showDate: true, isCompact: true)
                          ]),
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
          ],
        ));
  }
}
