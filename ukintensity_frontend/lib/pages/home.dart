import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ukintensity_app/utils/utils.dart';
import 'package:ukintensity_app/widgets/drawer.dart';
import 'package:ukintensity_app/widgets/gen_mix/chart.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _launchDocs() async {
    if (!await launchUrl(Uri.parse("https://carbon-intensity.github.io/api-definitions/"))) {
      throw 'Could not launch docs';
    }
  }

  _launchSite() async {
    if (!await launchUrl(Uri.parse("https://carbonintensity.org.uk/"))) {
      throw 'Could not launch site';
    }
  }

  _launchEndpoints() async {
    if (!await launchUrl(Uri.parse("https://api.carbonintensity.org.uk/"))) {
      throw 'Could not launch site';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.black12,
        ),
        drawer: const DrawerWidget(),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                      Flexible(
                          child: Text(
                        'Carbon Intensity UK',
                        style: Theme.of(context).textTheme.headline3,
                      )),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
                      Flexible(
                          child: Text(
                        homeDetails,
                        style: Theme.of(context).textTheme.titleLarge,
                      ))
                    ]),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(onPressed: _launchSite, child: const Text('API Website')),
                          const Spacer(),
                          ElevatedButton(onPressed: _launchDocs, child: const Text('API Documentation')),
                          const Spacer(),
                          ElevatedButton(onPressed: _launchEndpoints, child: const Text('API Endpoints'))
                        ],
                      ))
                ]),
          ),
        )

        /*Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),*/
        );
  }
}
