import 'package:carbon_intensity_uk/utils.dart';
import 'package:flutter/material.dart';
import 'package:ukintensity_integration/ukintensity_integration.dart';

class TextCardWidget extends StatefulWidget {
  final String? heading;
  final String? text;

  TextCardWidget(
      {Key? key,
        required String? this.heading,
        required String? this.text,
      }) : super(key: key);

  @override
  _TextCardWidget createState() => _TextCardWidget();
}

class _TextCardWidget extends State<TextCardWidget> {
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
                contentPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
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
