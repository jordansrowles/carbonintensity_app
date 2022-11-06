import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ukintensity_app/pages/home.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ukintensity_app/utils/utils.dart';
import 'package:ukintensity_app/widgets/drawer.dart';

class NoInternetPage extends StatefulWidget {
  const NoInternetPage({super.key, required this.title});
  final String title;

  @override
  State<NoInternetPage> createState() => _NoInternetPageState();
}

class _NoInternetPageState extends State<NoInternetPage> {
  _tryConnection(BuildContext context) async {
    final Connectivity _connectivity = Connectivity();
    ConnectivityResult result = await _connectivity.checkConnectivity();
    if (result == ConnectivityResult.none) {
      if (kDebugMode) {
        print("No internet");
      }
    } else {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const MyHomePage(
                title: "All Regions",
              )));
    }
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
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
                    "No internet connection! This app requires connection to the internet to query the API.",
                    style: Theme.of(context).textTheme.titleLarge,
                  ))
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                  Flexible(
                      child: ElevatedButton(
                          onPressed: () async {
                            await _tryConnection(context);
                          },
                          child: const Text('Try Connection'))),
                ]),
              ),
            ]))));
  }
}
