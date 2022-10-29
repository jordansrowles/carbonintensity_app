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
                      children = <Widget>[IntensityCard(snapshot: snapshot.data!.data![0])];
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
