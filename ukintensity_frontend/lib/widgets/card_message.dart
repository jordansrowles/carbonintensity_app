import 'package:flutter/material.dart';

class CardMessage extends StatelessWidget {
  final String? heading;
  final String? text;

  CardMessage({
    Key? key,
    required String? this.heading,
    required String? this.text,
  }) : super(key: key);

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
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              leading: const Icon(Icons.co2),
              title: Text(heading!),
              subtitle: Text(text!),
            )
          ],
        ),
      ),
    ));
  }
}
