import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ukintensity_app/utils/utils.dart';
import 'package:ukintensity_app/widgets/drawer.dart';

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
          //backgroundColor: Colors.black12,
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
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                      Flexible(child: ElevatedButton(onPressed: _launchSite, child: const Text('API Website'))),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                      Flexible(child: ElevatedButton(onPressed: _launchDocs, child: const Text('API Documentation'))),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                      Flexible(child: ElevatedButton(onPressed: _launchEndpoints, child: const Text('API Endpoints'))),
                    ]),
                  ),
                ]),
          ),
        )
        );
  }
}
