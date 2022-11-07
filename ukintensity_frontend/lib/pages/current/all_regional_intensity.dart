import 'package:flutter/material.dart';
import 'package:ukintensity_app/utils/utils.dart';
import 'package:ukintensity_app/widgets/drawer.dart';
import 'package:ukintensity_app/widgets/intensity/region_card.dart';
import 'package:ukintensity_integration/ukintensity_integration.dart';

class AllRegionalIntensityPage extends StatefulWidget {
  final String title;

  const AllRegionalIntensityPage({super.key, required this.title});

  @override
  State<AllRegionalIntensityPage> createState() =>
      _AllRegionalIntensityPageState();
}

class _AllRegionalIntensityPageState extends State<AllRegionalIntensityPage> {
  @override
  initState() {
    late bool result = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      result = tryConnection();
    });
    if (result == false) {
      Future.delayed(Duration(milliseconds: 100)).then((_) {
        Navigator.pushReplacementNamed(context, '/home');
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: const DrawerWidget(),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(children: <Widget>[
                FutureBuilder<RegionalIntensity>(
                  future: RegionalIntensityService
                      .all(), // a previously-obtained Future<String> or null
                  builder: (BuildContext context,
                      AsyncSnapshot<RegionalIntensity> snapshot) {
                    List<Widget> children;
                    if (snapshot.hasData) {
                      children = <Widget>[
                        Text(prettySingleDate(snapshot.data!.data![0].from)),
                        for (var i = 0;
                            i < snapshot.data!.data![0].regions!.length;
                            i++)
                          RegionCard(
                              snapshot: snapshot.data!.data![0].regions![i])
                        //if (snapshot.data!.data![i].intensity!.actual! != null)
                        //IntensityCard(snapshot: snapshot.data!.data![i])
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
