import 'package:flutter/material.dart';
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
                  Text("UK", style: Theme.of(context).textTheme.titleLarge,)
                ])),
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(children: <Widget>[
                  FutureBuilder<NationalIntensity>(
                    future: NationalIntensityService.getCurrentHalfHour(), // a previously-obtained Future<String> or null
                    builder: (BuildContext context, AsyncSnapshot<NationalIntensity> snapshot) {
                      List<Widget> children;
                      if (snapshot.hasData) {
                        children = <Widget>[
                          IntensityCard(
                            snapshot: snapshot.data!.data![0],
                          )
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
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(children: <Widget>[
                  Text("England", style: Theme.of(context).textTheme.titleLarge,)
                ])),
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(children: <Widget>[
                  FutureBuilder<NationIntensity>(
                    future: NationIntensityService.england(), // a previously-obtained Future<String> or null
                    builder: (BuildContext context, AsyncSnapshot<NationIntensity> snapshot) {
                      List<Widget> children;
                      if (snapshot.hasData) {
                        children = <Widget>[
                          IntensityCard(
                            snapshot: snapshot.data!.data![0].data![0],
                            showActual: false,
                          )
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
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(children: <Widget>[
                  Text("Scotland", style: Theme.of(context).textTheme.titleLarge,)
                ])),
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(children: <Widget>[
                  FutureBuilder<NationIntensity>(
                    future: NationIntensityService.scotland(), // a previously-obtained Future<String> or null
                    builder: (BuildContext context, AsyncSnapshot<NationIntensity> snapshot) {
                      List<Widget> children;
                      if (snapshot.hasData) {
                        children = <Widget>[
                          IntensityCard(
                            snapshot: snapshot.data!.data![0].data![0],
                            showActual: false,
                          )
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
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(children: <Widget>[
                  Text("Wales", style: Theme.of(context).textTheme.titleLarge,)
                ])),
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(children: <Widget>[
                  FutureBuilder<NationIntensity>(
                    future: NationIntensityService.wales(), // a previously-obtained Future<String> or null
                    builder: (BuildContext context, AsyncSnapshot<NationIntensity> snapshot) {
                      List<Widget> children;
                      if (snapshot.hasData) {
                        children = <Widget>[
                          IntensityCard(
                            snapshot: snapshot.data!.data![0].data![0],
                            showActual: false,
                          )
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

