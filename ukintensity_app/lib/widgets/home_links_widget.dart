import 'package:carbon_intensity_uk/utils.dart';
import 'package:flutter/material.dart';
import 'package:ukintensity_integration/ukintensity_integration.dart';

class HomeLinksWidget extends StatefulWidget {
  final String? heading;
  final String? text;

  HomeLinksWidget(
      {Key? key,
        required String? this.heading,
        required String? this.text,
      }) : super(key: key);

  @override
  _HomeLinksWidget createState() => _HomeLinksWidget();
}

class _HomeLinksWidget extends State<HomeLinksWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.co2),
                  title: Text(widget.heading!),
                  subtitle: Text(widget.text!),
                )
              ],
            ),
          ),
        )
    );
  }
}
